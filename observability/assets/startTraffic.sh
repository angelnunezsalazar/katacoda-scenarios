#!/bin/bash

set -e

COLQUESTION="\u001b[36m" #verde
COLINFO="\u001b[37m" #plomo
COLLOGS="\u001b[35m" #morado
COLRESET="\u001b[m"

start_traffic()
{
echo -e "${COLINFO}Starting Traffic ...${COLRESET}"
docker-compose -f puppeteer/docker-compose.yml up -d
echo -e "${COLINFO}Traffic Started${COLRESET}"
}
start_traffic

echo -e "${COLINFO}You are all set! Click on 'CONTINUE'.${COLRESET}"