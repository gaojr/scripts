opt=$1

if [[ $opt == "f" ]]; then
  git fetch --all --tags --prune --prune-tags;
elif [[ $opt == "s" ]]; then
  git status --short --branch;
elif [[ $opt == "fv" ]]; then
  git branch -a --sort=authordate --list '*/'$2'/*' --contains $3 | sort;
elif [[ $opt == "fv1" ]]; then
  git branch -a --sort=authordate --list '*/release/*' --contains $2 | sort | head -n 1;
elif [[ -n "$opt" ]]; then
  git $*;
else
  git branch -vv;
fi
