MODDIR=${0%/*}
mount --bind $MODDIR/system_ext/priv-app/Polaris/Polaris.apk /system_ext/priv-app/Polaris/Polaris.apk
mount --bind $MODDIR/system_ext/app/SecurityOnetrackService/SecurityOnetrackService.apk /system_ext/app/SecurityOnetrackService/SecurityOnetrackService.apk
mount --bind $MODDIR/vendor/bin/subsystem_ramdump /vendor/bin/subsystem_ramdump
