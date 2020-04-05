#!/bin/bash

#Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# brew
brew install gcc
brew install python
brew install r
brew install postgres
brew install unixodbc


# brew cask
brew cask install docker
brew cask install iterm2
brew cask install visual-studio-code
brew cask install rstudio
brew cask install firefox