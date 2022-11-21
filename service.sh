#!/bin/sh
#玄学优化来自网络，反正也是玄学，东西太多懒得测试，具体有没有效果我也不知道，不过也没指望有效就是了
#部分常量定义为宏是个好习惯(c语言名词突然乱入)
LOG_FILE=/data/adb/modules/FuckMIUI/FuckMIUI.log
BATTERY_LOG_FILE=/data/adb/modules/FuckMIUI/Battery.log
#玄学优化，非得专门写个函数真没啥必要，只是习惯罢了
FuckMIUI(){
  #清空日志开始新的记录
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Start logging > $LOG_FILE
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Destoryed apks: >> $LOG_FILE
  find /data/adb/modules/FuckMIUI|grep apk >> $LOG_FILE
  echo [$(date +%Y:%m:%d:%H:%M:%S)] Blocked hosts: >> $LOG_FILE
  cat /etc/hosts >> $LOG_FILE
  #关闭ramdump，这真不是玄学，ramdump的cpu异常占用真的会导致我的手机发烫，续航尿崩
  echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
  echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
  #杀死部分可能在空文件挂载前就运行的进程，空文件已经存在故以下进程杀死后无法再次启动
  for shit in mi_thermald android.hardware.thermal@2.0-service.qti flags_health_check subsystem_ramdump qti;do
  if kill -9 $(pidof $shit);then
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully killed $shit >> $LOG_FILE
  else
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to kill $shit: no process found >> $LOG_FILE
  fi
  done
  #这东西貌似不是玄学，由于模块可能会导致系统产生崩溃弹窗，尝试屏蔽
  settings put global hide_error_dialogs 1
  #玄学优化，关闭tcpdump和cnss
  setprop ctl.stop tcpdump
  setprop ctl.stop cnss_diag
  setprop ctl.stop vendor.tcpdump
  setprop ctl.stop vendor.cnss_diag
  setprop ctl.stop vendor.tftp_server
  #玄学优化，关闭磁盘I/O统计
  for i in $(cat /data/adb/modules/FuckMIUI/iostats.list);do
    echo 0 > $i
  done
  #玄学优化，停用hw叠加层
  service call SurfaceFlinger 1008 i32 1
  #玄学优化，系统调度相关
  echo 1 > /dev/stune/foreground/schedtune.prefer_idle
  echo 1 > /dev/stune/background/schedtune.prefer_idle
  echo 1 > /dev/stune/rt/schedtune.prefer_idle
  echo 20 > /dev/stune/rt/schedtune.boost
  echo 20 > /dev/stune/top-app/schedtune.boost
  echo 1 > /dev/stune/schedtune.prefer_idle
  echo 1 > /dev/stune/top-app/schedtune.prefer_idle
  #玄学优化，swap优先级，原文是50为了省电和性能改成0，不过我的swap是关闭的
  echo 0 > /dev/memcg/memory.swappiness
  #玄学优化，貌似是cpu活跃程度相关
  echo 1 > /dev/cpuset/sched_relax_domain_level
  echo 1 > /dev/cpuset/system-background/sched_relax_domain_level
  echo 1 > /dev/cpuset/background/sched_relax_domain_level
  echo 1 > /dev/cpuset/foreground/sched_relax_domain_level
  echo 1 > /dev/cpuset/top-app/sched_relax_domain_level
  #玄学优化，优化swap的I/O，不过我没开swap所以效果更不可能知道了
  echo 0 > /proc/sys/vm/page-cluster
  #玄学优化，禁用I/O合并
  for i in $(cat /data/adb/modules/FuckMIUI/nomerges.list);do
    echo 0 > $i
  done
  #玄学优化，wifi低延迟模式
  cmd wifi force-low-latency-mode enabled
  #玄学优化，tcp相关，需不需要内核支持待考证
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
  #玄学优化，禁用部分日志
  echo 0 > /sys/module/binder/parameters/debug_mask
  echo 0 > /sys/module/binder_alloc/parameters/debug_mask
  echo 0 > /sys/module/msm_show_resume_irq/parameters/debug_mask
  echo 0 > /sys/module/millet_core/parameters/millet_debug
  echo 0 > /proc/sys/migt/migt_sched_debug
  echo N > /sys/kernel/debug/debug_enabled
  echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
  echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
  #玄学优化，I/O相关，禁用合并，和上边的来源不同因此没写在一起
  echo 0 > /sys/block/mmcblk0/queue/nomerges
  echo 0 > /sys/block/mmcblk0rpmb/queue/nomerges
  #隐私夺取相关，有没有效果我也不知道
  echo 114514191981 > /sdcard/deviceId.txt
  #尝试删除部分系统和软件拉的💩
  #修改自MIUIYYDS模块，虽然本模块含义和它相反
  #什么你说这不会是格机吧？
  #这年代还有用rm格机的？dd我都嫌太老了，事实上重定向格机就是我发现的，第一个测试实例也是我搞的，真想搞破坏我肯定不用rm，echo配合重定向比那东西快多了😉
  rm -rf /data/*.log
  rm -rf /data/adb/lspd/log/*.log
  rm -rf /data/vendor/wlan_logs
  rm -rf /data/vendor/charge_logger/*
  rm -rf /data/*.txt
  rm -rf /cache/*.apk
  rm -rf /data/anr/*
  rm -rf /data/backup/pending/*.tmp
  rm -rf /data/cache/*.*
  rm -rf /data/data/*.log
  rm -rf /data/data/*.txt
  rm -rf /data/log/*.log
  rm -rf /data/log/*.txt
  rm -rf /data/local/*.apk
  rm -rf /data/local/*.log
  rm -rf /data/local/*.txt
  rm -rf /data/mlog/*
  rm -rf /data/system/*.log
  rm -rf /data/system/*.txt
  rm -rf /data/system/dropbox/*
  rm -rf /data/system/usagestats/*
  rm -rf /data/system/shared_prefs/*
  rm -rf /data/tombstones/*
  rm -rf /sdcard/LOST.DIR
  rm -rf /sdcard/found000
  rm -rf /sdcard/LazyList
  rm -rf /sdcard/albumthumbs
  rm -rf /sdcard/kunlun
  rm -rf /sdcard/.CacheOfEUI
  rm -rf /sdcard/.bstats
  rm -rf /sdcard/.taobao
  rm -rf /sdcard/Backucup
  rm -rf /sdcard/MIUI/debug_log
  rm -rf /sdcard/ramdump
  rm -rf /sdcard/UnityAdsVideoCache
  rm -rf /sdcard/*.log
  rm -rf /sdcard/*.CHK
  rm -rf /sdcard/duilite
  rm -rf /sdcard/DkMiBrowserDemo
  rm -rf /sdcard/.xlDownload
  rm -rf /sdcard/.UTSystemConfig
  rm -rf /sdcard/.tbs
  rm -rf /sdcard/DCIM/.tmfs
  #尝试夺取隐私，虽然大概率没啥用
  touch /sdcard/DCIM/.tmfs
  #杀死部分进程，后台压制对电流无任何帮助，因此杀一次求个安慰
  for shit in com.miui.securitycenter.remote com.miui.securitycenter com.miui.contentcatcher com.mobiletools.systemhelper:register com.android.htmlviewer:remote com.android.carrierdefaultap com.android.vending com.miui.vsimcore com.xiaomi.barrage;do
    if kill -9 $(pidof $shit);then
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully killed $shit >> $LOG_FILE
    else
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to kill $shit: no process found >> $LOG_FILE
    fi
  done
}
#电流电量日志，自动记录，就不用老盯着scene看了
#依然是没啥必要的函数形式，写成函数只是习惯而已
BATTERY_LOG(){
    rm $BATTERY_LOG_FILE
    while :
    do
    #电流，单位换算为mA需要除以1000
    CURRENT=$(cat /sys/class/power_supply/battery/current_now)
    CURRENT=$(($(($CURRENT))/1000))
    #电量，变量命名对不对我也不知道，英语不太好
    CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Current: $CURRENT mA >> $BATTERY_LOG_FILE
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Capacity: $CAPACITY% >> $BATTERY_LOG_FILE
    #实测电流数据大概每10秒刷新，因此下次获取数据并写入日志会在10秒之后
    sleep 10s
    done
}
#等待完全开机后执行，否则系统可能会出bug
sleep 120s
#进行部分进程的kill和玄学优化
FuckMIUI
#开启记录电流电量，作者本人监控用的，你要是用不到可以连着函数一起删了
BATTERY_LOG
