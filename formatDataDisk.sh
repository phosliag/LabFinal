#!/bin/bash

disk=$(lsblk -dn -o NAME | grep -E '^sd[b-z]$' | head -n 1)
sudo mkfs.exFAT -F $disk
mkdir -p /mnt/datadisk
mount $disk /mnt/datadisk
echo "$disk /mnt/datadisk ext4 defaults,nofail 0 2" >> /etc/fstab
