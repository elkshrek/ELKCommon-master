//
//  UIImage+ELKMCommon.h
//  ELKCommon-master
//
//  Created by wing on 2019/10/29.
//  Copyright © 2019 elk. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ELKMCommon)


/// 压缩图片到低于指定大小
/// @param maxLength 单位 KB
- (UIImage *)elk_compressSizeLimitMax:(NSUInteger)maxLength;


/// 压缩图片低于指定大小 返回图片data
/// @param maxLength 单位 KB
- (NSData *)elk_compressImgToDataLimit:(NSUInteger)maxLength;



@end

NS_ASSUME_NONNULL_END
