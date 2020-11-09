#!/bin/bash
pushd /home/www-data/web2py/applications/runestone
git status
git diff
read -p "Press enter to continue, or ctrl-c to stop."
git stash
git fetch
git reset --hard origin/lp
git stash pop
popd
