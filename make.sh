#!/bin/sh

printf "%s\n" 'Going one dir up.'
cd ../

if [ -f wswsh ]; then
  printf "%s\n" 'Dir seems to contain wswsh. Good.'
  URL="${URL}" WWW_DIR="${WWW_DIR}" ./make.sh
fi
