//
//  ELKTencentUserInfo.m
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKTencentUserInfo.h"

@implementation ELKTencentUserInfo

- (NSString *)description
{
    return [NSString stringWithFormat:@"ELKTencentUserInfo : { openId : %@ , \n nickName : %@ , \n headImgUrl : %@ , \n gender : %@ , \n province : %@ , \n city : %@ }", self.openId, self.nickName, self.headImgUrl, self.gender, self.province, self.city];
}

@end
