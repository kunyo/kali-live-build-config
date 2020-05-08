#!/usr/bin/env bash
set -ex
SETUP_DIR=`realpath "$(dirname $0)/.setup"`
test -d "$SETUP_DIR" && rm -rf "$SETUP_DIR"
mkdir -p "$SETUP_DIR"

cd "$SETUP_DIR"

# # Download KALI keyring and archive build packages
wget http://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.2_all.deb
wget https://archive.kali.org/kali/pool/main/l/live-build/live-build_20191221_all.deb

# # Install additional dependencies
sudo apt update
sudo apt install -y git live-build cdebootstrap debootstrap curl
sudo dpkg -i kali-archive-keyring_2018.2_all.deb
sudo dpkg -i live-build_20191221_all.deb

# Setup build scripts and checkout config from github
if [ ! -f "/usr/share/debootstrap/scripts/kali" ]; then
    cd /usr/share/debootstrap/scripts/
    echo "default_mirror http://http.kali.org/kali"; sed -e "s/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g" sid > /tmp/kali
    sudo mv /tmp/kali .
    sudo ln -s kali kali-rolling
fi
