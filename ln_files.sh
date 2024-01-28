#!/bin/sh

ln -s `pwd`/gitignore_global ~/.gitignore_global
ln -s `pwd`/bash_completion.d ~/.bash_completion.d
git config --global core.excludesfile ~/.gitignore_global
