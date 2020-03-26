//
//  ELKTencentUserInfo.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 登录结果反馈类型 状态
typedef NS_OPTIONS(NSUInteger, ELKTenAuthRespStatus) {
    ELKTenAuthSuccess    = 1 << 0,//!< 授权登录成功
    ELKTenAuthSucData    = 1 << 1,//!< 授权成功并获取用户信息
    ELKTenAuthFailure    = 1 << 2,//!< 授权登录失败
    ELKTenAuthCancel     = 1 << 3,//!< 取消授权登录
};

/// QQ用户信息
@interface ELKTencentUserInfo : NSObject

@property (nonatomic, copy) NSString *openId;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *headImgUrl;
@property (nonatomic, copy) NSString *gender;// 男 | 女

@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *year;


@end

NS_ASSUME_NONNULL_END
