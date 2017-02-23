#!/bin/sh

our_dir="$(pwd)"
website_dir='../website'

printf "%s\n" "Checking website's dir..."

if [ -f "${website_dir}"/wswsh ]; then
  printf "%s\n" "Website's dir seems to contain wswsh. Good."
  printf "%s\n" "Syncing translations into it..."
  rsync -qaP --del --exclude='.git' "${our_dir}" "${website_dir}"/
  cd "${website_dir}"
  printf "%s\n" "Switching to branch ${BRANCH}..."
  git checkout "${BRANCH}"
  printf "%s\n" "Building new website..."
  URL="${URL}" WWW_DIR="${WWW_DIR}" ./make.sh
else
  printf "%s\n" "Website's dir doesn't seem to contain wswsh. Aborted."
fi
