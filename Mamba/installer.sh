#!/bin/sh
set -e
echo "Installing"
opkg update
opkg install coreutils-nohup
opkg install libcurl4
opkg install curl
opkg install coreutils-base64
opkg install coreutils-sha256sum
curl -o /root/mamba_test_jehe https://github.com/atong27/IP/blob/master/Mamba/mamba_test_jehe?raw=true
chmod +x /root/mamba_test_jehe
echo "Installation Completed." 