MODDIR=${0%/*}
#手动挂载部分伪造的替换文件
#magiak貌似不认system_ext和vendor分区？(流汗滑稽)
mount --bind $MODDIR/system_ext/priv-app/Polaris/Polaris.apk /system_ext/priv-app/Polaris/Polaris.apk
mount --bind $MODDIR/system_ext/app/SecurityOnetrackService/SecurityOnetrackService.apk /system_ext/app/SecurityOnetrackService/SecurityOnetrackService.apk
mount --bind $MODDIR/vendor/bin/subsystem_ramdump /vendor/bin/subsystem_ramdump
