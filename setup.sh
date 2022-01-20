#!/usr/bin/env zsh

# Runs on setup of a new spin environment.
# Create common color functions.
autoload -U colors
colors

# Install the antigen plugin/theme manager if it's not already installed.
if [[ ! -d $HOME/antigen ]]; then
	echo -e "Antigen not found, installing..."
	cd $HOME
	git clone https://github.com/zsh-users/antigen.git
	cd -
fi

if [ $SPIN ]; then
  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install Ripgrep for better code searching: `rg <string>` to search. Obeys .gitignore
  sudo apt-get install -y ripgrep
fi

# Symlink this repo's .zshrc to ~/.zshrc. Using a symlink ensures that when the repo is
# updated, the terminal will pick up the new version on reload without having to run
# install again. This will overwrite any existing .zshrc.
ln -vsfn ~/dotfiles/.zshrc ~/.zshrc