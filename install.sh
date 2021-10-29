#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

printf "\n${WHITE}==============================================================================

${RED}Beginning Computer Setup${WHITE}

==============================================================================${NORMAL}\n"

sudo -v

printf "\n${GREEN}Installing XCode Command Line Tools...${NORMAL}\n"
eval "xcode-select --install"

printf "${YELLOW}Installing Homebrew...${NORMAL}\n"
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle

brew cleanup
printf "\n${BLUE}Homebrew installed and up to date!${NORMAL}\n"

printf "${YELLOW}Installing Node...${NORMAL}\n"
if test ! $(which nvm); then
  /bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash)"
fi

nvm install node

printf "\n${GREEN}Applying System Defaults${NORMAL}\n"

source .macos
