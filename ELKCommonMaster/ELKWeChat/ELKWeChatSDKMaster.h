//
//  ELKWeChatSDKMaster.h
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiObject.h"
#import "ELKWeChatShareModel.h"
#import "ELKWeChatPayModel.h"
#import "ELKWeChatUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

// 微信登录授权
typedef void(^ELKWeChatAuthBlock)(ELKWeChatUserInfo *_Nullable userInfo, SendAuthResp *authResp, ELKWeChatAuthRespStatus authStatus);
typedef void(^ELKWeChatGainInfoBlock)(ELKWeChatUserInfo *_Nullable userInfo, ELKWeChatRespInfoStatus respStatus);
// 微信分享
typedef void(^ELKWeChatShareBlock)(ELKWeChatShareRespStatus shareStatus);
// 微信支付
typedef void(^ELKWeChatPayBlock)(ELKWeChatPayRespStatus payRespStatus);


@interface ELKWeChatSDKMaster : NSObject


/// 检测是否安装微信
/// @return  true or failure
+ (BOOL)elk_isWeChatInstalled;


/// 注册微信SDK
/// @param appId   weChat appId
/// @param secret  weChat secret
/// @param uniLink universalLink
/// return  success or failure
+ (BOOL)elk_weChatRegister:(NSString *)appId withSecret:(NSString *)secret universalLink:(NSString *)uniLink;


/// 通过URL判断是不是微信回调
/// @param url url
+ (BOOL)elk_weChatCheckUrl:(NSURL *)url;


/// handleOpenURL
/// @param url url
+ (BOOL)elk_weChatHandleOpenUrl:(NSURL *)url;


/// 微信登录
/// @param authBlock 登录block
+ (void)elk_weChatAuthLoginBlock:(ELKWeChatAuthBlock)authBlock;


/// 获取微信用户信息
/// @param authResp  登录成功微信反馈的信息
/// @param infoBlock 微信用户信息block
+ (void)elk_weChatGainInfo:(SendAuthResp *)authResp block:(ELKWeChatGainInfoBlock)infoBlock;


/// 微信分享 网页分享
/// @param shareInfo  分享信息
/// @param shareSence 分享场景 聊天页面 朋友圈
/// @param shareBlock 分享结果反馈 block
+ (void)elk_weChatShareWebPage:(ELKWeChatShareModel *)shareInfo sence:(ELKWeChatScene)shareSence block:(ELKWeChatShareBlock)shareBlock;


/// 微信支付
/// @param payInfo    支付信息
/// @param payBlock   支付结果反馈 block
+ (void)elk_weChatPay:(ELKWeChatPayModel *)payInfo block:(ELKWeChatPayBlock)payBlock;



@end

NS_ASSUME_NONNULL_END
