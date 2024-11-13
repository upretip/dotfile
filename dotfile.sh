#!/bin/bash


xcode-select --install

echo "Installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install zsh theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


echo "Installing Homebrew"
#Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew upgrade
brew update
brew doctor

echo "adding configuration files"
echo "symbolic links to config"
ln -s ~/.dotfile/.gitconfig ~/.gitconfig
ln -s ~/.dotfile/.vimrc ~/.vimrc
ln -s ~/.dotfile/.zshrc ~/.zshrc
ln -s ~/.dotfile/.sqlfluff ~/.sqlfluff
ln -sf $HOME/.dotfile/.pip.conf $HOME/.config/pip/pip.conf 
source ~/.zshrc

echo "set up ssh keys"
# from nnja/new-computer
read -p "Input email address for ssh key: " useremail

ssh-keygen -t rsa -b 4096 -C "$useremail"  #prompts for password
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# tell ssh config to always use keychain
echo "
Host *
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
" >> ~/.ssh/config

#add remote hosts to known host list
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts

# log in to remote host and add id_rsa
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/keys # Prompts browser login to add ssh key to github

echo "tap repositories for homebrew"
# zsh specific plugins and settings
brew tap hashicorp/tap
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
brew install hashicorp/tap/terraform
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
brew install --cask firefox
brew install --cask snowflake-snowsql
brew install --cask rectangle
brew install --cask dbeaver-community
brew install --cask caffeine
brew install --cask rescuetime
brew install --cask postman

# work only software
# brew install --cask rstudio
# brew install --cask box-sync
# brew install --cask box-tools
# brew install --cask tableau@2020.3.4
# brew install --cask microsoft-teams
# brew install --cask lens

# brew cask utilities
brew install --cask displaylink
brew install --cask parallels-client
brew install --cask rescuetime

# brew cask communication
# brew install --cask whatsapp
brew install --cask zoom
brew install --cask slack


echo "Installing python tools using pipx"
pipx ensurepath
pipx install autopep8
pipx install black
pipx install flake8
pipx install isort
pipx install sqlfluff
# add trusted host to pip.conf pip3 config --editor code edit 
# https://stackoverflow.com/questions/59287824/specifying-multiple-trusted-hosts-in-pip-conf#59288637


gpg --default-new-key-algo rsa4096 --gen-key
git config --global user.signingkey 5E586CB34FC7C4DB

# dbt autocomplete script
# curl -fsSL https://raw.githubusercontent.com/dbt-labs/dbt-completion.bash/master/_dbt -o _dbt
# mkdir -p  ~/.oh-my-zsh/completions/
# mv _dbt ~/.oh-my-zsh/completions/ 

