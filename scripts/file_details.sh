#!/bin/bash

# Work in Progress......
# Script not working completely

echo "Enter the file name"
read file
echo "method 1 using awk"
awk 'BEGIN{FS=""}{for(i=1;i<=NF;i++)c++}END{print "total chars:"c}' $file

echo "Method 2 using shell"
var=$(<$file)
echo ${#var}

wc $file


echo "Counting words"
word=$(wc $file -w)
echo "Number of Words = $word"


echo "Counting characters"
char=$($file| wc -c)
echo "Number of Characters = $char"

echo "Counting Number of white spaces" 
# sed "s/ change this to whitespace//g"
space=$(expr length "$file" - length `$file | sed "s/ //g"`)
echo "Number of White Spaces = $space"

echo "Counting special characters"
special=$(expr length "${file//[^\~!@#$&*()]/}")
echo "Number of Special symbols = $special"


echo "enter a word you want to search"
read word1
count=0
for i in \`cat $file`
do
if [ $i == $word1 ]
then
count=\`expr $count + 1`
fi
done
echo "The number of times the word $word appears is $count"
