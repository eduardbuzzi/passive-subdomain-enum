#!/bin/bash

BLUE='\033[1;34m'
BOLD='\033[1m'
COLORF='\033[0m'
GREEN='\033[1;32m'
ORANGE='\033[1;33m'
RED='\033[1;31m'

credits(){
echo
echo -e "${BOLD}===============================================${COLORF}"
echo -e "${BOLD}Script developed by:${COLORF} ${BLUE}Eduardo Buzzi${COLORF}"
echo -e "${BOLD}More Scripts in:${COLORF} ${RED}https://github.com/eduardbuzzi${COLORF}"
echo -e "${BOLD}===============================================${COLORF}"
}

find_subdomains(){
echo
read -p "DOMAIN => " DOMAIN
curl -s -C - -o $DOMAIN https://crt.sh/?q=$DOMAIN
REQUEST=$(grep '<TD>' $DOMAIN | grep -v '<TD><A' | cut -d '>' -f2 | cut -d '<' -f1 | grep -v '*' | sort | uniq)
if [ -z "$REQUEST" ]
then
echo
echo "No subdomains found in $DOMAIN"
rm $DOMAIN > /dev/null 2>&1
principal
fi
rm $DOMAIN > /dev/null 2>&1
echo
echo "$REQUEST"
}

principal(){
find_subdomains
principal
}
credits
principal
