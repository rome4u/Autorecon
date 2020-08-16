#!/bin/sh
#Created by Ayrton Ilagan
clear
echo Created by Ayrton Ilagan
on=0
off=0
secs=0
mins=0
hrs=0
while :
do
wget --spider --quiet --tries=1 --timeout=5 1.1.1.1
if [ "$?" -eq 0 ]; then
	on=$(($on+1))
	off=0
else
	off=$(($off+1))
fi
secs=$(($secs+5))
if [ "$secs" -gt 59 ]; then
secs=0
mins=$(($mins+1))
if [ "$mins" -gt 59 ]; then
mins=0
hrs=$(($mins+1))
fi
fi
if [[ "$on" -eq 1 ]]; then
echo Checking Internet Connection
	echo Connected
elif [[ "$off" -eq 1 ]]; then
	ping 1.1.1.1 -c 1 -W 1 > /dev/null
if [ "$?" -eq 1 ]; then
#vpn=`pgrep openvpn`
#kill $vpn
#wan=`ifconfig eth0.2|awk 'FNR==8 {print substr($2,7)}'`
#sleep 1
#wan2=`ifconfig eth0.2|awk 'FNR==8 {print substr($2,7)}'`
#net=$(($wan2-$wan))
#net=$(($net/(1024)))

#if [ "$net" -eq 0 ]; then
	echo -ne '\007'
	echo -ne '\007'
	echo Internet is Down, Changing WanIp
	echo "Connected time: $hrs hr(s) $mins min(s) $secs sec(s)"
	ssh root@192.168.8.1 -y 'PATH=/bin:/sbin:/system/bin:/system/xbin:/app/bin; atc AT+CFUN=0 '> /dev/null 2>&1
	ssh root@192.168.8.1 -y 'PATH=/bin:/sbin:/system/bin:/system/xbin:/app/bin; atc AT+CFUN=1 '> /dev/null 2>&1
	IP=`ssh root@192.168.8.1 -y PATH=/bin:/sbin:/system/bin:/system/xbin:/app/bin ip -4 -o addr show wan0|busybox awk '{print $6}'`> /dev/null 2>&1
while [ -z "$IP" ];
do
	IP=`ssh root@192.168.8.1 -y PATH=/bin:/sbin:/system/bin:/system/xbin:/app/bin ip -4 -o addr show wan0|busybox awk '{print $6}'`> /dev/null 2>&1
	sleep 1
done
	/etc/init.d/openvpn restart
	echo New IP: $IP

	on=0
	off=0
	secs=0
	mins=0
	hrs=0
	sleep 60
else
off=0	
gg=0
fi
else
	gg=0
fi
done
