#!/usr/bin/env bash

set -e

# Add Yarn's package repository to the system
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update;
sudo apt install yarn -y;
echo "YARN $(yarn --version) installed."