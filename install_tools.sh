#!/bin/bash

echo 'Update the packages...'

sudo apt update

echo
echo 'Installing packages...'

sudo apt -y install vim git cppcheck vim build-essential aspell valgrind

echo
echo 'Setting up git...'
read -p 'Enter your name: ' username
read -p 'Enter your email: ' useremail

git config --global user.name "${username}"
git config --global user.email "${useremail}"

echo
echo 'Setting up default editor as vim'
git config --global core.editor vim

echo
echo 'Setting up vimrc...'
mv vimrc ~/.vimrc

echo
echo 'Installing Vundle...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 
echo 'Installing packages from Vundle...'
vim +PluginInstall +qall
