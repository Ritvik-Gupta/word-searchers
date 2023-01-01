#!/bin/bash

curl -s -o onegrams_list "https://gist.githubusercontent.com/Kroid/d92a242b374043353ea6/raw/ecb91bd4c7f325b0650b2ea8d0e48379c66d9dfd/English%2520all%25201-grams"

fetch_command="echo Fetching 1-grams "

while IFS= read -r line
do
	name=`echo $line | cut -d "-" -f 6 | cut -d "." -f 1`
	fetch_command+="& curl -s '$line' | gzip -d > $name "
done < onegrams_list


bash -c "$fetch_command"
