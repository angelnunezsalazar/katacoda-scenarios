DEBUG=false
GITHUB="github.com"
GITHUBAPIURL="https://api.github.com"
COLQUESTION="\u001b[36m"
COLINFO="\u001b[37m"
COLLOGS="\u001b[35m"
COLRESET="\u001b[0m"
REPO=pet-clinic
LABS_URL=https://katacoda.com/devopslabs

if [ "$DEBUG" = false ] ; then
  CURL_NODEBUG="-sS"
fi

# Ask for GitHub PAT
echo -e "${COLQUESTION}Please enter your ${GITHUB} Personal Access Token:${COLRESET}"
read GITHUB_TOKEN

echo -e "${COLLOGS}"
echo -e "${COLINFO}Fetching your details from GitHub...${COLRESET}"
USER_JSON=$(curl ${CURL_NODEBUG} -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" -X GET ${GITHUBAPIURL}/user)

GITHUB_USERNAME=$(echo $USER_JSON | jq -r '.login')

EMAIL=$(echo $USER_JSON | jq -r '.email//empty')
if [ -z "$EMAIL" ]; then
  EMAIL=${GITHUB_USERNAME}@noemail.com
fi

git config --global user.email "${EMAIL}"

JENKINS_URL=`curl ${CURL_NODEBUG} "https://katacoda.com/metadata/generate-url?port=8080&ip=$(ip addr show ens3 | grep -Po 'inet \K[\d.]+')"`

check_if_repository_exists(){
  echo -e "${COLLOGS}"
  curl ${CURL_NODEBUG} -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" -X GET ${GITHUBAPIURL}/repos/$GITHUB_USERNAME/$REPO/contents/Jenkinsfile | grep "Not Found"
  REPO_DOES_NOT_EXIST=$?
  if [ $REPO_DOES_NOT_EXIST -eq 0 ]; then
    echo -e "${COLQUESTION}Error: it seems that $REPO repository under your GitHub username doesn't exist."
    echo -e "> Go through the Welcome module which will set everything up for you:"
    echo -e "> $LABS_URL"
    exit 1
  fi
}
check_if_repository_exists

download_repository_petclinic()
{
  echo -e "${COLINFO}Downloading Repository 'pet clinic' ...${COLRESET}"
  git clone "https://github.com/${GITHUB_USERNAME}/pet-clinic"
  echo -e "${COLINFO}Repository Downloaded${COLRESET}"
}
download_repository_petclinic

bringing_up_nginx_dashboard_with_github_links(){
  echo -e "${COLINFO}Preparing tab to link to ${GITHUB}...${COLRESET}"
  echo -e "${COLLOGS}"
  sed -i "s/github_url/${GITHUB}\/${GITHUB_USERNAME}\/pet-clinic/g" ~/nginx/index.html
  docker run --name nginx -p 9876:80 -v /root/nginx:/usr/share/nginx/html:ro -d nginx 
  NginxUrl=`curl ${CURL_NODEBUG} "https://katacoda.com/metadata/generate-url?port=9876&ip=$(ip addr show ens3 | grep -Po 'inet \K[\d.]+')"`
}
bringing_up_nginx_dashboard_with_github_links

wait_for_nginx(){
  echo -e "${COLINFO}Waiting for Nginx to come up...${COLRESET}"
  echo -e "${COLLOGS}"

  for i in {1..60}
  do
    if (( $( curl -s ${NginxUrl} | grep -c "GitHub" ) > 0)); then
      touch /tmp/nginx_ready
      break
    fi
    echo "Retry $i..."
    sleep 5s
  done

  echo -e "${COLINFO}Nginx is up and running${COLRESET}"
  echo -e "${COLLOGS}"
}
wait_for_nginx

remove_existing_webhook(){
  echo -e "${COLINFO}Configuring your GitHub $REPO repository...${COLRESET}"
  echo -e "${COLLOGS}"
  curl ${CURL_NODEBUG} -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" -X GET ${GITHUBAPIURL}/repos/$GITHUB_USERNAME/$REPO/hooks | jq -r '.[] .id' > ids.txt
  filename="ids.txt"

  while read -r line
  do
      name="$line"
          curl ${CURL_NODEBUG} -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" -X DELETE ${GITHUBAPIURL}/repos/$GITHUB_USERNAME/$REPO/hooks/"$line"
  done < "$filename"
}
remove_existing_webhook

bringing_up_jenkins(){
  echo -e "${COLINFO}Bringing up Jenkins...${COLRESET}"
  echo -e "${COLLOGS}"
  docker pull snahider/devopslabsonline-jenkins:jcasc
  docker run --name jenkins -d -p 8080:8080 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e GITHUB_USERNAME=$GITHUB_USERNAME \
    -e GITHUB_TOKEN=$GITHUB_TOKEN \
    -e JENKINS_URL="https://${JENKINS_URL}" \
    snahider/devopslabsonline-jenkins:jcasc
}
bringing_up_jenkins

adding_webhook(){
  echo -e "${COLINFO}Updating GitHub web hook to point to Katacoda Jenkins...${COLRESET}"
  echo -e "${COLLOGS}"
  curl ${CURL_NODEBUG} -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" -X POST --data '{"name": "web","active": true,"events": [ "push", "pull_request" ], "config":{"url": "https://'"$JENKINS_URL"'/github-webhook/","content_type":"json"}}' ${GITHUBAPIURL}/repos/$GITHUB_USERNAME/$REPO/hooks
}
adding_webhook

wait_for_jenkins(){
  echo -e "${COLINFO}Waiting for Jenkins to come up...${COLRESET}"
  echo -e "${COLLOGS}"

  for i in {1..60}
  do
    if (( $( curl -s ${JENKINS_URL} | grep -c "Authentication" ) > 0)); then
      touch /tmp/jenkins_ready
      break
    fi
    echo "Retry $i..."
    sleep 5s
  done

  echo -e "${COLINFO}Jenkins is up and running${COLRESET}"
  echo -e "${COLLOGS}"
}
wait_for_jenkins

echo -e "${COLINFO}You are all set! Click on 'CONTINUE'.${COLRESET}"
