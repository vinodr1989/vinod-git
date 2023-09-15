#!/bin/bash

## Usage
## Configure Git credentials in Machine using "git config --global user.name <user name>" and "git config --global user.email <email address>"
## Execute the shell script with appropriate permissions

base_repo_url="https://github.com/vinodr1989/"
USERNAME="vinodr1989" # Username as given by user/org

# This command will create a text file named repo-list and add the names of repositories authorized to the user to access
USER=$USERNAME; curl -s "https://api.github.com/users/$USER/repos" | grep -o 'git@[^"]*' | xargs basename -s .git | tee repo-list.txt

repos=$(cat repo-list.txt)

current_dir=$dir
work_dir=$(pwd)
cd $work_dir
IFS='
'
set -f
for repo in $repos
  do
  if [ -d "$repo" ]
  then
      echo "===== Entering the Directory $repo ====="
      cd "./$repo"
      echo "Pulling the Repository from Remote Repository"
      ls -lah

      git pull
      cd "../"
  else
    url=$base_repo_url$repo
    echo "===== Cloning the Repository $repo from $url ====="
    git clone $url
  fi
  done
cd $current_dir
set +f
unset IFS
