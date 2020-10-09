opt=$1

if [[ $opt == "u" ]]; then
  data="$(npm -g outdated --parseable --depth=0 2>/dev/null)";
  datas=(${data// / });
  for item in "${datas[@]}"
  do
    package=${item##*:};
    npm -g install "$package";
  done
else
  npm ls -g --depth=0;
fi
