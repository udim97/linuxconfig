#!/bin/sh

sudo apt install -y awesome
mkdir -p ~/.config/
ln -sf `pwd`/awesome/ ~/.config/awesome
