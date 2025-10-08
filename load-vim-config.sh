#!/bin/bash

type=$1

config_folder=$(pwd)/configs
nvim_folder=$HOME/.config/nvim

if [ -e $nvim_folder/init.vim ]; then
  rm $nvim_folder/init.vim
fi
if [ -e $nvim_folder/init.lua ]; then
  rm $nvim_folder/init.lua
fi
if [ -d $nvim_folder/lua ]; then
  rm -r $nvim_folder/lua
fi
if [ -d $nvim_folder/after ]; then
  rm -r $nvim_folder/after
fi

if [ $type == 'lua' ]; then
  ln -sf $config_folder/vim/init.lua $nvim_folder/init.lua
  ln -sf $config_folder/vim/lua $nvim_folder/lua
  ln -sf $config_folder/vim/after $nvim_folder/after
elif [ $type == 'vim' ]; then
  ln -sf $config_folder/init.vim $nvim_folder/init.vim
fi
