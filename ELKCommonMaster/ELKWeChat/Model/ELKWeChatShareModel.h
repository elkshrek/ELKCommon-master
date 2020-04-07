//
//  ELKWeChatShareModel.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/29.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 分享类型
typedef NS_OPTIONS(NSUInteger, ELKWeChatScene) {
    ELKWeSceneSession   = 1 << 0,//!< 聊天界面
    ELKWeSceneTimeLine  = 1 << 1,//!< 朋友圈
};

// 分享状态反馈 状态
typedef NS_OPTIONS(NSUInteger, ELKWeChatShareRespStatus) {
    ELKWeShareRespSuccess = 1 << 0,// 分享成功
    ELKWeShareRespFailure = 1 << 1,// 分享失败
    ELKWeShareRespCancel  = 1 << 2,// 取消分享
};

/// 微信分享信息
@interface ELKWeChatShareModel : NSObject

@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, copy, nullable) NSString *desString;
@property (nonatomic, copy, nonnull) NSString *shareLink;
@property (nonatomic, strong, nonnull) UIImage *thumbImage;

@end

NS_ASSUME_NONNULL_END
