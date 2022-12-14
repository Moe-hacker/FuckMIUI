<p align="center">You Are Powerful !</p>        
<p align="center">(>_×)</p> 

~~(笨蛋，要是真的不喜欢的话谁会在意啊(脸红))~~
### &emsp;本项目存在以下要素，可能引起不适，作者概不负责：恶臭，野兽先辈，二次元，猛男撒娇，胡言乱语，自恋，相声式解说和注释，废话，轻度粗口，脾气暴躁。         
### &emsp;本模块在非作者本人的设备上运行可能存在卡米，炸lsp等严重问题，因此不提供成品下载，仅供参考，同时包含有一行拒绝刷入的代码用来隔离某些萌新。            
#### ~~(没办法，谁让这个模块只喜欢我一个人呢，脸红)~~            
### Update 11.22: 系统精简加入MIUI13稳定版支持。       
由于MIUI过于ex，系统精简目录在不同版本号下并不通用。       
本次更新移除应用列表无变更，因此文件树说明并未更新。         
增添部分可禁用应用列表：        
```dircolors
com.miui.daemon
com.xiaomi.aiasst.service
com.miui.contentcatcher
com.google.android.printservice.recommendation
com.google.android.onetimeinitializer
com.google.android.configupdater
com.android.vending
com.android.htmlviewer
```
不提供直接移除，请手动pm disable。          
### &emsp;本模块内容均具有详细注释，不建议直接打包刷入，而是根据具体需要，结合注释和文档进行二创。          
&emsp;本模块测试环境MIUI 13 22.10.26，核心破解3.9。            
&emsp;本模块无版权限制，因为玄学优化部分来源于网络，做模块的总不能对非自己写的东西搞版权吧。             
&emsp;本模块在加入玄学优化等功能后，异常耗电的已经基本解决，但由于依然存在卡米，炸lsp等严重问题，停止提供release下载。        
&emsp;关于本模块文档和注释中标注为`不知道`的部分：作者无法考证该部分提供什么功能以及修改/屏蔽后的影响，因此会有部分类似`我也不知道`的标注。        
&emsp;hosts部分感谢酷安@诺蓝的MIUIYYDS。           
&emsp;大部分薛定谔的优化真实来源无从考证，因此没有标注出处。          
&emsp;如果你是大佬且很勇，直接git克隆本仓库，删掉那一行拒绝刷入的代码，压缩下就能刷，但是，卡米啥的别怪我😣。           
&emsp;如果你闲着没事分析这里面的代码，你会发现注释非常有趣，事实上我更适合去做单口相声。         
&emsp;本模块遵循屎山代码的母语注释注释原则和不测试原则。        
&emsp;如果有建议或者优化方案，欢迎提交pr/issue。              
&emsp;本来打算用MIT协议的，但由于加入了非原创内容，因此仓库已删除许可证，因为许可证是给原创或原作者允许二创的东西准备的，但是大部分玄学优化来源根本无从考证，因此本仓库「不做版权限制」。            
## Features:
- 一堆玄学优化，有没有用我也不知道               
- 系统精简，由于精简后可能会有进程存在异常占用，因此靠上一条勉强维持          
- 域名屏蔽，包含隐私相关和部分广告       
- 隐私夺取，有没有效果就不知道了          
- 电流电量监控，日志写在模块目录下，就不用整天盯着scene看了         
- 观赏性质，个人感觉注释和文档写的并不枯燥        
- 可以用来养蛊(雾)          
- 可以看作者乐子，虽然这并不道德(大雾)        
## 具体内容(简直是养蛊)：       
#### ~~(非玄学部分暂未得要无效性验证，玄学部分暂未得到有效性验证)~~
### 非玄学部分：      
- 系统精简     
- 隐私，部分广告和小米服务相关域名屏蔽         
- 关闭ramdump    
- 关闭qti       
- 移除温控      
- 关闭flags_health_check       
- 对部分进程开机后执行kill        
- 开机清理部分应用拉的屎       
- /sdcard/deviceId.txt内容替换为114514191981，这东西删了还在，不过替换内容应该长度和原来相同即可，目前未发现数值更改        
- 尝试删除/sdcard/DCIM/.tmfs，据说和隐私相关        
- 机型显示修改为Google Pixel 10 Ultra，后续个人进行手机物理改色会用到       
- 电流电量记录，写入模块目录下        
### 玄学部分：       
- props部分：         
    - 关闭大部分日志        
    - 关闭hw叠加层
    - 运行优化        
    - doze优化      
    - 缓冲区优化       
    - sqlite优化      
    - wifi延迟优化       
    - 内存优化       
    - 相机优化，边缘锐化关闭         
    - 睡眠优化       
    - 快充       
    - ~~音效优化，已停用~~
- service.sh部分：       
    - 尝试屏蔽部分应用崩溃弹窗      
    - 关闭tcpdump      
    - 关闭cnss      
    - 关闭I/O统计      
    - 关闭I/O合并      
    - 停用hw叠加层     
    - 优化系统调度       
    - 调整swap优先级      
    - cpu活跃程度优化       
    - 优化swap的I/O      
    - wifi延迟优化      
    - tcp延迟优化      
    - 部分日志禁用      
    - 杀死部分进程，大概率死灰复燃      
## 项目结构附文件功能注释，建议电脑查看：        
```lua
.
├── META-INF
│   └── com
│       └── google
│           └── android
│               ├── update-binary #模块安装脚本
│               └── updater-script #空脚本，留着只是为了模块安装不出bug
├── README.md #本文档
├── install.sh #安装脚本，除了安装时解压一下模块没别的操作
├── iostats.list #我的手机里扫描出来的I/O统计相关控制文件，太多了就单独写在这里了
├── module.prop #模块信息，版本号挺臭的
├── nomerges.list  #我的手机里扫描出来的I/O合并相关控制文件，太多了就单独写在这里了
├── post-fs-data.sh #启动脚本，挂载vendor和system_ext下的伪造文件，因为magisk貌似不认这两个文件夹，具体必要性待考证
├── service.sh #服务脚本，开机后进行玄学优化和电流电量统计
├── system
│   ├── app
│   │   ├── AnalyticsCore
│   │   │   └── AnalyticsCore.apk #据说是云控
│   │   ├── CarWith
│   │   │   └── CarWith.apk #车机连接相关，个人认为在雷总造出车来之前用处不大
│   │   ├── CatchLog
│   │   │   └── CatchLog.apk #日志捕获，一群裂纹虎克整天抓日志看屏幕生产商估计就用的这个
│   │   ├── CatcherPatch
│   │   │   └── CatcherPatch.apk #应该也是日志相关
│   │   ├── Cit
│   │   │   └── Cit.apk #应该是工程测试，测试硬件的，开发版一直在后台运行也不知道几个意思
│   │   ├── CloudService
│   │   │   └── CloudService.apk #小米云服务
│   │   ├── Emapal
│   │   │   └── Emapal.apk #GamePal，不知道是啥
│   │   ├── FusedLocationProvider
│   │   │   └── FusedLocationProvider.apk #一体化位置信息
│   │   ├── HybridAccessory
│   │   │   └── HybridAccessory.apk #智慧生活，也没看出哪智慧
│   │   ├── HybridPlatform
│   │   │   └── HybridPlatform.apk #快应用，简书网页经常会调起来的就是这东西，个人感觉这东西绝对是坏文明
│   │   ├── Joyose
│   │   │   └── Joyose.apk #据说是云控，也有说是计步？灵弦是吧？反正我没啥用
│   │   ├── MINextPay
│   │   │   └── MINextPay.apk #小米支付
│   │   ├── MITSMClient
│   │   │   └── MITSMClient.apk #智能卡
│   │   ├── MIUIGuardProvider
│   │   │   └── MIUIGuardProvider.apk #打印相关
│   │   ├── MIUIPrivacyComputing
│   │   │   └── MIUIPrivacyComputing.apk #不知道干啥的
│   │   ├── MIUISuperMarket
│   │   │   └── MIUISuperMarket.apk #应用商店
│   │   ├── MIUIVpnSdkManager
│   │   │   └── MIUIVpnSdkManager.apk #经酷友指正，貌似是个游戏加速器？
│   │   ├── MIUIgreenguardOld
│   │   │   └── MIUIgreenguardOld.apk #安全组件
│   │   ├── MIpay
│   │   │   └── MIpay.apk #小米钱包
│   │   ├── MSA
│   │   │   └── MSA.apk #智能服务，也没看出那里智能，估计命名和隔壁华子一个德行
│   │   ├── MaintenanceMode
│   │   │   └── MaintenanceMode.apk #维修模式，都过保了还去官方修个毛线
│   │   ├── MetokNLP
│   │   │   └── MetokNLP.apk #网络位置服务
│   │   ├── MiBugReport
│   │   │   └── MiBugReport.apk #系统反馈，偷渡的要啥反馈？等着被远程施法？
│   │   ├── MiCloudSync
│   │   │   └── MiCloudSync.apk #云同步
│   │   ├── MiConnectService
│   │   │   └── MiConnectService.apk #小米互传
│   │   ├── MiDevAuthService
│   │   │   └── MiDevAuthService.apk #可能是开发版授权
│   │   ├── MiGameService
│   │   │   └── MiGameService.apk #游戏服务
│   │   ├── MiLink
│   │   │   └── MiLink.apk #小米妙播
│   │   ├── MiuiPaymentService
│   │   │   └── MiuiPaymentService.apk #米币
│   │   ├── MiuiPrintSpoolerBeta
│   │   │   └── MiuiPrintSpoolerBeta.apk #打印处理服务，显然我的EDC没有打印机因此用不到
│   │   ├── MiuiUpdater
│   │   │   └── MiuiUpdater.apk #系统更新
│   │   ├── ModemTestBox
│   │   │   └── ModemTestBox.apk #MODEM测试工具mtb
│   │   ├── SecurityCoreAdd
│   │   │   └── SecurityCoreAdd.apk #游戏空间？
│   │   ├── SogouInput
│   │   │   └── SogouInput.apk #系统自带的搜狗输入法，感觉………不如gboard好看
│   │   ├── VoiceAssist
│   │   │   └── VoiceAssist.apk #小爱同学
│   │   ├── VoiceTrigger
│   │   │   └── VoiceTrigger.apk #建议和上一个当场结婚，上一个的后台毒瘤
│   │   ├── XMSFKeeperAll
│   │   │   └── XMSFKeeperAll.apk #应该是小米服务框架守护进程
│   │   ├── XiaomiAccount
│   │   │   └── XiaomiAccount.apk #小米账号
│   │   ├── XiaomiModemDebugService
│   │   │   └── XiaomiModemDebugService.apk #调试用的
│   │   ├── XiaomiServiceFrameworkCN
│   │   │   └── XiaomiServiceFrameworkCN.apk #小米服务框架
│   │   ├── XiaomiSimActivateService
│   │   │   └── XiaomiSimActivateService.apk #SIM激活，都激活过了可以删了，虽然有点兔死狗烹
│   │   ├── com.miui.qr
│   │   │   └── com.miui.qr.apk #Cit_QR，应该是测试用的
│   │   └── com.xiaomi.macro
│   │       └── com.xiaomi.macro.apk #自动连招
│   ├── bin
│   │   └── flags_health_check #鬼知道干嘛的，关了啥事没有就对了
│   ├── etc
│   │   ├── hosts #域名屏蔽
│   │   └── init
│   │       └── flags_health_check.rc #关闭flags_health_check服务
│   ├── priv-app
│   │   ├── Backup
│   │   │   └── Backup.apk #备份
│   │   ├── BuiltInPrintService
│   │   │   └── BuiltInPrintService.apk #打印服务
│   │   ├── CloudBackup
│   │   │   └── CloudBackup.apk #云备份
│   │   ├── DMRegService
│   │   │   └── DMRegService.apk #RegService，鬼知道是个啥
│   │   ├── FindDevice
│   │   │   └── FindDevice.apk #查找设备
│   │   ├── MIService
│   │   │   └── MIService.apk #小米服务框架
│   │   ├── MIUIBrowser
│   │   │   └── MIUIBrowser.apk #MIUI浏览器
│   │   ├── MIUIMusic
│   │   │   └── MIUIMusic.apk #阴乐
│   │   ├── MIUIQuickSearchBox
│   │   │   └── MIUIQuickSearchBox.apk #快速搜索
│   │   ├── MIUIVideo
│   │   │   └── MIUIVideo.apk #小米视频
│   │   ├── MIUIVipService
│   │   │   └── MIUIVipService.apk #游戏加速，这名字我也没想到
│   │   ├── MIUIYellowPage
│   │   │   └── MIUIYellowPage.apk #黄页，具体啥用没研究过
│   │   ├── MiGameCenterSDKService
│   │   │   └── MiGameCenterSDKService.apk #一眼游戏中心，不打游戏的我鉴定为没用
│   │   ├── MiRcs
│   │   │   └── MiRcs.apk #网络短信，笑死平时根本不发短信
│   │   ├── Mirror
│   │   │   └── Mirror.apk #MIUI+，为啥叫镜子我也不知道
│   │   └── Traceur
│   │       └── Traceur.apk #系统追踪，怕是除了耗电没啥用
│   ├── product
│   │   └── app
│   │       └── mi_aiasst_service
│   │           └── mi_aiasst_service.apk #语音助手
│   └── vendor
│       ├── app
│       │   └── MipayService
│       │       └── MipayService.apk #又一个小米支付服务？真nm屎山，就不能合并下吗？雷军！金凡！
│       ├── bin
│       │   ├── mi_thermald #MIUI温控
│       │   └── qti #据说有些手机的这个进程会有异常占用，因此删除
│       └── etc
│           ├── thermal-4k.conf #温控
│           ├── thermal-8k.conf #温控
│           ├── thermal-camera.conf #温控
│           ├── thermal-chg-only.conf #温控
│           ├── thermal-class0.conf #温控
│           ├── thermal-engine.conf #温控
│           ├── thermal-map.conf #温控
│           ├── thermal-mgame.conf #温控
│           ├── thermal-navigation.conf #温控
│           ├── thermal-nolimits.conf #温控
│           ├── thermal-normal.conf #温控
│           ├── thermal-per-camera.conf #温控
│           ├── thermal-per-class0.conf #温控
│           ├── thermal-per-navigation.conf #温控
│           ├── thermal-per-normal.conf #温控
│           ├── thermal-per-video.conf #温控
│           ├── thermal-phone.conf #温控
│           ├── thermal-tgame.conf #温控
│           └── thermal-video.conf #温控
├── system.prop #大量玄学优化prop 
├── system_ext
│   ├── app
│   │   └── SecurityOnetrackService
│   │       └── SecurityOnetrackService.apk #不知道是个啥
│   └── priv-app
│       └── Polaris
│           └── Polaris.apk #应该是北斗相关，但是删了貌似对定位也没啥影响
└── vendor
    └── bin
        └── subsystem_ramdump #ramdump，在我的手机里cpu占用特别离谱，关了没任何异常
```
## 关于logd:            
&emsp;苦逼的作者在debug时发现surfaceflinger和system_server两大进程均检测到logdw套接字调用，如果直接屏蔽logd的话strace中会有相关报错日志，且lsp会严重炸日志，lspd也会疯狂调用日志系统，虽然并不占用cpu，但它会往日志文件里拉屎，如果尝试伪造logdw套接字会立即被删除，由于作者本人知识水平不足，放弃对logdw文件进行伪造，而是选择删掉logd屏蔽相关内容，因此如果你的手机logd占用并不离谱，不建议关闭。          
&emsp;本模块已经移除logd直接关闭功能，因为实测对于作者本人的手机没有任何帮助，因此改为试图减少日志量，如有需要，请手动在模块根目录创建以下文件，内容随意，不是rm -rf /*啥的就行：         
```dircolors
./system/bin/logd
./system/etc/init/logd.rc
```
然后在service.sh中的FuckMIUI函数中写入：         
```lua
killall -9 logd
```
### 关于：         
&emsp;作者是个缝合怪就不用介绍了，模块缝合了一堆没用的玄学优化，甚至连删温控都缝进去了。         
&emsp;一切替换文件内容皆为"Fuck you !"，符合模块主题，非常暴躁。        
&emsp;由于本模块存在非作者原创内容，所以本模块不是我写的，非常合情合理，有问题也别找我👻             
&emsp;刷机、模块本就是逆天而行，出bug卡米啥的也是很正常的喵～         

<p align="center">「  愛にできることはまだあるよ，</p>              
<p align="center">    僕にできることはまだあるよ! 」</p>        
