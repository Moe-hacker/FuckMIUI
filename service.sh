echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
while :
  do
    killall -9 logd
    killall -9 subsystem_ramdump
  done
done
