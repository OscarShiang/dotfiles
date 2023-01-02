#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
BLUE="\e[1;34m"
NORMAL="\e[0m"

function check_result() {
    if [ "$?" == "0" ]; then
	echo -e "${GREEN}Done${NORMAL}"
    else
	echo -e "${RED}Failed${NORMAL}"
	echo -e "$1"
	exit -1
    fi
}

printf 'Installing packages ... \t'

if [ `uname -s` == "Linux" ]; then
    ERR=$(sudo apt update 2>&1 >/dev/null)
    ERR=$(sudo apt -y install vim git cppcheck build-essential clang-format colordiff htop mutt tmux 2>&1 >/dev/null)
elif [ `uname -s` == "Darwin" ]; then
    ERR=$(brew update 2>&1 >/dev/null)
    ERR=$(brew install clang-format tmux mutt htop 2>&1 >/dev/null)
fi

check_result $ERR

printf 'Setting up git ... \t\t'
ERR=$(cp gitconfig ${HOME}/.gitconfig 2>&1 >/dev/null)

check_result $ERR

printf 'Setting up vimrc ... \t\t'
ERR=$(cp vimrc ${HOME}/.vimrc 2>&1 >/dev/null)

check_result $ERR

printf 'Setting up mutt ... \t\t'
ERR=$(cp -r mutt ${HOME}/.mutt 2>&1 >/dev/null)

check_result $ERR

printf 'Setting up tmux ... \t\t'
ERR=$(cp tmux.conf ${HOME}/.tmux.conf 2>&1 >/dev/null)

check_result $ERR
