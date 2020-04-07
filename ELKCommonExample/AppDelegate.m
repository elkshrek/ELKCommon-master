//
//  AppDelegate.m
//  ELKCommon-master
//
//  Created by wing on 2019/11/1.
//  Copyright © 2019 wing. All rights reserved.
//

#import "AppDelegate.h"
#import "ARootViewController.h"
#import "ELKSinaSDKMaster.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[ARootViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    
    // WeChat
//    [ELKWeChatSDKMaster elk_weChatRegister:ELKWeChatAppId withSecret:ELKWeChatSecret universalLink:ELKWeChatUniLink];
    // Sina
    [ELKSinaSDKMaster elk_sinaRegister:ELKSinaAppId debug:YES];
    // Tencent
    [ELKTencentSDKMaster elk_tencentRegister:ELKTencentAppId];
    
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterHandleOpenUrl:url];
    }
    return NO;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterHandleOpenUrl:url];
    } else if ([ELKSinaSDKMaster elk_sinaCheckUrl:url]) {
        return [ELKSinaSDKMaster elk_sinaHandleOpenUrl:url];
    }
    
    return NO;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([ELKTencentSDKMaster elk_tenAuthCheckUrl:url]) {
        // Tencent Auth
        return [ELKTencentSDKMaster elk_tenAuthHandleOpenUrl:url];
    } else if ([ELKTencentSDKMaster elk_tenInterCheckUrl:url]) {
        // Tencent Share
        return [ELKTencentSDKMaster elk_tenInterHandleOpenUrl:url];
    }
    return NO;
}



@end
