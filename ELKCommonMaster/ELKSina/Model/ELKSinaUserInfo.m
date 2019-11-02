//
//  ELKSinaUserInfo.m
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKSinaUserInfo.h"

@implementation ELKSinaUserInfo

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ accessToken : %@ , \n nickName : %@ , \n headImgUrl : %@ , \n gender : %@ , \n language : %@ , \n province : %@ , \n city : %@ }", self.accessToken, self.nickName, self.headImgUrl, self.gender, self.language, self.province, self.city];
}

@end
