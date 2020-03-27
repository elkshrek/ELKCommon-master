//
//  ELKWeChatPayModel.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/29.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 支付状态反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKWeChatPayRespStatus) {
    ELKWePayRespSuccess = 1 << 0,// 支付成功
    ELKWePayRespFailure = 1 << 1,// 支付失败
    ELKWePayRespCancel  = 1 << 2,// 取消支付
};

/// 微信支付信息
@interface ELKWeChatPayModel : NSObject

@property (nonatomic, copy, nonnull) NSString *partnerId;
@property (nonatomic, copy, nonnull) NSString *prepayId;
@property (nonatomic, copy, nonnull) NSString *package;
@property (nonatomic, copy, nonnull) NSString *nonceStr;
@property (nonatomic, copy, nonnull) NSString *timeStamp;
@property (nonatomic, copy, nonnull) NSString *sign;

@end

NS_ASSUME_NONNULL_END
