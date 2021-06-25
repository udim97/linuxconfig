#!/bin/sh

sudo apt install -y \
     git            \
     gitg           \
     meld

ln -sf `pwd`/.gitconfig ~/.gitconfig

ssh-keygen
