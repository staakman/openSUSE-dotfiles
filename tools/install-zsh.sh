#!/usr/bin/env bash

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo zypper in \
	zsh \
	starship
	
