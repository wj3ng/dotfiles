#!/bin/bash

DOTFILES_PATH=`cd $(dirname $0) ; pwd -P`

confirm_action() {
	# print question
	echo -n $1 "(y/N) "
	read -n 1 reply
	printf "\n"

	# return reply
	[[ $reply =~ ^[Yy]$ ]]
}

install_vimrc() {

	# warn
	 confirm_action "You are about to replace your .vimrc. Continue?" \
		 && (echo "Skipping .vimrc" ; return 1)

	# symlink
	echo "$HOME/.vimrc -> $DOTFILES_PATH/.vimrc"
	ln -sf $DOTFILES_PATH/.vimrc $HOME/.vimrc
}


echo ***WARNING***
echo YOUR EXISTING CONFIG FILES WILL BE REPLACED AND WOULD NOT BE ABLE TO BE RECOVERED.
echo PLEASE MAKE A BACKUP OF YOUR OLD CONFIGS BEFORE RUNNING THIS SCRIPT.
echo "(YOU WILL BE PROMPTED BEFORE EACH PROGRAM'S CONFIGS)"

confirm_action "Are you sure you want to continue?"
echo 

install_vimrc
