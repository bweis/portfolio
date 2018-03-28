#!/bin/bash

# This script downloads the latest update to the Minimo Themes
echo -e "\033[0;32mUpdating Minimo...\033[0m"
cd themes/minimo
git checkout master
git fetch && git pull
cd -
git add themes/minimo
git commit -m "update [theme]: minimo"

echo -e "\033[0;32mCheck that the config.toml is properly configured: https://minimo.netlify.com/docs/installation/#configuration-for-minimo\033[0m"


