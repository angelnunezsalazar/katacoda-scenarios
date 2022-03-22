COLQUESTION="\u001b[36m" #verde
COLINFO="\u001b[37m" #plomo
COLLOGS="\u001b[35m" #morado
COLRESET="\u001b[m"

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
POSTGRES_USER=postgres POSTGRES_PASSWORD=postgres docker-compose -f ecommerce-observability/docker-compose.yml up frontend -d
echo -e "${COLINFO}Containers Started${COLRESET}"
}
start_containers

docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'
echo -e "${COLINFO}You are all set! 'CONTINUE with the step'.${COLRESET}"