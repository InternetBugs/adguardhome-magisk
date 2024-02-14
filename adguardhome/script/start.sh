#!/system/bin/sh

dir="/data/adb/adguardhome"
iptables -t nat -I OUTPUT -p udp ! -d 114.114.114.114 -d 223.5.5.5 -d 119.29.29.29 --dport 53 -j DNAT --to-destination 127.0.0.1:53
ip6tables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination [::1]:53
nohup $dir/AdGuardHome --work-dir $dir >> /dev/null &
