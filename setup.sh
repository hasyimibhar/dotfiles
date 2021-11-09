#!/bin/sh

CONFIG_DIR=$(pwd)

WORK_DIR=`mktemp -d`
cd $WORK_DIR

#########################################
# Essentials
#########################################

brew install alacritty neofetch wget

# Chrome
wget https://www.google.com/chrome/thank-you.html?brand=BNSD&statcb=0&installdataindex=empty&defaultbrowser=0

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#########################################
# Git and github
#########################################

ln -s $CONFIG_DIR/.gitconfig $HOME/.gitconfig

#########################################
# yabai and skhd
#########################################

brew install koekeishiya/formulae/yabai
brew services start yabai
sudo yabai --install-sa
sudo yabai --load-sa

brew install koekeishiya/formulae/skhd
brew services start skhd

#########################################
# zsh with oh-my-zsh
#########################################

brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#########################################
# Neovim
#########################################

brew install neovim rg
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#########################################
# Google Cloud SDK and Docker
#########################################

wget https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-360.0.0-darwin-x86_64.tar.gz
gcloud auth login
gcloud auth configure-docker

#########################################
# Go
#########################################

wget https://golang.org/dl/go1.17.2.darwin-amd64.pkg
go env -w GOPRIVATE=github.com/ridebeam
git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"

#########################################
# Proto
#########################################

brew install clang-format

#########################################
# Nodejs
#########################################

wget https://nodejs.org/dist/v14.18.1/node-v14.18.1.pkg
brew install yarn
