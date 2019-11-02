//
//  ELKWeChatUserInfo.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 登录结果反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKWeChatAuthRespStatus) {
    ELKWeAuthRespSuccess   = 1 << 0,//!< 授权登录成功
    ELKWeAuthRespSucData   = 1 << 1,//!< 授权成功并获取用户信息
    ELKWeAuthRespFailure   = 1 << 2,//!< 授权登录失败
    ELKWeAuthRespDeny      = 1 << 3,//!< 授权登录被拒绝
    ELKWeAuthRespCancel    = 1 << 4,//!< 授权用户取消
};

// 获取用户信息反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKWeChatRespInfoStatus) {
    ELKWeRespInfoSuccess   = 1 << 0,// 获取用户信息成功
    ELKWeRespInfoFailure   = 1 << 1,// 获取用户信息失败
};

/// 登录后获取到的用户信息
@interface ELKWeChatUserInfo : NSObject

@property (nonatomic, copy) NSString *unionId;
@property (nonatomic, copy) NSString *openId;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *headImgUrl;
@property (nonatomic, copy) NSString *gender;// 男 | 女

@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *city;


@end

NS_ASSUME_NONNULL_END
