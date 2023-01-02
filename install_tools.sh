#!/bin/bash

echo 'Update the packages...'

sudo apt update

echo
echo 'Installing packages...'

sudo apt -y install vim git cppcheck vim build-essential clang-format colordiff htop

echo
echo 'Setting up git...'
cp gitconfig ~/.gitconfig

echo
echo 'Setting up vimrc...'
cp vimrc ~/.vimrc

echo
echo 'Setting up mutt...'
cp -r mutt ~/.mutt

echo
echo 'Setting up tmux'
cp tmux.conf ~/.tmux.conf
