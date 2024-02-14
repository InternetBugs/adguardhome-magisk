until [ $(getprop init.svc.bootanim) = "stopped" ] ; do
    sleep 5
done

service_path=`realpath $0`
module_dir=`dirname ${service_path}`
dir="/data/adb/adguardhome"
script_dir="$dir/script"

$script_dir/start.sh

