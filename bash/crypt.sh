#!/bin/bash
opt=$1
content=$2
key=$3

if [ -z "$opt" -o -z "$content" -o -z "$key" ]; then
  echo "USAGES: sh ./crypt.sh <e|d> <content> <key>"
  exit
fi

len=$(( ${#key} % 4 ))
md5=`echo -n "$key" | md5sum | cut -d ' ' -f1 | tr '[:lower:]' '[:upper:]'`

if [ $opt == "e" ]; then
  echo "加密"
  s=`echo -n "$content" | base64`
  result="${s:0:$len}$md5${s:$len}"
elif [ $opt == "d" ]; then
  echo "解密"
  s="${content:$len:32}"
  if [ $s != $md5 ]; then
    echo "解密失败"
    exit
  fi
  s="${content:0:$len}${content:$len+32}"
  result=`echo -n "$s" | base64 -d`
fi

if [ -n "$result" ]; then
  echo "$result"
else
  echo "USAGES: sh ./crypt.sh <e|d> <content> <key>"
fi
