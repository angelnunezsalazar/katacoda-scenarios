#!/bin/bash

set -e

COLQUESTION="\u001b[36m" #verde
COLINFO="\u001b[37m" #plomo
COLLOGS="\u001b[35m" #morado
COLRESET="\u001b[m"

start_agent()
{
echo -e "${COLINFO}Starting Agent ...${COLRESET}"
docker-compose -f ecommerce-observability/docker-compose.yml up agent -d
echo -e "${COLINFO}Agent Started${COLRESET}"
}
start_agent

docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'
echo -e "${COLINFO}You are all set! Click on 'CONTINUE'.${COLRESET}"