//
//  ELKSinaSDKMaster.h
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"
#import "ELKSinaShareModel.h"
#import "ELKSinaUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

// Sina登录授权响应
typedef void(^ELKSinaAuthBlock)(ELKSinaUserInfo *_Nullable userInfo, WBAuthorizeResponse *authResp, ELKSinaAuthRespStatus authStatus);
// Sina分享响应
typedef void(^ELKSinaShareBlock)(ELKSinaShareRespStatus shareStatus);


@interface ELKSinaSDKMaster : NSObject


/// Sina注册
/// @param appId  appId
/// @param enable 是否开启debug调试
+ (void)elk_sinaRegister:(NSString *)appId debug:(BOOL)enable;


/// 检测是否安装了Sina客户端
/// @return  true or failure
+ (BOOL)elk_isSinaInstalled;


/// 通过URL判断是不是微博回调
/// @param url url
+ (BOOL)elk_sinaCheckUrl:(NSURL *)url;


/// handleOpenURL
/// @param url url
+ (BOOL)elk_sinaHandleOpenUrl:(NSURL *)url;


/// Sina授权登录
/// @param authBlock 登录反馈
+ (void)elk_sinaAuthLoginBlock:(ELKSinaAuthBlock)authBlock;


/// Sina分享
/// @param shareInfo  分享信息
/// @param shareBlock 分享结果反馈block
+ (void)elk_sinaShareInfo:(ELKSinaShareModel *)shareInfo shareBlock:(ELKSinaShareBlock)shareBlock;



@end

NS_ASSUME_NONNULL_END
