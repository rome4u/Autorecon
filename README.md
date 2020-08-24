# For Openwrt Change IP


Supported Device

-NewifiD2

-Xiaomi AC2100

-Miwifi Nano

To install:

Copy and paste

wget https://github.com/atong27/IP/blob/master/openwrt.mips?raw=true -O autoip.sh && chmod +x autoip.sh
wget https://raw.githubusercontent.com/atong27/IP/master/run.sh -O run.sh && chmod +x run.sh

And put this on Local Startup of your router

/root/run.sh
exit 0

#nohup command &>/dev/null &

