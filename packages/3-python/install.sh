#!/bin/sh

sudo apt install -y  \
	python3      \
	python3-dev  \
    python3.9    \
	python3-pip  \
	python3-venv \
    python3-wheel

# Reinstall pip
pip3 install --user --force-reinstall pip
sudo apt remove python3-pip

# Install common packages
pip3 install --user requests

