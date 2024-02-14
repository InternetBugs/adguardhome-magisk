#!/system/bin/sh

dir="/data/adb/adguardhome"
iptables -t nat -I OUTPUT -p udp ! -d 114.114.114.114 --dport 53 -j DNAT --to-destination 127.0.0.1:53
ip6tables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination [::1]:53
nohup $dir/AdGuardHome --work-dir $dir >> /dev/null &
