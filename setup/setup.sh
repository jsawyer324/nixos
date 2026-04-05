#!/bin/bash

#input hostname
#read -rp "Enter hostname: " HOSTNAME

#partition disk
sudo sgdisk -n 1::+512M /dev/vda -t 1:ef00
sudo sgdisk -n 2::+2G /dev/vda -t 2:8200
sudo sgdisk -n 3:: /dev/vda 

#format and label
sudo mkfs.fat -F 32 -n NIXBOOT /dev/vda1
sudo mkswap -L NIXSWAP /dev/vda2
sudo mkfs.ext4 -L NIXOS /dev/vda3

#mount and activate swap by label
sudo mount -L NIXOS /mnt
sudo swapon -L NIXSWAP
sudo mount --mkdir -L NIXBOOT /mnt/boot

sudo lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS,LABEL

sleep 2

#config
sudo nixos-generate-config --root /mnt

sleep 2

#copy
sudo rm /mnt/etc/nixos/*
sudo cp ../configuration.nix /mnt/etc/nixos/configuration.nix
sudo cp ../flake.nix /mnt/etc/nixos/flake.nix
sudo cp ../home.nix /mnt/etc/nixos/home.nix
sudo mkdir -p /mnt/etc/nixos/hosts
sudo cp ../hosts/qemu-vm.nix /mnt/etc/nixos/hosts/qemu-vm.nix

sleep 2

#edit hostname
#sed -i "s/nixoshost/$HOSTNAME/g" /mnt/etc/nixos/configuration.nix

#install
cd /mnt || exit
#sudo nixos-install --flake /mnt/etc/nixos#testnix01
#sudo nixos-install --flake /mnt/etc/nixos#testnix01

#reboot now
