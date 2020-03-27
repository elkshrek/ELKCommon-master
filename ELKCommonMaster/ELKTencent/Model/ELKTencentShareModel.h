//
//  ELKTencentShareModel.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 分享类型
typedef NS_OPTIONS(NSUInteger, ELKTenShareScene) {
    ELKTenSceneMessage = 1 << 0,//!< 分享到好友
    ELKTenSceneZone    = 1 << 1,//!< 分享到空间
};

// 分享状态反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKTenShareRespStatus) {
    ELKTenShareRespSuccess = 1 << 0,// 分享成功
    ELKTenShareRespFailure = 1 << 1,// 分享失败
    ELKTenShareRespCancel  = 1 << 2,// 取消分享
};

/// QQ分享信息
@interface ELKTencentShareModel : NSObject

@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, copy, nullable) NSString *desString;
@property (nonatomic, copy, nonnull) NSString *shareLink;
@property (nonatomic, copy, nonnull) NSString *previewImageUrl;

@end

NS_ASSUME_NONNULL_END
