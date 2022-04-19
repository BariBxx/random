#!/bin/bash
clear

function toolBanner() {
	printf "\e[0;32m                               \e[0m\n"
	printf "\e[0;32m    _________  ____ _____ ___  \e[0m\n"
	printf "\e[0;32m   / ___/ __ \/ __ '/ __ '__ \ \e[0m\n"
	printf "\e[0;32m  (__  ) /_/ / /_/ / / / / / / \e[0m\n"
	printf "\e[0;32m /____/ .___/\__,_/_/ /_/ /_/  \e[0m\n"
	printf "\e[0;32m     /_/ \e[0;37mspam gmail @hoji0x    \e[0m\n"
	echo
}

function getInfo() {
	printf " \e[0;32m[>]\e[0;37m Your Gmail : \e[0;32m"
	read gmail

	printf " \e[0;32m[>]\e[0;37m Your Passwd: \e[0;32m"
	read psss

	printf " \e[0;32m[>]\e[0;37m Emails List: \e[0;32m"
	read list

	printf " \e[0;32m[>]\e[0;37m Text 2 Send: \e[0;32m"
	read text

	echo "$text" > mail.txt
}

function startSpam() {
	while read -r mail; do
		curl --ssl-reqd \
			--url 'smtps://smtp.gmail.com:465' \
			--user "$gmail:$pass" \
			--mail-from "$gmail" \
			--mail-rcpt "$mail" \
			--upload-file mail.txt
	done < <(cat $list)
}

toolBanner
getInfo
startSpam
