#!/bin/sh

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?

if [ -d plugged ]; then
    echo "It appears you already have a plugged dir - skipping step.\n"
else
    mkdir  plugged
fi

if [ -d swp ]; then
    echo "It appears you already have a swp dir - skipping step.\n"
else
    mkdir swp
fi

ln -sf nvimrc ~/.nvimrc 
