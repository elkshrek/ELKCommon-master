//
//  ELKCommonMaster.m
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKCommonMaster.h"

@interface ELKCommonMaster()

@end

@implementation ELKCommonMaster



/// Application Open Url
/// @param application application
/// @param url         url
+ (BOOL)elk_commonApplication:(UIApplication *)application openUrl:(NSURL *)url
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterHandleOpenUrl:url];
    } else if ([ELKWeChatSDKMaster elk_weChatCheckUrl:url]) {
        // WeChat
        return [ELKWeChatSDKMaster elk_weChatHandleOpenUrl:url];
    } else if ([ELKSinaSDKMaster elk_sinaCheckUrl:url]){
        // Sina
        return [ELKSinaSDKMaster elk_sinaHandleOpenUrl:url];
    }
    return NO;
}



@end
