#!/system/bin/sh

dir="/data/adb/adguardhome"

nohup $dir/AdGuardHome --work-dir $dir >> /dev/null &
