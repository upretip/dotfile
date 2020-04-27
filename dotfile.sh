#!/bin/bash

#Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# zsh specific plugins and settings

brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-fonts
brew tap homebrew/cask
brew tap homebrew/core
brew tap homebrew/services

# brew
brew install git
brew install gcc
brew install python
brew install r
brew install postgres
brew install unixodbc

# set up git

# brew cask 
brew cask install docker
brew cask install iterm2
brew cask install visual-studio-code
brew cask install rstudio
brew cask install firefox

# brew cask communication
brew cask install whatsapp
brew cask install zoomus


#install awscli using pip3

pip3 install awscli