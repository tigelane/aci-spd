#!/bin/bash

APIC=sandboxapicdc.cisco.com
COOKIE_FILE=cookie.txt

# printf "\n*** logging in ***\n"
OUT=$(curl -s -X POST -k https://$APIC/api/aaaLogin.json -d '{ "aaaUser" : { "attributes" : { "name" : "admin" , "pwd" : "!v3G@!4@Y" } } }' -c COOKIE_FILE EOF)

ERRCODE=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .code')
ERRTEXT=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .text')

# Check if an error code exists
if [ "${ERRCODE//[0-9]}" = "" ]
then
	printf "$ERRCODE : $ERRTEXT\n"
	exit 0
else
	# printf "Login OK"
	true
fi

# printf "\n\n*** listing all tenants ***\n"
response=$(curl -s -b COOKIE_FILE -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name')

json="[$(echo "$response" | awk '{printf("\"%s\",", $0)}' | sed 's/,$/]/')"
echo "$json"