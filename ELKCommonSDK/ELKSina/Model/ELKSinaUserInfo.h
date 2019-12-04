//
//  ELKSinaUserInfo.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 登录结果反馈类型
typedef NS_OPTIONS(NSUInteger, ELKSinaAuthRespStatus) {
    ELKSinaAuthSuccess    = 1 << 0,//!< 授权登录成功
    ELKSinaAuthSucData    = 1 << 1,//!< 授权成功并获取用户信息
    ELKSinaAuthFailure    = 1 << 2,//!< 授权登录失败
    ELKSinaAuthCancel     = 1 << 3,//!< 取消授权登录
};

/// 新浪用户信息
@interface ELKSinaUserInfo : NSObject

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *headImgUrl;
@property (nonatomic, copy) NSString *gender;// 男 | 女

@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *province;// province code
@property (nonatomic, copy) NSString *city;// city code

@end

NS_ASSUME_NONNULL_END
