#!/bin/sh

sudo apt install -y awesome
mkdir -p ~/.config/awesome
ln -sf `pwd`/rc.lua ~/.config/awesome/rc.lua
