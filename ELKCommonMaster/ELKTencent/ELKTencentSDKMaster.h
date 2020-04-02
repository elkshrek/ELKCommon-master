//
//  ELKTencentSDKMaster.h
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELKTencentShareModel.h"
#import "ELKTencentUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

// Tencent登录授权响应
typedef void(^ELKTencentAuthBlock)(ELKTencentUserInfo *_Nullable userInfo, ELKTenAuthRespStatus authStatus);
// Tencent登出响应
typedef void(^ELKTencentLogoutBlock)(void);
// Tencent分享响应
typedef void(^ELKTencentShareBlock)(ELKTenShareRespStatus shareStatus);

@interface ELKTencentSDKMaster : NSObject


/// 注册Tencent SDK
/// @param appId tencentAppId
+ (void)elk_tencentRegister:(NSString * _Nonnull)appId;


/// 是否安装了腾讯QQ客户端
/// @return true or false
+ (BOOL)elk_isTencentInstalled;


/// 通过URL判断是不是QQ登录回调
/// @param url url
+ (BOOL)elk_tenAuthCheckUrl:(NSURL *)url;


/// Auth Handle Open Url
/// @param url url
+ (BOOL)elk_tenAuthHandleOpenUrl:(NSURL *)url;


/// 通过URL判断是不是QQ分享回调
/// @param url url
+ (BOOL)elk_tenInterCheckUrl:(NSURL *)url;


/// Api Interface Handle Open Url
/// @param url url
+ (BOOL)elk_tenInterHandleOpenUrl:(NSURL *)url;


/// 腾讯QQ登录
/// @param authBlock 登录结果反馈block
+ (void)elk_tencentAuthLoginBlock:(ELKTencentAuthBlock)authBlock;


/// 腾讯QQ登出
/// @param logoutBlock 登出结果反馈block
+ (void)elk_tencentLogoutBlock:(ELKTencentLogoutBlock)logoutBlock;


/// 分享到腾讯QQ
/// @param shareInfo  分享信息
/// @param sence      ELKTenShareType
/// @param shareBlock 分享结果反馈block
+ (void)elk_tencentShare:(ELKTencentShareModel *)shareInfo sence:(ELKTenShareScene)sence block:(ELKTencentShareBlock)shareBlock;



@end

NS_ASSUME_NONNULL_END
