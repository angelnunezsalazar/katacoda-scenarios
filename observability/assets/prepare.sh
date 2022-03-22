TERRAFORM_VERSION="0.14.2"

COLQUESTION="\u001b[36m" #verde
COLINFO="\u001b[37m" #plomo
COLLOGS="\u001b[35m" #morado
COLRESET="\u001b[m"

STOREDOG_HOST=`curl ${CURL_NODEBUG} "https://katacoda.com/metadata/generate-url?port=3000&ip=$(ip addr show ens3 | grep -Po 'inet \K[\d.]+')"`
export STOREDOG_URL="http://${STOREDOG_HOST}"

download_base_directory()
{
echo -e "${COLINFO}Downloading Base Directory 'infrastructure' ...${COLRESET}"
git clone https://github.com/snahider/ecommerce-observability
echo -e "${COLINFO}Base Directory Downloaded${COLRESET}"
}
download_base_directory 

start_containers()
{
echo -e "${COLINFO}Starting Containers ...${COLRESET}"
(cd ecommerce-observability && ./startAll.sh)

POSTGRES_USER=postgres POSTGRES_PASSWORD=postgres docker-compose -f ecommerce-observability/docker-compose.yml up -d
echo -e "${COLINFO}Containers Started${COLRESET}"
}
start_containers

docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'
echo -e "${COLINFO}You are all set! Click on 'CONTINUE'.${COLRESET}"