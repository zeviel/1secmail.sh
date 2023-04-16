#!/bin/bash

api="https://www.1secmail.com/api/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"

function generate_email() {
	curl --request GET \
		--url "$api/?action=genRandomMailbox&count=$1" \
		--user-agent "$user_agent" \
		--header "accept: application/json"	\
		--header "content-type: application/json"
}

function get_domains() {
	curl --request GET \
		--url "$api/?action=getDomainList" \
		--user-agent "$user_agent" \
		--header "accept: application/json"	\
		--header "content-type: application/json"
}

function get_messages() {
	curl --request GET \
		--url "$api/?action=getMessages&login=$1&domain=$2" \
		--user-agent "$user_agent" \
		--header "accept: application/json"	\
		--header "content-type: application/json"
}

function read_message() {
	curl --request GET \
		--url "$api/?action=readMessage&login=$1&domain=$2&id=$3" \
		--user-agent "$user_agent" \
		--header "accept: application/json"	\
		--header "content-type: application/json"
}
