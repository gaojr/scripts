opt=$1

if [[ $opt == "p" ]]; then
  docker pull $2
elif [[ $opt == "s" ]]; then
  docker save $2
elif [[ $opt == "d" ]]; then
  docker rmi $2
elif [[ $opt == "gzip" ]]; then
  if [[ -z $2 || -z $3 ]]; then
    Write-Output "请检查入参!";
  else
    docker save $2 | gzip > $3
  fi
else
  docker images
fi
