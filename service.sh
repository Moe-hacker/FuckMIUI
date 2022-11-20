#!/bin/sh
#玄学优化没注释用途的部分来自网络，用途懒得添加了，反正也是玄学，东西太多懒得测试，具体效果我也不知道，不过也没指望有效就是了
LOG_FILE=/data/adb/modules/FuckMIUI/FuckMIUI.log
BATTERY_LOG_FILE=/data/adb/modules/FuckMIUI/Battery.log
#玄学优化
FuckMIUI(){
  #清空日志开始新的记录
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Start logging > $LOG_FILE
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Destoryed apks: >> $LOG_FILE
  find /data/adb/modules/FuckMIUI|grep apk >> $LOG_FILE
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Blocked hosts: >> $LOG_FILE
  cat /etc/hosts >> $LOG_FILE
  #关闭ramdump
  echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
  echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
  #杀死部分可能在空文件挂载前就运行的进程，空文件已经存在故以下进程杀死后无法再次启动
  for shit in flags_health_check subsystem_ramdump qti;do
  if kill -9 $(pidof $shit);then
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully killed $shit >> $LOG_FILE
  else
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to kill $shit: no process found >> $LOG_FILE
  fi
  done
  #网上抄的玄学优化
  setprop ctl.stop tcpdump
  setprop ctl.stop cnss_diag
  setprop ctl.stop vendor.tcpdump
  setprop ctl.stop vendor.cnss_diag
  setprop ctl.stop vendor.tftp_server
  #玄学优化
  for i in $(cat /data/adb/modules/FuckMIUI/iostats.list);do
    echo 0 > $i
  done
  #玄学优化
  service call SurfaceFlinger 1008 i32 1
  #玄学优化
  echo 1 > /dev/stune/foreground/schedtune.prefer_idle
  echo 1 > /dev/stune/background/schedtune.prefer_idle
  echo 1 > /dev/stune/rt/schedtune.prefer_idle
  echo 20 > /dev/stune/rt/schedtune.boost
  echo 20 > /dev/stune/top-app/schedtune.boost
  echo 1 > /dev/stune/schedtune.prefer_idle
  echo 1 > /dev/stune/top-app/schedtune.prefer_idle
  echo 50 > /dev/memcg/memory.swappiness
  #玄学优化
  echo 1 > /dev/cpuset/sched_relax_domain_level
  echo 1 > /dev/cpuset/system-background/sched_relax_domain_level
  echo 1 > /dev/cpuset/background/sched_relax_domain_level
  echo 1 > /dev/cpuset/foreground/sched_relax_domain_level
  echo 1 > /dev/cpuset/top-app/sched_relax_domain_level
  echo 0 > /proc/sys/vm/page-cluster
  #还是玄学优化
  for i in $(cat /data/adb/modules/FuckMIUI/nomerges.list);do
    echo 0 > $i
  done
  #还是玄学优化，甚至这段是两个地方找的缝合的
  cmd wifi force-low-latency-mode enabled
  echo 1 >/proc/sys/net/ipv4/tcp_low_latency
  echo 2 > /proc/sys/net/ipv4/tcp_fin_timeout
  echo 0 > /proc/sys/net/ipv4/tcp_keepalive_time
  echo 2 > /proc/sys/net/ipv4/tcp_keepalive_probes
  echo 2 > /proc/sys/net/ipv4/tcp_keepalive_intvl
  echo 0 > /proc/sys/net/ipv4/tcp_timestamps
  echo 3 > /proc/sys/net/ipv4/tcp_fastopen
  echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
  echo 0 > /proc/sys/net/ipv4/tcp_slow_start_after_idle
  echo 1048576 > /proc/sys/net/core/rmem_default
  echo 1048576 > /proc/sys/net/core/wmem_default
  #还™是玄学优化
  echo 0 > /sys/module/binder/parameters/debug_mask
  echo 0 > /sys/module/binder_alloc/parameters/debug_mask
  echo 0 > /sys/module/msm_show_resume_irq/parameters/debug_mask
  echo 0 > /sys/module/millet_core/parameters/millet_debug
  echo 0 > /proc/sys/migt/migt_sched_debug
  echo N > /sys/kernel/debug/debug_enabled
  echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
  echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
  echo 0 > /sys/block/mmcblk0/queue/nomerges
  echo 0 > /sys/block/mmcblk0rpmb/queue/nomerges
  #杀死部分进程，后台压制对电流无任何帮助，因此杀一次求个安慰
  for shit in com.miui.securitycenter.remote com.miui.securitycenter com.miui.contentcatcher com.mobiletools.systemhelper:register com.android.htmlviewer:remote com.android.carrierdefaultap com.android.vending com.miui.vsimcore com.xiaomi.barrage;do
    if kill -9 $(pidof $shit);then
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully killed $shit >> $LOG_FILE
    else
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to kill $shit: no process found >> $LOG_FILE
    fi
  done
}
#电流电量日志
BATTERY_LOG(){
    rm $BATTERY_LOG_FILE
    while :
    do
    CURRENT=$(cat /sys/class/power_supply/battery/current_now)
    CURRENT=$(($(($CURRENT))/1000))
    CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Current: $CURRENT mA >> $BATTERY_LOG_FILE
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Capacity: $CAPACITY% >> $BATTERY_LOG_FILE
    sleep 10s
    done
}
#等待完全开机后执行，否则系统可能会出bug
sleep 120s
#进行部分进程的kill和玄学优化
FuckMIUI
#开启记录电流电量，作者本人监控用的，你要是用不到可以连着函数一起删了
BATTERY_LOG
