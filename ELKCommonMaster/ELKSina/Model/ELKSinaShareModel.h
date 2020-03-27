//
//  ELKSinaShareModel.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 分享状态反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKSinaShareRespStatus) {
    ELKSinaShareRespSuccess = 1 << 0,//!< 分享成功
    ELKSinaShareRespFailure = 1 << 1,//!< 分享失败
    ELKSinaShareRespCancel  = 1 << 2,//!< 取消分享
};

/// 新浪分享信息
@interface ELKSinaShareModel : NSObject

@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, copy, nonnull) NSString *desString;
@property (nonatomic, copy, nonnull) NSString *shareLink;
@property (nonatomic, copy, nonnull) NSString *text;
@property (nonatomic, strong, nonnull) UIImage *thumbImage;


@end

NS_ASSUME_NONNULL_END
