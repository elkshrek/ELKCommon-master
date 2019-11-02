//
//  ELKSinaSDKMaster.m
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKSinaSDKMaster.h"
#import "UIImage+ELKMCommon.h"

@interface ELKSinaSDKMaster()<WeiboSDKDelegate,WBHttpRequestDelegate>

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *sinaSchema;

@property (nonatomic, strong) WBAuthorizeResponse *authResp;
@property (nonatomic, copy) NSString *sinaAccessToken;

@property (nonatomic, copy) ELKSinaAuthBlock authBlock;
@property (nonatomic, copy) ELKSinaShareBlock shareBlock;

@end

@implementation ELKSinaSDKMaster


+ (ELKSinaSDKMaster *)sharedInstance
{
    static ELKSinaSDKMaster * sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ELKSinaSDKMaster alloc] init];
    });
    return sharedInstance;
}


// Sina注册
+ (void)elk_sinaRegister:(NSString *)appId debug:(BOOL)enable
{
    [WeiboSDK enableDebugMode:enable];
    [WeiboSDK registerApp:appId];
    ELKSinaSDKMaster *sina = [ELKSinaSDKMaster sharedInstance];
    sina.appId = [appId copy];
    sina.sinaSchema = [NSString stringWithFormat:@"wb%@", appId];
    
}


// 检测是否安装了微博
+ (BOOL)elk_isSinaInstalled
{
    return [WeiboSDK isWeiboAppInstalled];
}


/// 通过URL判断是不是微博回调
/// @param url url
+ (BOOL)elk_sinaCheckUrl:(NSURL *)url
{
    ELKSinaSDKMaster *sina = [ELKSinaSDKMaster sharedInstance];
    NSString *schema = sina.sinaSchema ?: @"wb";
    BOOL check = [url.scheme isEqualToString:schema];
    return check;
}


/// handleOpenURL
/// @param url url
+ (BOOL)elk_sinaHandleOpenUrl:(NSURL *)url
{
    BOOL handle = [WeiboSDK handleOpenURL:url delegate:(id<WeiboSDKDelegate>)[ELKSinaSDKMaster sharedInstance]];
    return handle;
}


/// Sina授权登录
/// @param authBlock 登录反馈
+ (void)elk_sinaAuthLoginBlock:(ELKSinaAuthBlock)authBlock
{
    ELKSinaSDKMaster *sina = [ELKSinaSDKMaster sharedInstance];
    sina.authBlock = authBlock;
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://www.weibo.com";
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": NSStringFromClass([self class]),
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    
    [WeiboSDK sendRequest:request];
}


/// Sina分享
/// @param shareInfo  分享信息
/// @param shareBlock 分享结果反馈block
+ (void)elk_sinaShareInfo:(ELKSinaShareModel *)shareInfo shareBlock:(ELKSinaShareBlock)shareBlock
{
    ELKSinaSDKMaster *sina = [ELKSinaSDKMaster sharedInstance];
    sina.shareBlock = shareBlock;
    
    WBMessageObject *message = [WBMessageObject message];
    message.text = shareInfo.text;
    
    WBWebpageObject *webpage = [WBWebpageObject object];
    webpage.objectID = @"elkSinaShare";
    webpage.title = shareInfo.title;
    webpage.description = shareInfo.desString;
    webpage.webpageUrl = shareInfo.shareLink;
    NSData *thumbImgData = [shareInfo.thumbImage elk_compressImgToDataLimit:32];
    webpage.thumbnailData = thumbImgData;
    
    message.mediaObject = webpage;
    
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.redirectURI = @"http://www.weibo.com";
    authRequest.scope = @"all";
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    request.userInfo = @{@"ShareMessageFrom": NSStringFromClass([self class]),
                         @"Other_Info_1":@(1234),
                         @"Other_Info_2":@[@"obj1", @"obj2"],
                         @"Other_Info_3":@{@"key1":@"obj1", @"key2":@"obj2"}};
    [WeiboSDK sendRequest:request];
}


// 请求sina用户信息
- (void)querySinaUserInfo:(WBAuthorizeResponse *)response
{
    NSString *accessToken = [response accessToken];
    NSString *userId = [response userID];
    self.sinaAccessToken = [accessToken copy];
    self.authResp = response;
    
    NSDictionary *params = @{@"access_token":accessToken,
                             @"uid":userId
                             };
    [WBHttpRequest requestWithURL:@"https://api.weibo.com/2/users/show.json" httpMethod:@"GET" params:params delegate:self withTag:@"starDream"];
}
- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (resDict) {
        ELKSinaUserInfo *userInfo = [[ELKSinaUserInfo alloc] init];
        userInfo.accessToken = self.sinaAccessToken ?: @"";
        userInfo.nickName = resDict[@"name"] ?: @"";
        userInfo.headImgUrl = resDict[@"avatar_large"] ?: @"";
        NSString *gender = @"女";
        if ([resDict[@"gender"] isEqualToString:@"m"]){
            gender = @"男";
        }
        userInfo.gender = gender;
        userInfo.language = resDict[@"lang"] ?: @"zh-cn";
        userInfo.province = resDict[@"province"] ?: @"";
        userInfo.city = resDict[@"city"] ?: @"";
        if (self.authBlock) {
            self.authBlock(userInfo, self.authResp, ELKSinaAuthSucData);
        }
    } else {
        if (self.authBlock) {
            self.authBlock(nil, self.authResp, ELKSinaAuthSuccess);
        }
    }
}

#pragma mark- WeiboSDKDelegate
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        if (self.authBlock) {
            WBAuthorizeResponse *authResp = (WBAuthorizeResponse *)response;
            if (authResp.statusCode == WeiboSDKResponseStatusCodeSuccess) {
                [self querySinaUserInfo:authResp];
            } else if (authResp.statusCode == WeiboSDKResponseStatusCodeUserCancel) {
                self.authBlock(nil, authResp, ELKSinaAuthCancel);
            } else {
                self.authBlock(nil, authResp, ELKSinaAuthFailure);
            }
        }
    } else if ([response isKindOfClass:[WBSendMessageToWeiboResponse class]]) {
        if (self.shareBlock) {
            WBSendMessageToWeiboResponse *shareResp = (WBSendMessageToWeiboResponse *)response;
            if (shareResp.statusCode == WeiboSDKResponseStatusCodeSuccess) {
                self.shareBlock(ELKSinaShareRespSuccess);
            } else if (shareResp.statusCode == WeiboSDKResponseStatusCodeUserCancel) {
                self.shareBlock(ELKSinaShareRespCancel);
            } else {
                self.shareBlock(ELKSinaShareRespFailure);
            }
        }
    }
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}




@end
