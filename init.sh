#!/bin/bash

config_folder=$(pwd)/configs

##########
#  NVIM  #
##########
echo ">> NVIM config"

echo -e "🔗 Symlinking Neovim binary to Vim"
ln -s $(which nvim) /usr/local/bin/vim

nvim_folder=$HOME/.config/nvim
# checks if the folder exists and if not create it
[ -d $nvim_folder ] || mkdir $nvim_folder

echo -e "⏳ Installing Vim Plug"
cd $nvim_folder
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd -

# create a symbolic link
echo "🔗 Symlinking init.vim config file"
ln -s -f $config_folder/init.vim $nvim_folder/init.vim

