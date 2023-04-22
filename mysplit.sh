#!/bin/bash
#get file in variable
file=$1
#get total number of lines
number=`cat $file | wc -l`

minus=`expr $number - 1 `
#get head of file in variable
first=`head -n 1 $file`
#get 80% of number of lines
eight=`echo $minus*0.8 |bc`
eighty=${eight%.*}
#make first sub dataset
head -n $eighty $file | sed  's/;/,/g' > data.csv | mv data.csv train
#second dataset header line first, get last 20% of lines numnber
last=`expr $number - $eighty`
last=${last%.*}
echo "$first" > data.csv
tail -n $last $file | sed 's/;/,/g' >> data.csv | mv data.csv test
