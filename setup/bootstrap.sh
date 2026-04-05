#! /usr/bin/env nix-shell

nix-shell -p git --run "git clone https://github.com/jsawyer324/nixos.git"

cd /home/nixos/nixos/setup || exit

sudo sh ./setup.sh
