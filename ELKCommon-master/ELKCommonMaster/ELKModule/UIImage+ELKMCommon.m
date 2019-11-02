//
//  UIImage+ELKMCommon.m
//  ELKCommon-master
//
//  Created by wing on 2019/10/29.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIImage+ELKMCommon.h"

@implementation UIImage (ELKMCommon)


/// 压缩图片到低于指定大小
/// @param maxLength 单位 KB
- (UIImage *)elk_compressSizeLimitMax:(NSUInteger)maxLength
{
    NSData *imgData = [self elk_compressImgToDataLimit:maxLength];
    return [UIImage imageWithData:imgData];
}


/// 压缩图片低于指定大小 返回图片data
/// @param maxLength 单位 KB
- (NSData *)elk_compressImgToDataLimit:(NSUInteger)maxLength
{
    NSUInteger maxByteLength = maxLength * 1024;
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < maxByteLength) {
        return data;
    }
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxByteLength * 0.9) {
            min = compression;
        } else if (data.length > maxByteLength) {
            max = compression;
        } else {
            break;
        }
    }
    if (data.length < maxByteLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    NSUInteger lastDataLength = 0;
    while (data.length > maxByteLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxByteLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)), (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    return data;
}



@end
