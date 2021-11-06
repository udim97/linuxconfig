#!/bin/sh

sudo apt install -y \
     luarocks

sudo luarocks install --server=http://luarocks.org/dev lua-lsp
sudo luarocks install luacheck

