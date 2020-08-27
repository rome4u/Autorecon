# For Openwrt Change IP


Supported Device

-NewifiD2

-Xiaomi AC2100

-Miwifi Nano

To install:

Copy and paste

Router with modem ip of 192.168.8.1

rm autoip.sh && wget https://github.com/atong27/IP/blob/master/openwrt.mips?raw=true -O autoip.sh && chmod +x autoip.sh && wget https://raw.githubusercontent.com/atong27/IP/master/run.sh -O run.sh && chmod +x run.sh

Router with modem ip of 192.168.28.28

rm autoip.sh && wget https://github.com/atong27/IP/blob/master/modem_22_192.168.28.28.sh?raw=true -O autoip.sh && chmod +x autoip.sh && wget https://raw.githubusercontent.com/atong27/IP/master/run.sh -O run.sh && chmod +x run.sh

And put this on Local Startup of your router

/root/run.sh
exit 0

#nohup command &>/dev/null &

