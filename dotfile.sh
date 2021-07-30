#!/bin/bash


xcode-select --install

echo "Installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Homebrew"
#Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew upgrade
brew update
brew doctor

echo "set up ssh keys"
# from nnja/new-computer
read -p "Input email address for ssh key: " useremail

ssh-keygen -t rsa -b 4096 -C "$useremail"  #prompts for password
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# tell ssh config to always use keychain
# Host *
#    UseKeychain yes
#    AddKeysToAgent yes
#    IdentityFile ~/.ssh/id_rsa

#add remote hosts to known host list
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts

# log in to remote host and add id_rsa
pbcopy < ~/.ssh/id_rsa.pub
open

echo "tap repositories for homebrew"
# zsh specific plugins and settings
brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-fonts
brew tap homebrew/cask
brew tap homebrew/core
brew tap homebrew/services

echo "Installing tools using homebrew"
# brew
brew install git
brew install gcc
brew install awscli
brew install python
brew install pipx
brew install pyenv
brew install r
brew install tmux
brew install tree
brew install gnupg
brew install hugo
# brew install postgres
# brew install unixodbc

# brew install fonts
brew install --cask font-fira-mono-for-powerline
brew install --cask font-fira-code

# brew cask
# install cask command changed
brew install --cask docker
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask rstudio
brew install --cask firefox
brew install --cask snowflake-snowsql
brew install --cask popsql
brew install --cask box-sync
brew install --cask box-tools
brew install --cask tableau@2020.3.4

# brew cask utilities
brew install --cask displaylink
brew install --cask parallels-client
brew install --cask rescuetime
brew install --cask caffeine

# brew cask communication
# brew install --cask whatsapp
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask slack

# setup
# git
git config --global user.name "pupreti"
git config --global user.email $useremail
git config --global init.defaultBranch main

# python
pipx ensurepath
pipx install autopep8
# add trusted host to pip.conf pip3 config --editor code edit 
# https://stackoverflow.com/questions/59287824/specifying-multiple-trusted-hosts-in-pip-conf#59288637

# gnupg
gpg --default-new-key-algo rsa4096 --gen-key
git config --global user.signingkey 5E586CB34FC7C4DB

# install configuration from dotfile
git clone https://github.com/upretip/dotfile.git ~/Documents/dotfile

# zsh:
#     To activate completions for zsh you need to have
#     bashcompinit enabled in zsh:

#     autoload -U bashcompinit
#     bashcompinit

#     Afterwards you can enable completion for pipx:

#     eval "$(register-python-argcomplete pipx)"
