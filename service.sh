LOG_FILE=/data/adb/modules/FuckMIUI/FuckMIUI.log
BATTERY_LOG_FILE=/data/adb/modules/FuckMIUI/Battery.log
STATE_FILE=/data/FuckMIUI_DAEMON.enable
#状态默认为开启
echo 1 > $STATE_FILE
#清空之前的日志并开始新的记录
#在开始运行脚本和日志文件超过100k时被调用
CLEAR_LOGS(){
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Start logging > $LOG_FILE
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Destoryed apks: >> $LOG_FILE
    find /data/adb/modules/FuckMIUI|grep apk >> $LOG_FILE
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Blocked hosts: >> $LOG_FILE
    cat /etc/hosts >> $LOG_FILE
}
#杀死部分只杀一次的进程
FuckMIUI(){
  #清空日志开始新的记录
  CLEAR_LOGS
  #关闭ramdump
  echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
  echo 0 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
  #杀死部分可能在空文件挂载前就运行的进程，空文件已经存在故以下进程杀死后无法再次启动
  for shit in flags_health_check logd subsystem_ramdump qti miuibooster;do
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
  #删不删貌似没有影响
  rm /dev/pmsg0
  #玄学优化
  for i in $(cat /data/adb/modules/FuckMIUI/iostats.list);do
    echo 0 > $i
  done
  #还是玄学优化
  for i in $(cat /data/adb/modules/FuckMIUI/nomerges.list);do
    echo 0 > $i
  done
  #还是玄学优化
  cmd wifi force-low-latency-mode enabled
  echo 1 >/proc/sys/net/ipv4/tcp_low_latency
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
}
#服务进程，会一直执行，对某些不能直接摧毁的进程进行火力压制
FuckMIUI_DAEMON(){
  while :
  do
    #判断服务开启状态，若为0则暂时停火
    if [ $(cat $STATE_FILE) == 0 ];then
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Suspended >> $LOG_FILE
      for shit in com.miui.contentcatcher com.mobiletools.systemhelper:register com.android.htmlviewer:remote com.android.carrierdefaultap com.android.vending com.miui.vsimcore com.xiaomi.barrage;do
      kill -18 $(pidof $shit)
      done
      sleep 2s
      continue
    fi
    #日志文件超过100k清空，我一个萌新都知道该捡走自己拉的屎，某些专业程序员………懂得都懂
    if [ $(du $LOG_FILE|awk '{printf $1}') -gt 100 ];then
      CLEAR_LOGS
    fi
    #对手机管家进行暴力压制，-19会一直弹出手机管家无响应弹窗，目前除改为-9压制无其他方案
    for shit in com.miui.securitycenter.remote com.miui.securitycenter;do
    if kill -9 $(pidof $shit);then
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully killed $shit >> $LOG_FILE
    else
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to kill $shit: no process found >> $LOG_FILE
    fi
    done
    #对部分进程进行kill -19压制，效果是进程还在但本身已经卡死无法作孽
    for shit in com.miui.contentcatcher com.mobiletools.systemhelper:register com.android.htmlviewer:remote com.android.carrierdefaultap com.android.vending com.miui.vsimcore com.xiaomi.barrage;do
    if kill -19 $(pidof $shit);then
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Successfully stoped $shit >> $LOG_FILE
    else
      echo [$(date +%Y:%m:%d:%H:%M:%S)] Failed to stop $shit: no process found >> $LOG_FILE
    fi
    done
    sleep 1s
  done
}
#电流日志
BATTERY_LOG(){
    rm $BATTERY_LOG_FILE
    while :
    do
    CURRENT=$(cat /sys/class/power_supply/battery/current_now)
    CURRENT=$(($(($CURRENT))/1000))
    echo [$(date +%Y:%m:%d:%H:%M:%S)] Current: $CURRENT mA >> $BATTERY_LOG_FILE
    sleep 10s
    done
}
#等待完全开机后执行，否则系统可能会出bug
sleep 120s
#进行部分进程的kill和玄学优化
FuckMIUI
#开启火力压制&记录电流
FuckMIUI_DAEMON|BATTERY_LOG
