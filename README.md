# ELKCommonMaster简单易用的登录/分享/支付三方库集成方案    


### 1、主要功能

> 1）快速集成微信登录、分享、支付功能；    
> 2）快速集成腾讯 QQ 登录、分享功能；    
> 3）快速集成新浪微博登录、分享功能;        


### 2、搭建开发环境（通过 CocoaPods 集成）

#### 2.1、使用``` CocoaPods ```搜索``` ELKCommonMaster ```开源库：

``` 
# 搜索 ELKCommonMaster 库
pod search ELKCommonMaster
# 如果上面的搜索语法搜不到结果，可使用下面的语法进行搜索
pod search ELKCommonMaster --simple
```

搜索结果如下：

```
简单易用通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享
pod 'ELKCommonMaster', '~> 1.0.5'
- Homepage: https://github.com/elkshrek/ELKCommon-master
- Source:   https://github.com/elkshrek/ELKCommon-master.git
- Versions: 1.0.5, 1.0.4, 1.0.3, 1.0.2, 1.0.1, 1.0.0, 0.2.7, 0.2.6, 0.2.4, 0.2.2, 0.2.1, 0.1.0, 0.0.9,
0.0.8, 0.0.6, 0.0.1 [master repo] - 1.0.5, 1.0.4, 1.0.3, 1.0.2, 1.0.1, 1.0.0, 0.2.7, 0.2.6, 0.2.4, 0.2.2,
0.2.1, 0.1.0, 0.0.9, 0.0.8, 0.0.6, 0.0.1 [trunk repo]
- Subspecs:
   - ELKCommonMaster/ELKModule (1.0.5)
   - ELKCommonMaster/ELKTencent (1.0.5)
   - ELKCommonMaster/ELKWeChat (1.0.5)
   - ELKCommonMaster/ELKSina (1.0.5)
```

#### 2.2、集成 ELKCommonMaster 库     

根据自己的需求，可以选择性的集成微信、QQ、新浪微博中的任意一个或多个功能，三种全部需要集成时，在工程的``` Podfile ``` 中添加如下代码：

```
pod 'ELKCommonMaster'
```

只集成其中的某个功能，在工程的``` Podfile ``` 中添加如下对应代码：

```
# 集成微信登录、分享、支付功能
pod 'ELKCommonMaster/ELKWeChat'
# 集成腾讯 QQ 登录、分享功能
pod 'ELKCommonMaster/ELKTencent'
# 集成新浪微博登录、分享功能
pod 'ELKCommonMaster/ELKSina'
```

保存并执行``` pod install ```，然后用后缀为``` .xcworkspace ```的文件打开工程。

##### 注意:

命令行下执行``` pod search ELKCommonMaster ```，如显示的``` ELKCommonMaster ```版本不是最新的，则先执行``` pod repo update ```操作更新本地``` repo ```的内容。

关于``` CocoaPods ```的更多信息请查看 [CocoaPods 官方网站](https://cocoapods.org) 。    

#### 2.3、在``` Xcode ```中配置三方信息

##### 2.3.1、配置「微信API」信息 

由于苹果``` iOS 13 ```系统版本安全升级，微信SDK在``` v1.8.6 ```版本及以后支持``` Universal Links ```方式跳转，对openSDK分享进行合法性校验，具体``` Universal Links ```配置及使用参见：[微信官方接入指南](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Access_Guide/iOS.html)。

1）``` Xcode ```设置``` URL scheme ```

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type“添加“URL scheme”，值为你在微信开放平台所注册的应用程序 id（如下图所示）。  

![Wechat设置URL scheme](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnwechatscheme.png)

2）``` Xcode ```设置``` LSApplicationQueriesSchemes ```   

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“``` LSApplicationQueriesSchemes ```“添加``` weixin ```和``` weixinULAPI ```（如下图所示）。

![Wechat设置LSApplicationQueriesSchemes](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnwechatInfo.png)

##### 2.3.2、配置「腾讯QQ API」信息 

腾讯QQ API接入具体可参考：[腾讯QQ API官方接入指南](https://wiki.open.qq.com/index.php?title=iOS_SDK环境搭建)。

1）``` Xcode ```设置``` URL scheme ```

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type”添加“URL scheme”，新的 scheme = tencent + appid 。（如下图所示）

![Tencent设置URL scheme](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmntencentscheme.png)

2）``` Xcode ```设置``` LSApplicationQueriesSchemes ```   

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“``` LSApplicationQueriesSchemes ```“添加``` tencent ```和``` QQ ```（如下图所示）。

![Tencent设置LSApplicationQueriesSchemes](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmntencentInfo.png)

##### 2.3.3、配置「新浪微博 API」信息 

新浪微博 API接入具体可参考：[新浪微博官方接入指南](https://github.com/sinaweibosdk/weibo_ios_sdk)。

1）``` Xcode ```设置``` URL scheme ```

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type”添加“URL scheme”，新的 scheme = wb + appkey 。（如下图所示）

![sina设置URL scheme](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnsinascheme.png)

2）``` Xcode ```设置``` LSApplicationQueriesSchemes ```   

在 Xcode 中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“``` LSApplicationQueriesSchemes ```“添加``` sina ```、``` sinaweibo ```、``` weibo ```（如下图所示）。

![sina设置LSApplicationQueriesSchemes](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnsinaInfo.png)

##### 2.3.4、配置信息总览

1）Info 中``` URL scheme ```总览图：

![LSApplicationQueriesSchemes总览](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnschemecomplete.png)

2）Info 中``` LSApplicationQueriesSchemes  ```总览图：

![LSApplicationQueriesSchemes总览](https://gitee.com/elkshrek/ELKPic/raw/pic/elkcmnmaster/cmnInfocomplete.png)

### 3、集成三方功能

#### 3.1、集成 ELKCommonMaster 全部功能

在需要使用功能的地方导入头文件 ``` #import "ELKCommonMaster.h" ```。    
1）在``` AppDelegate ```的``` application:didFinishLaunchingWithOptions ```函数中注册微信、腾讯QQ、新浪微博的id；

```  
// WeChat
[ELKWeChatSDKMaster elk_weChatRegister:ELKWeChatAppId withSecret:ELKWeChatSecret universalLink:ELKWeChatUniLink];
// Sina
[ELKSinaSDKMaster elk_sinaRegister:ELKSinaAppId debug:YES];
// Tencent
[ELKTencentSDKMaster elk_tencentRegister:ELKTencentAppId];
```

2）重写``` AppDelegate ```的``` handleOpenURL ```和``` openURL ```方法，调用```  [ELKCommonMaster elk_commonApplication:app openUrl:url];```方法：

```
// iOS 9.0 以上系统
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [ELKCommonMaster elk_commonApplication:app openUrl:url];
}
// iOS 9.0以下系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ELKCommonMaster elk_commonApplication:application openUrl:url];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ELKCommonMaster elk_commonApplication:application openUrl:url];
}
```

3）、在用到功能的地方发起登录、分享、支付功能，并通过回调获取结果和数据。

3.1）、微信登录

```
// 微信登录并获取用户信息，异步返回用户信息
[ELKWeChatSDKMaster elk_weChatAuthLoginBlock:^(ELKWeChatUserInfo * _Nullable userInfo, SendAuthResp * _Nonnull authResp, ELKWeChatAuthRespStatus authStatus) {
    if (authStatus == ELKWeAuthRespSucData) {
        NSLog(@"WeChat logged in successfully and obtained user information : %@", userInfo);
    } else if (authStatus == ELKWeAuthRespSuccess) {
        NSLog(@"WeChat logged in successfully, but failed to get user information");
    } else if (authStatus == ELKWeAuthRespCancel) {
        NSLog(@"User canceled WeChat login");
    } else if (authStatus == ELKWeAuthRespDeny) {
        NSLog(@"WeChat authorized login denied");
    } else {
        NSLog(@"WeChat login failed");
    }
}];
```

3.2）、微信分享

```
// 微信分享：聊天界面-ELKWeSceneSession || 朋友圈-ELKWeSceneTimeLine
ELKWeChatShareModel *shareModel = [[ELKWeChatShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To WeChat";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
// 分享时会自动压缩图片大小到微信许可的64kbit以内
shareModel.thumbImage = [UIImage imageNamed:@"wing"];

[ELKWeChatSDKMaster elk_weChatShareWebPage:shareModel sence:ELKWeSceneSession block:^(ELKWeChatShareRespStatus shareStatus) {
    if (shareStatus == ELKWeShareRespSuccess) {
        NSLog(@"WeChat Share Success");
    } else if (shareStatus == ELKWeShareRespCancel) {
        NSLog(@"User Canceled WeChat Share");
    } else {
        NSLog(@"WeChat Share failed");
    }
}];
```

3.3）、微信支付

``` 
// 微信支付
ELKWeChatPayModel *payInfo = [[ELKWeChatPayModel alloc] init];
payInfo.partnerId = @"partnerId";
payInfo.prepayId = @"prepayId";
payInfo.package = @"package";
payInfo.nonceStr = @"nonceStr";
payInfo.timeStamp = @"timeStamp";
payInfo.sign = @"sign";

[ELKWeChatSDKMaster elk_weChatPay:payInfo block:^(ELKWeChatPayRespStatus payRespStatus) {
    if (payRespStatus == ELKWePayRespSuccess) {
        NSLog(@"Wechat Pay Success");
    } else if (payRespStatus == ELKWePayRespCancel) {
        NSLog(@"User Canceled Wechat Pay");
    } else {
        NSLog(@"Wechat Pay Failure");
    }
}];
```

3.4）、腾讯 QQ 登录

```
// QQ登录，并获取用户信息
[ELKTencentSDKMaster elk_tencentAuthLoginBlock:^(ELKTencentUserInfo * _Nullable userInfo, ELKTenAuthRespStatus authStatus) {
    if (authStatus == ELKTenAuthSucData) {
        NSLog(@"QQ logged in successfully and obtained user information : %@", userInfo);
    } else if (authStatus == ELKTenAuthSuccess) {
        NSLog(@"QQ logged in successfully, but failed to get user information");
    } else if (authStatus == ELKTenAuthCancel) {
        NSLog(@"User canceled QQ login");
    } else {
        NSLog(@"QQ login failed");
    }
}];
```

3.5）、腾讯 QQ 分享

```
// 腾讯 QQ 分享：分享好友-ELKTenSceneMessage || 分享空间-ELKTenSceneZone
ELKTencentShareModel *shareModel = [[ELKTencentShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To QQ";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
shareModel.previewImageUrl = @"";

[ELKTencentSDKMaster elk_tencentShare:shareModel sence:ELKTenSceneMessage block:^(ELKTenShareRespStatus shareStatus) {
    if (shareStatus == ELKTenShareRespSuccess) {
        NSLog(@"Tencent Share Success");
    } else if (shareStatus == ELKTenShareRespCancel) {
        NSLog(@"User Canceled Tencent Share");
    } else {
        NSLog(@"Tencent Share failed");
    }
}];
```

3.6）、新浪微博登录

```
// 新浪微博登录，并获取用户信息
[ELKSinaSDKMaster elk_sinaAuthLoginBlock:^(ELKSinaUserInfo * _Nullable userInfo, WBAuthorizeResponse * _Nonnull authResp, ELKSinaAuthRespStatus authStatus) {
        if (authStatus == ELKSinaAuthSucData) {
            NSLog(@"Sina logged in successfully and obtained user information : %@", userInfo);
        } else if (authStatus == ELKSinaAuthSuccess) {
            NSLog(@"Sina logged in successfully, but failed to get user information");
        } else if (authStatus == ELKSinaAuthCancel) {
            NSLog(@"User canceled Sina login");
        } else {
            NSLog(@"Sina login failed");
        }
    }];
```

3.7）、新浪微博分享

```
// 新浪微博分享
ELKSinaShareModel *shareModel = [[ELKSinaShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To Sina";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
// 分享时会自动压缩图片大小到新浪微博许可的32kbit以内
shareModel.thumbImage = [UIImage imageNamed:@"wing"];
shareModel.text = @"";

[ELKSinaSDKMaster elk_sinaShareInfo:shareModel shareBlock:^(ELKSinaShareRespStatus shareStatus) {
    if (shareStatus == ELKSinaShareRespSuccess) {
        NSLog(@"Sina Share Success");
    } else if (shareStatus == ELKSinaShareRespCancel) {
        NSLog(@"User Canceled Sina Share");
    } else {
        NSLog(@"Sina Share failed");
    }
}];
```

#### 3.2、单独集成部分功能

单独集成微信、腾讯QQ、新浪微博中的一个或两个，执行``` pod install ```之后，只会导入对应的内容和官方SDK。  

##### 3.2.1、集成微信登录、分享、支付功能

在需要使用功能的地方导入头文件``` #import "ELKWeChatSDKMaster.h" ```。

1）在AppDelegate的application:didFinishLaunchingWithOptions函数中注册微信id；

```
// WeChat
[ELKWeChatSDKMaster elk_weChatRegister:ELKWeChatAppId withSecret:ELKWeChatSecret universalLink:ELKWeChatUniLink];
```

2）重写```AppDelegate```的``` handleOpenURL ```和``` openURL ```方法，校验微信SDK的配置状态，是否允许调起功能和打开应用：

```
// iOS 9.0 以上系统
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([ELKWeChatSDKMaster elk_weChatCheckUrl:url]) {
        // WeChat
        return [ELKWeChatSDKMaster elk_weChatHandleOpenUrl:url];
    }
    return NO;
}
// iOS 9.0以下系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([ELKWeChatSDKMaster elk_weChatCheckUrl:url]) {
        // WeChat
        return [ELKWeChatSDKMaster elk_weChatHandleOpenUrl:url];
    }
    return NO;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([ELKWeChatSDKMaster elk_weChatCheckUrl:url]) {
        // WeChat
        return [ELKWeChatSDKMaster elk_weChatHandleOpenUrl:url];
    }
    return NO;
}
```

3）、在用到微信的登录、分享、支付功能的地方直接调用微信的功能代码，并通过回调获取结果和数据。

3.1）、微信登录

```
// 微信登录并获取用户信息，异步返回用户信息
[ELKWeChatSDKMaster elk_weChatAuthLoginBlock:^(ELKWeChatUserInfo * _Nullable userInfo, SendAuthResp * _Nonnull authResp, ELKWeChatAuthRespStatus authStatus) {
    if (authStatus == ELKWeAuthRespSucData) {
        NSLog(@"WeChat logged in successfully and obtained user information : %@", userInfo);
    } else if (authStatus == ELKWeAuthRespSuccess) {
        NSLog(@"WeChat logged in successfully, but failed to get user information");
    } else if (authStatus == ELKWeAuthRespCancel) {
        NSLog(@"User canceled WeChat login");
    } else if (authStatus == ELKWeAuthRespDeny) {
        NSLog(@"WeChat authorized login denied");
    } else {
        NSLog(@"WeChat login failed");
    }
}];
```

3.2）、微信分享

```
// 微信分享：聊天界面-ELKWeSceneSession || 朋友圈-ELKWeSceneTimeLine
ELKWeChatShareModel *shareModel = [[ELKWeChatShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To WeChat";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
// 分享时会自动压缩图片大小到微信许可的64kbit以内
shareModel.thumbImage = [UIImage imageNamed:@"wing"];

[ELKWeChatSDKMaster elk_weChatShareWebPage:shareModel sence:ELKWeSceneSession block:^(ELKWeChatShareRespStatus shareStatus) {
    if (shareStatus == ELKWeShareRespSuccess) {
        NSLog(@"WeChat Share Success");
    } else if (shareStatus == ELKWeShareRespCancel) {
        NSLog(@"User Canceled WeChat Share");
    } else {
        NSLog(@"WeChat Share failed");
    }
}];
```

3.3）、微信支付

``` 
// 微信支付
ELKWeChatPayModel *payInfo = [[ELKWeChatPayModel alloc] init];
payInfo.partnerId = @"partnerId";
payInfo.prepayId = @"prepayId";
payInfo.package = @"package";
payInfo.nonceStr = @"nonceStr";
payInfo.timeStamp = @"timeStamp";
payInfo.sign = @"sign";

[ELKWeChatSDKMaster elk_weChatPay:payInfo block:^(ELKWeChatPayRespStatus payRespStatus) {
    if (payRespStatus == ELKWePayRespSuccess) {
        NSLog(@"Wechat Pay Success");
    } else if (payRespStatus == ELKWePayRespCancel) {
        NSLog(@"User Canceled Wechat Pay");
    } else {
        NSLog(@"Wechat Pay Failure");
    }
}];
```

##### 3.2.2、集成腾讯QQ登录、分享功能

在需要使用功能的地方导入头文件``` #import "ELKTencentSDKMaster.h" ```。

1）在AppDelegate的application:didFinishLaunchingWithOptions函数中注册腾讯QQ id；

```
// Tencent
[ELKTencentSDKMaster elk_tencentRegister:ELKTencentAppId];
```

2）重写```AppDelegate```的``` handleOpenURL ```和``` openURL ```方法，校验腾讯QQ SDK的配置状态，是否允许调起功能和打开应用：

```
// iOS 9.0 以上系统
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterfaceCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterfaceHandleOpenUrl:url];
    }
    return NO;
}
// iOS 9.0以下系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterfaceCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterfaceHandleOpenUrl:url];
    }
    return NO;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterfaceCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterfaceHandleOpenUrl:url];
    }
    return NO;
}
```

3）、在用到腾讯QQ的登录、分享功能的地方直接调用腾讯QQ的功能代码，并通过回调获取结果和数据。

3.1）、腾讯 QQ 登录

```
// QQ登录，并获取用户信息
[ELKTencentSDKMaster elk_tencentAuthLoginBlock:^(ELKTencentUserInfo * _Nullable userInfo, ELKTenAuthRespStatus authStatus) {
    if (authStatus == ELKTenAuthSucData) {
        NSLog(@"QQ logged in successfully and obtained user information : %@", userInfo);
    } else if (authStatus == ELKTenAuthSuccess) {
        NSLog(@"QQ logged in successfully, but failed to get user information");
    } else if (authStatus == ELKTenAuthCancel) {
        NSLog(@"User canceled QQ login");
    } else {
        NSLog(@"QQ login failed");
    }
}];
```

3.2）、腾讯 QQ 分享

```
// 腾讯 QQ 分享：分享好友-ELKTenSceneMessage || 分享空间-ELKTenSceneZone
ELKTencentShareModel *shareModel = [[ELKTencentShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To QQ";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
shareModel.previewImageUrl = @"";

[ELKTencentSDKMaster elk_tencentShare:shareModel sence:ELKTenSceneMessage block:^(ELKTenShareRespStatus shareStatus) {
    if (shareStatus == ELKTenShareRespSuccess) {
        NSLog(@"Tencent Share Success");
    } else if (shareStatus == ELKTenShareRespCancel) {
        NSLog(@"User Canceled Tencent Share");
    } else {
        NSLog(@"Tencent Share failed");
    }
}];
```

##### 3.2.3、集成新浪微博登录、分享功能

在需要使用功能的地方导入头文件``` #import "ELKSinaSDKMaster.h" ```。

1）在AppDelegate的application:didFinishLaunchingWithOptions函数中注册新浪微博 id；

```
// Sina
[ELKSinaSDKMaster elk_sinaRegister:ELKSinaAppId debug:YES];
```

2）重写```AppDelegate```的``` handleOpenURL ```和``` openURL ```方法，校验新浪微博 SDK的配置状态，是否允许调起功能和打开应用：

```
// iOS 9.0 以上系统
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([ELKSinaSDKMaster elk_sinaCheckUrl:url]) {
        // Sina
        return [ELKSinaSDKMaster elk_sinaHandleOpenUrl:url];
    }
    return NO;
}
// iOS 9.0以下系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([ELKSinaSDKMaster elk_sinaCheckUrl:url]) {
        // Sina
        return [ELKSinaSDKMaster elk_sinaHandleOpenUrl:url];
    }
    return NO;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([ELKSinaSDKMaster elk_sinaCheckUrl:url]) {
        // Sina
        return [ELKSinaSDKMaster elk_sinaHandleOpenUrl:url];
    }
    return NO;
}
```

3）、在用到新浪微博登录、分享功能的地方直接调用新浪微博的功能代码，并通过回调获取结果和数据。

3.1）、新浪微博登录

```
// 新浪微博登录，并获取用户信息
[ELKSinaSDKMaster elk_sinaAuthLoginBlock:^(ELKSinaUserInfo * _Nullable userInfo, WBAuthorizeResponse * _Nonnull authResp, ELKSinaAuthRespStatus authStatus) {
    if (authStatus == ELKSinaAuthSucData) {
        NSLog(@"Sina logged in successfully and obtained user information : %@", userInfo);
    } else if (authStatus == ELKSinaAuthSuccess) {
        NSLog(@"Sina logged in successfully, but failed to get user information");
    } else if (authStatus == ELKSinaAuthCancel) {
        NSLog(@"User canceled Sina login");
    } else {
        NSLog(@"Sina login failed");
    }
}];
```

3.2）、新浪微博分享

```
// 新浪微博分享
ELKSinaShareModel *shareModel = [[ELKSinaShareModel alloc] init];
shareModel.title = @"ELKCommonMaster";
shareModel.desString = @"Share To Sina";
shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
// 分享时会自动压缩图片大小到新浪微博许可的32kbit以内
shareModel.thumbImage = [UIImage imageNamed:@"wing"];
shareModel.text = @"";

[ELKSinaSDKMaster elk_sinaShareInfo:shareModel shareBlock:^(ELKSinaShareRespStatus shareStatus) {
    if (shareStatus == ELKSinaShareRespSuccess) {
        NSLog(@"Sina Share Success");
    } else if (shareStatus == ELKSinaShareRespCancel) {
        NSLog(@"User Canceled Sina Share");
    } else {
        NSLog(@"Sina Share failed");
    }
}];
```

