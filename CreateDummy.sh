#!/bin/bash

for ((i=1; i<= 12; i++)); do
#  touch $i;
#  echo $i 
  for ((j=1; j<=10; j++)); do
  echo 'nohup aws s3 cp s3://citybike1-kiwony/file-num-12/file'$i'.csv s3://citybike1-kiwony/filecount120/file'$i'-'$j'.csv &'
  done
done
