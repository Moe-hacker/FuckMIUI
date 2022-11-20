<p align="center">You Are Powerful !</p>        
<p align="center">(>_×)</p> 

# 本模块由于十分不稳定，存在卡米，炸lsp等严重问题，不再提供下载，仅供观赏。            
&emsp;本模块测试环境MIUI 13 22.10.26，核心破解3.9。            
&emsp;本模块无版权限制，因为玄学优化部分来源于网络，做模块的总不能对非自己写的东西搞版权吧。             
&emsp;本模块在加入玄学优化等功能后，异常耗电的已经基本解决，但由于依然存在卡米，炸lsp等严重问题，停止提供release下载。        
&emsp;如果你是大佬，直接git克隆本仓库压缩下就能刷，但是，卡米啥的别怪我😣。           
&emsp;如果你闲着没事分析这里面的代码，你会发现注释非常有趣，简直写了跟没写一个样。         
&emsp;如果有建议或者优化方案，欢迎提交pr/issue。              
## 项目结构：        
```tree
.
├── META-INF
│   └── com
│       └── google
│           └── android
│               ├── update-binary
│               └── updater-script
├── README.md
├── install.sh
├── iostats.list
├── module.prop
├── nomerges.list
├── post-fs-data.sh
├── service.sh
├── system
│   ├── app
│   │   ├── AnalyticsCore
│   │   │   └── AnalyticsCore.apk
│   │   ├── CarWith
│   │   │   └── CarWith.apk
│   │   ├── CatchLog
│   │   │   └── CatchLog.apk
│   │   ├── CatcherPatch
│   │   │   └── CatcherPatch.apk
│   │   ├── Cit
│   │   │   └── Cit.apk
│   │   ├── CloudService
│   │   │   └── CloudService.apk
│   │   ├── Emapal
│   │   │   └── Emapal.apk
│   │   ├── FusedLocationProvider
│   │   │   └── FusedLocationProvider.apk
│   │   ├── HybridAccessory
│   │   │   └── HybridAccessory.apk
│   │   ├── HybridPlatform
│   │   │   └── HybridPlatform.apk
│   │   ├── Joyose
│   │   │   ├── Joyose.apk
│   │   │   └── lib
│   │   │       └── arm64
│   │   │           └── libprofilemanager-jni.so
│   │   ├── MINextPay
│   │   │   └── MINextPay.apk
│   │   ├── MITSMClient
│   │   │   └── MITSMClient.apk
│   │   ├── MIUIGuardProvider
│   │   │   └── MIUIGuardProvider.apk
│   │   ├── MIUIPrivacyComputing
│   │   │   └── MIUIPrivacyComputing.apk
│   │   ├── MIUISuperMarket
│   │   │   └── MIUISuperMarket.apk
│   │   ├── MIUIVpnSdkManager
│   │   │   └── MIUIVpnSdkManager.apk
│   │   ├── MIUIgreenguardOld
│   │   │   └── MIUIgreenguardOld.apk
│   │   ├── MIpay
│   │   │   └── MIpay.apk
│   │   ├── MSA
│   │   │   └── MSA.apk
│   │   ├── MaintenanceMode
│   │   │   └── MaintenanceMode.apk
│   │   ├── MetokNLP
│   │   │   └── MetokNLP.apk
│   │   ├── MiBugReport
│   │   │   └── MiBugReport.apk
│   │   ├── MiCloudSync
│   │   │   └── MiCloudSync.apk
│   │   ├── MiConnectService
│   │   │   └── MiConnectService.apk
│   │   ├── MiDevAuthService
│   │   │   └── MiDevAuthService.apk
│   │   ├── MiGameService
│   │   │   └── MiGameService.apk
│   │   ├── MiLink
│   │   │   └── MiLink.apk
│   │   ├── MiuiPaymentService
│   │   │   └── MiuiPaymentService.apk
│   │   ├── MiuiPrintSpoolerBeta
│   │   │   └── MiuiPrintSpoolerBeta.apk
│   │   ├── MiuiUpdater
│   │   │   └── MiuiUpdater.apk
│   │   ├── ModemTestBox
│   │   │   └── ModemTestBox.apk
│   │   ├── SecurityCoreAdd
│   │   │   └── SecurityCoreAdd.apk
│   │   ├── SogouInput
│   │   │   └── SogouInput.apk
│   │   ├── VoiceAssist
│   │   │   └── VoiceAssist.apk
│   │   ├── VoiceTrigger
│   │   │   └── VoiceTrigger.apk
│   │   ├── XMSFKeeperAll
│   │   │   └── XMSFKeeperAll.apk
│   │   ├── XiaomiAccount
│   │   │   └── XiaomiAccount.apk
│   │   ├── XiaomiModemDebugService
│   │   │   └── XiaomiModemDebugService.apk
│   │   ├── XiaomiServiceFrameworkCN
│   │   │   └── XiaomiServiceFrameworkCN.apk
│   │   ├── XiaomiSimActivateService
│   │   │   └── XiaomiSimActivateService.apk
│   │   ├── com.miui.qr
│   │   │   └── com.miui.qr.apk
│   │   └── com.xiaomi.macro
│   │       └── com.xiaomi.macro.apk
│   ├── bin
│   │   └── flags_health_check
│   ├── etc
│   │   ├── hosts
│   │   └── init
│   │       └── flags_health_check.rc
│   ├── priv-app
│   │   ├── Backup
│   │   │   └── Backup.apk
│   │   ├── BuiltInPrintService
│   │   │   └── BuiltInPrintService.apk
│   │   ├── CloudBackup
│   │   │   └── CloudBackup.apk
│   │   ├── DMRegService
│   │   │   └── DMRegService.apk
│   │   ├── FindDevice
│   │   │   └── FindDevice.apk
│   │   ├── MIService
│   │   │   └── MIService.apk
│   │   ├── MIUIBrowser
│   │   │   └── MIUIBrowser.apk
│   │   ├── MIUIMusic
│   │   │   └── MIUIMusic.apk
│   │   ├── MIUIQuickSearchBox
│   │   │   └── MIUIQuickSearchBox.apk
│   │   ├── MIUIVideo
│   │   │   └── MIUIVideo.apk
│   │   ├── MIUIVipService
│   │   │   └── MIUIVipService.apk
│   │   ├── MIUIYellowPage
│   │   │   └── MIUIYellowPage.apk
│   │   ├── MiGameCenterSDKService
│   │   │   └── MiGameCenterSDKService.apk
│   │   ├── MiRcs
│   │   │   └── MiRcs.apk
│   │   ├── Mirror
│   │   │   └── Mirror.apk
│   │   └── Traceur
│   │       └── Traceur.apk
│   ├── product
│   │   └── app
│   │       └── mi_aiasst_service
│   │           └── mi_aiasst_service.apk
│   └── vendor
│       ├── app
│       │   └── MipayService
│       │       └── MipayService.apk
│       ├── bin
│       │   └── qti
│       └── etc
│           ├── thermal-4k.conf
│           ├── thermal-8k.conf
│           ├── thermal-camera.conf
│           ├── thermal-chg-only.conf
│           ├── thermal-class0.conf
│           ├── thermal-engine.conf
│           ├── thermal-map.conf
│           ├── thermal-mgame.conf
│           ├── thermal-navigation.conf
│           ├── thermal-nolimits.conf
│           ├── thermal-normal.conf
│           ├── thermal-per-camera.conf
│           ├── thermal-per-class0.conf
│           ├── thermal-per-navigation.conf
│           ├── thermal-per-normal.conf
│           ├── thermal-per-video.conf
│           ├── thermal-phone.conf
│           ├── thermal-tgame.conf
│           └── thermal-video.conf
├── system.prop
├── system_ext
│   ├── app
│   │   └── SecurityOnetrackService
│   │       └── SecurityOnetrackService.apk
│   └── priv-app
│       └── Polaris
│           └── Polaris.apk
└── vendor
    └── bin
        └── subsystem_ramdump
```
### 关于：         
作者是个缝合怪就不用介绍了，模块缝合了一堆没用的玄学优化，甚至连删温控都缝进去了。         
一切替换文件内容皆为"Fuck you !"，符合模块主题，非常暴躁。        
由于本模块存在非作者原创内容，所以本模块不是我写的，非常合情合理，有问题也别找我👻             
刷机、模块本就是逆天而行，出bug卡米啥的也是很正常的喵～         

<p align="center">「  愛にできることはまだあるよ，</p>              
<p align="center">    僕にできることはまだあるよ! 」</p>        
