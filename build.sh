#!/bin/bash

# This script rebuilds my Hugo site and commits
# the changes inside of the /public folder. I have a 
# separate repository where the deployed site lives.

echo -e "\033[0;32mCleaning public directory...\033[0m"
cd public
shopt -s extglob
rm -r !(.git)
cd ..


echo -e "\033[0;32mBuilding website...\033[0m"
hugo
cd public
git add .


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
msg="Rebuilding portfolio: `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
cd ..
