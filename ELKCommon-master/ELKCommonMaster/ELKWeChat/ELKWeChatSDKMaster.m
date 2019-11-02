//
//  ELKWeChatSDKMaster.m
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKWeChatSDKMaster.h"
#import "UIImage+ELKMCommon.h"

@interface ELKWeChatSDKMaster ()<WXApiDelegate>

@property (nonatomic, copy, nonnull) NSString *appId;
@property (nonatomic, copy, nonnull) NSString *appSecret;
@property (nonatomic, copy, nonnull) NSString *universalLink;

@property (nonatomic, copy) ELKWeChatAuthBlock elkAuthBlock;
@property (nonatomic, copy) ELKWeChatGainInfoBlock elkGainInfoBlock;
@property (nonatomic, copy) ELKWeChatPayBlock elkPayBlock;
@property (nonatomic, copy) ELKWeChatShareBlock elkShareBlock;

@end

@implementation ELKWeChatSDKMaster


+ (instancetype)sharedInstance
{
    static ELKWeChatSDKMaster *weChatManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weChatManager = [[ELKWeChatSDKMaster alloc] init];
    });
    return weChatManager;
}


/// 通过URL判断是不是微信回调
/// @param url url
+ (BOOL)elk_weChatCheckUrl:(NSURL *)url
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    NSString *appId = wechat.appId ?: @"wx";
    BOOL check = [url.scheme isEqualToString:appId];
    return check;
}


/// handleOpenURL
/// @param url url
+ (BOOL)elk_weChatHandleOpenUrl:(NSURL *)url
{
    BOOL handle = [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)[ELKWeChatSDKMaster sharedInstance]];
    return handle;
}


/// 注册微信SDK
/// @param appId  weChat appId
/// @param secret weChat secret
/// return  success or failure
+ (BOOL)elk_weChatRegister:(NSString *)appId withSecret:(NSString *)secret universalLink:(NSString *)uniLink
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    wechat.appId = [appId copy];
    wechat.appSecret = [secret copy];
    wechat.universalLink = [uniLink copy];
    
    BOOL reg = [WXApi registerApp:appId universalLink:uniLink];
    return reg;
}


/// 检测是否安装微信
+ (BOOL)elk_isWeChatInstalled
{
    return [WXApi isWXAppInstalled];
}


/// 微信登录
/// @param authBlock 登录block
+ (void)elk_weChatAuthLoginBlock:(ELKWeChatAuthBlock)authBlock
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    wechat.elkAuthBlock = authBlock;
    
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo,snsapi_base";
    req.state = @"0744" ;
    [WXApi sendReq:req completion:nil];
}


/// 获取微信用户信息
/// @param authResp  登录成功微信反馈的信息
/// @param infoBlock 微信用户信息block
+ (void)elk_weChatGainInfo:(SendAuthResp *)authResp block:(ELKWeChatGainInfoBlock)infoBlock
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    wechat.elkGainInfoBlock = infoBlock;
    [wechat prepareQueryUserInfo:authResp];
    
}

/// 微信分享 网页分享
/// @param shareInfo  分享信息
/// @param shareSence 分享场景 聊天页面 朋友圈
/// @param shareBlock 分享结果反馈 block
+ (void)elk_weChatShareWebPage:(ELKWeChatShareModel *)shareInfo sence:(ELKWeChatScene)shareSence block:(ELKWeChatShareBlock)shareBlock
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    wechat.elkShareBlock = shareBlock;
    
    WXWebpageObject *webObj = [WXWebpageObject object];
    webObj.webpageUrl = shareInfo.shareLink;
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = shareInfo.title;
    message.description = shareInfo.desString ?: @"";
    UIImage *thumbImg = [shareInfo.thumbImage elk_compressSizeLimitMax:64];
    [message setThumbImage:thumbImg];
    message.mediaObject = webObj;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    
    if (shareSence == ELKWeSceneSession) {
        // 聊天页面
        req.scene = WXSceneSession;
    } else {
        // 朋友圈
        req.scene = WXSceneTimeline;
    }
    
    [WXApi sendReq:req completion:nil];
}


#pragma mark - 查询用户信息
/// 准备查询用户信息
/// @param authResp 登录结果
- (void)prepareQueryUserInfo:(SendAuthResp *)authResp
{
    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", self.appId, self.appSecret, authResp.code];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                // 获取到的三方凭证
                NSString *accessToken = dic[@"access_token"] ?: @"";
                // 三方唯一标识
                NSString *openId = dic[@"openid"] ?: @"";
                [self queryUserInfo:authResp token:accessToken openid:openId];
            }
        });
    });
}

/// 查询用户信息
/// @param authResp    登录结果
/// @param accessToken accessToken
/// @param openId      openId
- (void)queryUserInfo:(SendAuthResp *)authResp token:(NSString *)accessToken openid:(NSString *)openId
{
    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@", accessToken, openId];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                ELKWeChatUserInfo *wechatInfo = [[ELKWeChatUserInfo alloc] init];
                wechatInfo.unionId = dataDict[@"unionid"] ?: @"";
                wechatInfo.openId = dataDict[@"openid"] ?: @"";
                wechatInfo.nickName = dataDict[@"nickname"] ?: @"";
                wechatInfo.headImgUrl = dataDict[@"headimgurl"] ?: @"";
                wechatInfo.province = dataDict[@"province"] ?: @"";
                wechatInfo.country = dataDict[@"country"] ?: @"";
                wechatInfo.city = dataDict[@"city"] ?: @"";
                wechatInfo.language = dataDict[@"language"] ?: @"";
                NSNumber *gender = dataDict[@"sex"] ?: @1;
                wechatInfo.gender = [gender integerValue] ? @"男" : @"女";
                if (self.elkAuthBlock) {
                    self.elkAuthBlock(wechatInfo, authResp, ELKWeAuthRespSucData);
                }
                if (self.elkGainInfoBlock) {
                    self.elkGainInfoBlock(wechatInfo, ELKWeRespInfoSuccess);
                }
            } else {
                if (self.elkAuthBlock) {
                    self.elkAuthBlock(nil, authResp, ELKWeAuthRespSuccess);
                }
                if (self.elkGainInfoBlock) {
                    self.elkGainInfoBlock(nil, ELKWeRespInfoFailure);
                }
            }
        });
    });
}


/// 微信支付
/// @param payInfo    支付信息
/// @param payBlock   支付结果反馈 block
+ (void)elk_weChatPay:(ELKWeChatPayModel *)payInfo block:(ELKWeChatPayBlock)payBlock
{
    ELKWeChatSDKMaster *wechat = [ELKWeChatSDKMaster sharedInstance];
    wechat.elkPayBlock = payBlock;
    
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = payInfo.partnerId;
    request.prepayId = payInfo.prepayId;
    request.package = payInfo.package;
    request.nonceStr = payInfo.nonceStr;
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    request.timeStamp = [payInfo.timeStamp integerValue] ?: timeStamp;
    request.sign = payInfo.sign;
    
    [WXApi sendReq:request completion:nil];
}


#pragma mark- WXApiDelegate
/// 发送一个sendReq后，收到微信的回应
/// @param resp 微信反馈
- (void)onResp:(BaseResp*)resp
{
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        // share
        if (self.elkShareBlock) {
            SendMessageToWXResp *msgResp = (SendMessageToWXResp *)resp;
            ELKWeChatShareRespStatus shareRespStatus = ELKWeShareRespSuccess;
            if (msgResp.errCode == 0) {
                shareRespStatus = ELKWeShareRespSuccess;
            } else if (msgResp.errCode == -2) {
                shareRespStatus = ELKWeShareRespCancel;
            } else {
                shareRespStatus = ELKWeShareRespFailure;
            }
            self.elkShareBlock(shareRespStatus);
        }
    } else if ([resp isKindOfClass:[SendAuthResp class]]) {
        // auth
        if (self.elkAuthBlock) {
            SendAuthResp *authResp = (SendAuthResp *)resp;
            if (authResp.errCode == WXErrCodeAuthDeny) {
                self.elkAuthBlock(nil, authResp, ELKWeAuthRespDeny);
            } else if (authResp.errCode == WXErrCodeUserCancel) {
                self.elkAuthBlock(nil, authResp, ELKWeAuthRespCancel);
            } else if (authResp.errCode == WXErrCodeSentFail || authResp.errCode == WXErrCodeUnsupport) {
                self.elkAuthBlock(nil, authResp, ELKWeAuthRespFailure);
            } else if (authResp.errCode == WXErrCodeCommon) {
                self.elkAuthBlock(nil, authResp, ELKWeAuthRespFailure);
            } else {
                [self prepareQueryUserInfo:authResp];
            }
        }
    } else if ([resp isKindOfClass:[PayResp class]]) {
        // pay
        if (self.elkPayBlock) {
            PayResp *pay = (PayResp *)resp;
            ELKWeChatPayRespStatus payRespStatus = ELKWePayRespSuccess;
            if (pay.errCode == 0) {
                payRespStatus = ELKWePayRespSuccess;
            } else if (pay.errCode == -2) {
                payRespStatus = ELKWePayRespCancel;
            } else {
                payRespStatus = ELKWePayRespFailure;
            }
            self.elkPayBlock(payRespStatus);
        }
    }
}



@end
