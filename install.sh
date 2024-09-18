#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
BLUE="\e[1;34m"
NORMAL="\e[0m"

function check_result() {
    ERR=$($@)
    if [ "$?" == "0" ]; then
	printf "${GREEN}Done${NORMAL}\n"
    else
	printf "${RED}Failed${NORMAL}\n"
	printf "${ERR}\n"
	exit -1
    fi
}

printf 'Installing packages ... \t'

if [ `uname -s` == "Linux" ]; then
    sudo apt update 2>&1 >/dev/null
    check_result "sudo apt -y install vim git cppcheck build-essential clang-format colordiff htop mutt tmux 2>&1 >/dev/null"
elif [ `uname -s` == "Darwin" ]; then
    brew update 2>&1 >/dev/null
    check_result "brew install clang-format tmux mutt htop 2>&1 >/dev/null"
fi

printf 'Setting up git ... \t\t'
check_result "cp gitconfig ${HOME}/.gitconfig"

printf 'Setting up vimrc ... \t\t'
check_result "cp vimrc ${HOME}/.vimrc"

printf 'Setting up mutt ... \t\t'
check_result "cp -r mutt ${HOME}/.mutt"

printf 'Setting up tmux ... \t\t'
check_result "cp tmux.conf ${HOME}/.tmux.conf"
