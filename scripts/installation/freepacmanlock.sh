#! /bin/bash

echo "Removing pacman lock..."
sudo rm -rf /var/lib/pacman/db.lck
echo "Done"
