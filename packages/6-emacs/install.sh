#!/bin/bash


sudo apt install -y  \
     emacs           \
     libclang-dev    \
     libclang-11-dev \
     bear

# Install rtags
pushd ~/
git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
mkdir build
cd build
cmake ..
make
make install
popd

# Install .emacs.d
pushd ~
git clone git@github.com:udim97/spacemacs.git
mv spacemacs .emacs.d
cd .emacs.d
git co myconfig
ln -sf ~/.emacs.d/.spacemacs ~/.spacemacs
popd

# User need to configue emacs
emacs

# Run emacs daemon on startup
mkdir -p ~/.config/systemd/user/
ln -sf `pwd`/emacs.service ~/.config/systemd/user/emacs.service
ln -sf `pwd`/rdm.service ~/.config/systemd/user/rdm.service
systemctl enable --user emacs
systemctl enable --user rdm
systemctl start --user emacs
systemctl start --user rdm
