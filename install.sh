#!/bin/bash

which -s brew
if [[ $? == 0 ]] ; then
    # echo "found Homebrew"
    brew install fd
    brew install rg
    brew install nvim
fi
