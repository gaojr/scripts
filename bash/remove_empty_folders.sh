path=$1

find $path -type d -empty -exec rm -rf {} \;
