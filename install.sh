#!/bin/bash

DOTFILES_PATH=`cd $(dirname $0) ; pwd -P`

confirm_action() {
	# print question
	echo -n $1 "(y/N) "
	read -n 1
	printf "\n"

	# return reply
	[[ $REPLY =~ ^[Yy]$ ]]
}

install_vimrc() {

	# warn
	 confirm_action "You are about to replace your .vimrc. Continue?" \
		 && (echo "Skipping .vimrc" ; return 1)

	# symlink
	echo "$HOME/.vimrc -> $DOTFILES_PATH/.vimrc"
	ln -sf $DOTFILES_PATH/.vimrc $HOME/.vimrc
}

# $1 is source directory, $2 is target directory 
simlink_files() {

	cd $1

	files=$(find | sed 's/^\.//g' | sed 's/^\///g')

	for f in $files; do
		if [ -e $2/$f ] || [ -L $2/$f ] ; then
			if confirm_action "$2/$f already exists. Replace?" ; then
				ln -sf $1/$f $2/$f
				echo "$2/$f -> $1/$f"
			fi
		else
			ln -s $1/$f $2/$f
			echo "$2/$f -> $1/$f"
		fi
	done

	echo
}


if confirm_action "Install i3 configs?" ; then
	simlink_files "$DOTFILES_PATH/i3" "$HOME/.config/i3"
fi

if confirm_action "Install vim configs?" ; then
	simlink_files "$DOTFILES_PATH/vim" "$HOME"
fi

if confirm_action "Install zsh configs?" ; then
	simlink_files "$DOTFILES_PATH/zsh" "$HOME"
fi

if confirm_action "Install termite configs?" ; then
	simlink_files "$DOTFILES_PATH/termite" "$HOME/.config/termite"
fi

if confirm_action "Install ranger configs?" ; then
	simlink_files "$DOTFILES_PATH/ranger" "$HOME/.config/ranger"
fi

if confirm_action "Install neofetch configs?" ; then
	simlink_files "$DOTFILES_PATH/neofetch" "$HOME/.config/neofetch"
fi

if confirm_action "Install dunst configs?" ; then
	simlink_files "$DOTFILES_PATH/dunst" "$HOME/.config/dunst"
fi

if confirm_action "Install rofi configs?" ; then
	simlink_files "$DOTFILES_PATH/rofi" "$HOME/.config/rofi"
fi

if confirm_action "Install cava configs?" ; then
	simlink_files "$DOTFILES_PATH/cava" "$HOME/.config/cava"
fi
