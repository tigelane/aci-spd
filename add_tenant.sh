#!/bin/bash

# Give a name to the new tenant we will create
NEW_TENANT=my_new_tenant

# Set the API endpoint and cookie file
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

# Make a call to the API endpiint and setup a new Tenant
curl -s -b COOKIE_FILE -X POST -k https://$APIC/api/mo/uni.json -d '{"fvTenant":{"attributes":{"name":"'"$NEW_TENANT"'"}}}'
