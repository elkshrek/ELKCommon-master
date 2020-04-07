//
//  ELKCommonMaster.h
//  ELKCommon-master
//
//  Created by elk on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELKWeChatSDKMaster.h"
#import "ELKSinaSDKMaster.h"
#import "ELKTencentSDKMaster.h"


NS_ASSUME_NONNULL_BEGIN

@interface ELKCommonMaster : NSObject



/// Application Open Url
/// @param application application
/// @param url         url
+ (BOOL)elk_commonApplication:(UIApplication *)application openUrl:(NSURL *)url;



@end

NS_ASSUME_NONNULL_END
