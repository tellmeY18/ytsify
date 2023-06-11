#!/bin/bash

#print The welcome message and menu
echo "Welcome to ytstoplex"

read -r naim
curl https://yts.mx/browse-movies/$naim | grep browse-movies-link 


