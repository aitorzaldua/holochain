#!/bin/bash
if [[ -z $IN_NIX_SHELL ]]; then
    echo "It looks like you are NOT running in a nix-shell"
    echo "Go to the base folder of the developer-exercises, "
    echo "where you find default.nix, "
    echo "and run 'nix-shell' in the command line."
    exit 1
fi

HC_VERSION=$(hn-introspect | grep holochain:)
CORRECT_HC_VERSION="- holochain: https://github.com/holochain/holochain/archive/7c80ce00fb7ff01b339aa61e258ee548ef1b9a4b.tar.gz"

if [[ $HC_VERSION != $CORRECT_HC_VERSION ]]; then 
    echo "It looks like you are running in an OLD nix-shell"
    echo "Go to the base folder of the developer-exercises, "
    echo "where you find default.nix, "
    echo "and run 'nix-shell' in the command line."
    exit 1
fi

## in the future add check to see if we are running in the nix-shell for holochain-gym
#
# if [[ -z $IN_NIX_SHELL_GYM ]]; then
#     echo "I looks like you are NOT running in THE RIGHT nix-shell"
#     echo "for the holochain-gym exercises."
#     echo "Go to the base folder of the developer-exercises, "
#     echo "where you find default.nix, "
#     echo "and run 'nix-shell' in the command line."
#     exit 1
# fi

## in the future add check to see if are running an old configuration of the holochain-gym nix-shell
# echo "I looks like you are NOT running in an OLD nix-shell configuration"