#!/bin/bash

# Obtener el nombre del disco
disk=$(lsblk -dn -o NAME | grep -E '^sd[b-z]$' | head -n 1)

# Formatear el disco como ext4 (sin confirmaciones interactivas)
sudo mkfs.exFAT -F $disk

# Crear un punto de montaje
mkdir -p /mnt/datadisk

# Montar el disco en el punto de montaje
mount $disk /mnt/datadisk

# Actualizar /etc/fstab para que el disco se monte automáticamente en el arranque
echo "$disk /mnt/datadisk ext4 defaults,nofail 0 2" >> /etc/fstab