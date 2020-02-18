#!/bin/sh
#This is a shellscript for backup pkg list and some config files.(for Debian Dists)

#make temp directory
cd ~
mkdir bk_config
cd ~/bk_config

#make packagelist
dpkg -l > packagelist

#backup config files
cd ~
cp .bashrc ~/bk_config
EMACS='.emacs'
VIM='.vimrc'
ZSH='.zshrc'
if [ -e "$EMACS" ]; then
    cp .emacs ~/bk_config
fi
if [ -e "$VIM" ]; then
    cp .vimrc ~/bk_config
fi
if [ -e "$ZSH" ]; then
    cp .zshrc ~/bk_config
fi


#make backup info file
cd ~/bk_config
echo "backup date and dist info" > backupinfo
date >> backupinfo
uname -ra > backupinfo

#make archive file
cd ~
tar czf bk_configs.tar.gz bk_config

#remove tempdirectory
rm -r ~/bk_config
