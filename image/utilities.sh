#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl less vim-tiny psmisc gnupg-agent dirmngr
ln -s /usr/bin/vim.tiny /usr/bin/vim

## This tool runs a command as another user and sets $HOME.
cp /bd_build/bin/setuser /sbin/setuser

## This tool allows installation of apt packages with automatic cache cleanup.
cp /bd_build/bin/install_clean /sbin/install_clean

## argparse not available on python3.1 of Debian squeeze
$minimal_apt_get_install python3 python3-setuptools
mkdir argparse
curl -s https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/argparse/argparse-1.2.1.tar.gz | tar -xzv -C argparse --strip-components=1
cd argparse
python3 setup.py install
