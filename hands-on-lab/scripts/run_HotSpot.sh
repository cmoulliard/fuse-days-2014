#!/bin/bash
#
# Documentation : http://nims11.wordpress.com/2012/04/27/hostapd-the-linux-way-to-create-virtual-wifi-access-point/
# Issue on centos : wlan wasn't started reported by hostapd - see trick here : https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/1289047
# To run the script :
# ./run_HotSpot.sh wlp0s26u1u2 em1
# where wlp0s26u1u2 = ASUS AC56
# where wlp3s0 = Lenovo Wifi card
# where em1 = ethernet card
#


# Unblock wifi soft
rfkill unblock wifi

#Initial wifi interface configuration
ifconfig $1 up 10.0.0.1 netmask 255.255.255.0
sleep 2

###########Start dnsmasq, modify if required##########
if [ -z "$(ps -e | grep dnsmasq)" ]
then
 dnsmasq
fi
###########

###########
# Enable NAT
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface $2 -j MASQUERADE
iptables --append FORWARD --in-interface $1 -j ACCEPT

#Thanks to lorenzo
#Uncomment the line below if facing problems while sharing PPPoE, see lorenzo's comment for more details
#iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

sysctl -w net.ipv4.ip_forward=1

#start hostapd
hostapd /etc/hostapd/hostapd.conf 1>/dev/null
killall dnsmasq
