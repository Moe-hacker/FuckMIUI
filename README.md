<p align="center">You Are Powerful !</p>        
<p align="center">(>_×)</p> 

### 背景：      
&emsp;手里的10U刚刷回MIUI就接到了你懂的电话，细思即恐，遂结合进程列表、部分应用反编译结果、小黄鸟抓包内容制作此模块。         
&emsp;此模块同时对系统进行精简，建议配合不许卡米/核心破解使用。         
&emsp;我们应该从手机厂商手中夺回属于自己的隐私，我们有权利这么做，现在，通过magisk，我们有了能力。        
&emsp;本模块测试环境MIUI 13 22.10.26     
<p align="center">愛にできることはまだあるよ，</p>              
<p align="center">僕にできることはまだあるよ！</p>        

### 使用方法：      
Magisk刷入release中的模块即可。      
### WARNING:        
⚠本模块*无担保*。       
⚠任何本模块带来的损失和法律责任，作者概不负责。         
⚠模块有风险，刷入需谨慎。         
⚠作者本人*将不会为您的设备负任何责任*。          
⚠说人话就是，别干坏事，卡米不负责。
#### 将导致以下功能不可用：          
- 软件商店          
- 手机管家病毒查杀数据库更新          
- 小米云相关       
- 小米账号登录       
- 小米网络位置服务       
- mipush         
- 小爱同学       
- 系统浏览器       
- 小米支付        
- 查找设备        
### 具体删除内容：         
- 一个二进制程序:        
```
/system/bin/logd
```
- 一个二进制库(貌似没必要):        
```
/system/app/Joyose/lib/arm64/libprofilemanager-jni.so
```
- 系统软件包:             
```
/system/app/AnalyticsCore/AnalyticsCore.apk
/system/app/CarWith/CarWith.apk
/system/app/CatchLog/CatchLog.apk
/system/app/CloudService/CloudService.apk
/system/app/FusedLocationProvider/FusedLocationProvider.apk
/system/app/HybridAccessory/HybridAccessory.apk
/system/app/HybridPlatform/HybridPlatform.apk
/system/app/Joyose/Joyose.apk
/system/app/MINextPay/MINextPay.apk
/system/app/MIUISuperMarket/MIUISuperMarket.apk
/system/app/MIUIVpnSdkManager/MIUIVpnSdkManager.apk
/system/app/MIUIgreenguardOld/MIUIgreenguardOld.apk
/system/app/MIpay/MIpay.apk
/system/app/MSA/MSA.apk
/system/app/MaintenanceMode/MaintenanceMode.apk
/system/app/MetokNLP/MetokNLP.apk
/system/app/MiBugReport/MiBugReport.apk
/system/app/MiCloudSync/MiCloudSync.apk
/system/app/MiConnectService/MiConnectService.apk
/system/app/MiuiPaymentService/MiuiPaymentService.apk
/system/app/MiuiPrintSpoolerBeta/MiuiPrintSpoolerBeta.apk
/system/app/ModemTestBox/ModemTestBox.apk
/system/app/SecurityCoreAdd/SecurityCoreAdd.apk
/system/app/VoiceAssist/VoiceAssist.apk
/system/app/VoiceTrigger/VoiceTrigger.apk
/system/app/XiaomiAccount/XiaomiAccount.apk
/system/app/XiaomiServiceFrameworkCN/XiaomiServiceFrameworkCN.apk
/system/app/XiaomiSimActivateService/XiaomiSimActivateService.apk
/system/app/Emapal/Emapal.apk
/system/app/CatcherPatch/CatcherPatch.apk
/system/app/Cit/Cit.apk
/system/app/MiGameService/MiGameService.apk
/system/app/com.xiaomi.macro/com.xiaomi.macro.apk
/system/app/MITSMClient/MITSMClient.apk
/system/app/MIUIPrivacyComputing/MIUIPrivacyComputing.apk
/system/app/com.miui.qr/com.miui.qr.apk
/system/priv-app/BuiltInPrintService/BuiltInPrintService.apk
/system/priv-app/CloudBackup/CloudBackup.apk
/system/priv-app/FindDevice/FindDevice.apk
/system/priv-app/MIService/MIService.apk
/system/priv-app/MIUIBrowser/MIUIBrowser.apk
/system/priv-app/MIUIVipService/MIUIVipService.apk
/system/priv-app/MiRcs/MiRcs.apk
/system/priv-app/Traceur/Traceur.apk
/system/priv-app/Backup/Backup.apk
/system/priv-app/MiGameCenterSDKService/MiGameCenterSDKService.apk
/system/priv-app/MIUIYellowPage/MIUIYellowPage.apk
/system/priv-app/MIUIVideo/MIUIVideo.apk
/system/priv-app/MIUIMusic/MIUIMusic.apk
/system/priv-app/MIUIQuickSearchBox/MIUIQuickSearchBox.apk
/system/product/app/mi_aiasst_service/mi_aiasst_service.apk
/system/vendor/app/MipayService/MipayService.apk
```
#### 域名屏蔽：         
```text
api.installer.xiaomi.com
beacon-api.aliyuncs.com
sdkconfig.ad.xiaomi.com
api-middle.transfer.sec.miui.com
api.sec.miui.com
miui-fxcse.avlyun.com
adv.sec.miui.com
tmfsdk.m.qq.com
miav-cse.avlyun.com
tracking.miui.com
a0.app.xiaomi.com
update.avlyun.sec.miui.com
flash.sec.miui.com
data.sec.miui.com
auth.be.sec.miui.com
mpush-api.aliyun.com
api.miui.security.xiaomi.com
findapi.micloud.xiaomi.net
lbs.map.qq.com
find.api.micloud.xiaomi.net
cdn.exp.xiaomi.com
act.account.xiaomi.com
account.xiaomi.com
app.market.xiaomi.com
adash-emas.cn-hangzhou.aliyuncs.com
sf0.market.xiaomi.com
centertime.ksyun.com
api.kingdata.ksyun.com
file.market.xiaomi.com
slb-p2p.vcloud.ks-live.com
c.id.mi.com
api.account.xiaomi.com
open.account.xiaomi.com
v.id.mi.com
c.id.mi.com
httpdns-sc.aliyuncs.com
h-adashx.ut.taobao.com
api-installer.pt.xiaomi.com
preview-api.installer.xiaomi.com
test-api-installer.pt.xiaomi.com
api.hybrid.intl.xiaomi.com
api.hybrid.xiaomi.com
sdkconfig.ad.intl.xiaomi.com
sdkconfig.ad.xiaomi.com
data.game.xiaomi.com
milink.ac.mi.com
link.g.mi.com
connect-milink.g.mi.com
tz.sec.xiaomi.com
a0.app.xiaomi.com
child.sec.intl.miui.com
child.sec.miui.com
gamebox.sec.miui.com
api.miui.security.xiaomi.com
api.ad.xiaomi.com
auth.be.sec.miui.com
authbe.sec.intl.miui.com
flash.sec.miui.com
data.sec.intl.miui.com
data.sec.miui.com
security.browser.miui.com
adv.sec.intl.miui.com
adv.sec.miui.com
api.jr.mi.com
embed.sec.miui.com
privacy.api.intl.miui.com
api.hybrid.intl.xiaomi.com
apm-rum.inf.miui.com
app.market.xiaomi.com
q-app.market.xiaomi.com
```
#### 版权：          
本模块无任何形式版权限制。        
如果它好用，那它是Moe-hacker制作的。          
如果不好用甚至卡米了，那我不知道它是谁做的。          
<p align="center">見つけてくれてありがとう</p>        
