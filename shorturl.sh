#!/bin/bash
clear

printf " \e[0;32m[>]\e[0;37m Enter Url: \e[0;32m"
read url

res=$(curl -s https://da.gd/s/?url=$url)
a=$(echo $res | awk '{gsub("https://","https://instagram.com@")}1')
printf " \e[0;32m[>]\e[0;37m $a#login \n"
