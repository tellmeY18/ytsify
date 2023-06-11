#!/bin/bash

#print The welcome message and menu
echo "Welcome to ytstoplex"

read -r naim
curl https://yts.mx/browse-movies/${naim// /%20} | grep browse-movie-link | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"  > /tmp/links
cat /tmp/links | grep -oP "(?<=movies/).*"
echo "Enter your selection" 
read -r dwnlod
echo $dwnlod
#final=$(curl https://yts.mx/movies/$dwnlod | grep button-green | grep 1080 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | head --lines 1)
final=$(curl https://yts.mx/movies/$dwnlod | grep 1080 | grep magnet-download | grep -oP 'magnet:\?xt=urn:btih:[^\"]+' | head --lines 1)
echo $final
aria2c $final

