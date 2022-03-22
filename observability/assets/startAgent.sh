COLQUESTION="\u001b[36m" #verde
COLINFO="\u001b[37m" #plomo
COLLOGS="\u001b[35m" #morado
COLRESET="\u001b[m"

start_agent()
{
echo -e "${COLINFO}Starting Agent ...${COLRESET}"
docker-compose -f ecommerce-observability/docker-compose.yml up frontend -d
echo -e "${COLINFO}Agent Started${COLRESET}"
}
start_agent

echo -e "${COLINFO}You are all set! Click on 'CONTINUE'.${COLRESET}"