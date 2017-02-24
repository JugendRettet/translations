#!/bin/sh

our_dir="$(pwd)"
website_dir='../website'

printf "%s\n" "Checking website's dir..."

if [ -f "${website_dir}"/wswsh ]; then
  printf "%s\n" "Website's dir seems to contain wswsh. Good."
  printf "%s\n" "Syncing translations into it..."
  rsync -qaP --del --exclude='.git' "${our_dir}" "${website_dir}"/
  printf "%s\n" "Building new website..."
  cd "${website_dir}"
  URL="${URL}" WWW_DIR="${WWW_DIR}" ./make.sh
else
  printf "%s\n" "Website's dir doesn't seem to contain wswsh. Aborted."
fi
