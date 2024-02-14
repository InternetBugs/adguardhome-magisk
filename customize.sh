SKIPUNZIP=1

dir=/data/adb/adguardhome
case "${ARCH}" in
    arm)
        architecture="armv7"
        ui_print "不支持的架构"
        exit 1
        ;;
    arm64)
        architecture="armv8"
        ;;
    x86)
        architecture="386"
        ui_print "不支持的架构"
        exit 1
        ;;
    x64)
        architecture="amd64"
        ui_print "不支持的架构"
        exit 1
        ;;
esac

unzip -o "${ZIPFILE}" -x 'META-INF/*' -d $MODPATH >&2

mkdir $dir
mv -f ${MODPATH}/adguardhome/* ${dir}/
rm -rf ${MODPATH}/adguardhome

sleep 1

chmod 755 -Rf $dir/*
$dir/script/start.sh
