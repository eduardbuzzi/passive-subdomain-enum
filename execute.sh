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
echo -e "${BOLD} developed by:${COLORF} ${BLUE}Eduardo Buzzi${COLORF}"
echo -e "${BOLD}More s in:${COLORF} ${RED}https://github.com/edubuzzi${COLORF}"
echo -e "${BOLD}===============================================${COLORF}"
}

find_subdomains(){
echo
read -p "DOMAIN => " DOMAIN
curl -s -C - -o $DOMAIN https://securitytrails.com/list/apex_domain/$DOMAIN
REQUEST=$(grep "href" $DOMAIN | tr ' ' '\n' | grep "</a></td>" | cut -d "/" -f3)
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
