#!/bin/bash

config_folder=$(pwd)/configs

##########
#  NVIM  #
##########
echo ">> NVIM"

nvim_folder=$HOME/.config/nvim
# checks if the folder exists and if not create it
[ -d $nvim_folder ] || mkdir $nvim_folder
# create a symbolic link
ln -s -f $config_folder/init.vim $nvim_folder/init.vim

