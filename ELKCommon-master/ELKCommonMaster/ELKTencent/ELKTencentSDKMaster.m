//
//  ELKTencentSDKMaster.m
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKTencentSDKMaster.h"


@interface ELKTencentSDKMaster ()<TencentSessionDelegate,TencentLoginDelegate,QQApiInterfaceDelegate>

@property (nonatomic, strong) TencentOAuth *tencentOauth;
@property (nonatomic, copy) NSString *tencentAppId;

@property (nonatomic, copy) ELKTencentAuthBlock authBlock;
@property (nonatomic, copy) ELKTencentLogoutBlock logoutBlock;
@property (nonatomic, copy) ELKTencentShareBlock shareBlock;

@end

@implementation ELKTencentSDKMaster


+ (ELKTencentSDKMaster *)sharedInstance
{
    static ELKTencentSDKMaster * sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ELKTencentSDKMaster alloc] init];
    });
    return sharedInstance;
}


/// 注册Tencent SDK
/// @param appId tencentAppId
+ (void)elk_tencentRegister:(NSString *)appId
{
    ELKTencentSDKMaster *tencent = [ELKTencentSDKMaster sharedInstance];
    tencent.tencentAppId = [appId copy];
    tencent.tencentOauth = [[TencentOAuth alloc] initWithAppId:appId andDelegate:tencent];
    
}


/// 是否安装了腾讯QQ客户端
/// @return true or false
+ (BOOL)elk_isTencentInstalled
{
    return [TencentOAuth iphoneQQInstalled];
}


/// 通过URL判断是不是QQ登录回调
/// @param url url
+ (BOOL)elk_tenAuthCheckUrl:(NSURL *)url
{
    BOOL check = [url.host isEqualToString:@"qzapp"];
    return check;
}


/// Auth Handle Open Url
/// @param url url
+ (BOOL)elk_tenAuthHandleOpenUrl:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}


/// 通过URL判断是不是QQ分享回调
/// @param url url
+ (BOOL)elk_tenInterCheckUrl:(NSURL *)url
{
    BOOL check = [url.host isEqualToString:@"response_from_qq"];
    return check;
}


/// Api Interface Handle Open Url
/// @param url url
+ (BOOL)elk_tenInterHandleOpenUrl:(NSURL *)url
{
    BOOL handle = [QQApiInterface handleOpenURL:url delegate:(id<QQApiInterfaceDelegate>)[ELKTencentSDKMaster sharedInstance]];
    return handle;
}


/// 腾讯QQ登录
/// @param authBlock 登录结果反馈block
+ (void)elk_tencentAuthLoginBlock:(ELKTencentAuthBlock)authBlock
{
    ELKTencentSDKMaster *tencent = [ELKTencentSDKMaster sharedInstance];
    tencent.authBlock = authBlock;
    
    NSArray *permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_GET_INFO, nil];
    [[ELKTencentSDKMaster sharedInstance].tencentOauth authorize:permissions inSafari:NO];
}


/// 腾讯QQ登出
/// @param logoutBlock 登出结果反馈block
+ (void)elk_tencentLogoutBlock:(ELKTencentLogoutBlock)logoutBlock
{
    ELKTencentSDKMaster *tencent = [ELKTencentSDKMaster sharedInstance];
    tencent.logoutBlock = logoutBlock;
    [tencent.tencentOauth logout:tencent];
    
}


/// 分享到腾讯QQ
/// @param shareInfo  分享信息
/// @param sence      ELKTenShareType
/// @param shareBlock 分享结果反馈block
+ (void)elk_tencentShare:(ELKTencentShareModel *)shareInfo sence:(ELKTenShareScene)sence block:(ELKTencentShareBlock)shareBlock
{
    ELKTencentSDKMaster *tencent = [ELKTencentSDKMaster sharedInstance];
    tencent.shareBlock = shareBlock;
    
    NSString *shareLink = shareInfo.shareLink;
    NSString *title = shareInfo.title;
    NSString *description = shareInfo.desString ?: @"";
    NSString *previewImageUrl = shareInfo.previewImageUrl;
    QQApiNewsObject *newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:shareLink] title:title description:description previewImageURL:[NSURL URLWithString:previewImageUrl]];
    
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    
    if (sence == ELKTenSceneMessage) {
        [QQApiInterface sendReq:req];
    } else {
        [QQApiInterface SendReqToQZone:req];
    }
}


#pragma mark - TencentLoginDelegate
// 登录成功回调
- (void)tencentDidLogin
{
    [self.tencentOauth getUserInfo];
}
// 登录失败回调
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if (self.authBlock) {
        ELKTenAuthRespStatus resStatus = ELKTenAuthFailure;
        if (cancelled) {
            resStatus = ELKTenAuthCancel;
        }
        self.authBlock(nil, self.tencentOauth, resStatus);
    }
}
// 登录网络异常
- (void)tencentDidNotNetWork
{
    if (self.authBlock) {
        self.authBlock(nil, self.tencentOauth, ELKTenAuthFailure);
    }
}

#pragma mark - TencentSessionDelegate
// 退出登录回调
- (void)tencentDidLogout
{
    if (self.logoutBlock) {
        self.logoutBlock();
    }
}
// 获取用户个人信息回调
- (void)getUserInfoResponse:(APIResponse *)response
{
    if (URLREQUEST_SUCCEED == response.retCode
        && kOpenSDKErrorSuccess == response.detailRetCode) {
        if (self.authBlock) {
            ELKTencentUserInfo *userInfo = [[ELKTencentUserInfo alloc] init];
            userInfo.openId = [self.tencentOauth.openId copy] ?: @"";
            userInfo.nickName = [response.jsonResponse objectForKey:@"nickname"] ?: @"";
            userInfo.headImgUrl = [response.jsonResponse objectForKey:@"figureurl_qq_2"] ?: @"";
            userInfo.gender = response.jsonResponse[@"gender"] ?: @"男";
            userInfo.city = response.jsonResponse[@"city"] ?: @"";
            userInfo.year = response.jsonResponse[@"year"] ?: @"";
            userInfo.province = response.jsonResponse[@"province"] ?: @"";
            self.authBlock(userInfo, self.tencentOauth, ELKTenAuthSucData);
        }
    } else {
        if (self.authBlock) {
            self.authBlock(nil, self.tencentOauth, ELKTenAuthSuccess);
        }
    }
}

#pragma mark - QQApiInterfaceDelegate
- (void)onReq:(QQBaseReq *)req
{
    
}
// 分享反馈
- (void)onResp:(QQBaseResp *)resp
{
    if ([resp isKindOfClass:[SendMessageToQQResp class]]) {
        SendMessageToQQResp *msgResp = (SendMessageToQQResp *)resp;
        if (self.shareBlock) {
            ELKTenShareRespStatus shareStatus = ELKTenShareRespFailure;
            if ([msgResp.result isEqualToString:@"0"]) {
                shareStatus = ELKTenShareRespSuccess;
            } else if ([msgResp.result isEqualToString:@"-4"]) {
                shareStatus = ELKTenShareRespCancel;
            }
            self.shareBlock(shareStatus);
        }
    }
}
- (void)isOnlineResponse:(NSDictionary *)response
{
    
}



@end
