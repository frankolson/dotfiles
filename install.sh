!#/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function perform() {
  rsync --exclude ".git/" \
    --exclude ".gitmodules" \
    --exclude ".DS_Store" \
    --exclude ".osx" \
    --exclude "install.sh" \
    --exclude "README.md" \
    --exclude "LICENSE.md" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  perform;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    perform;
  fi;
fi;

unset perform;
