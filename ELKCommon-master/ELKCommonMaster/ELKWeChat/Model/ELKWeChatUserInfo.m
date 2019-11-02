//
//  ELKWeChatUserInfo.m
//  ELKCommon-master
//
//  Created by wing on 2019/10/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKWeChatUserInfo.h"

@implementation ELKWeChatUserInfo


- (NSString *)description
{
    return [NSString stringWithFormat:@"{ unionId : %@ , \n openId : %@ , \n nickName : %@ , \n headImgUrl : %@ , \n gender : %@ , \n language : %@ , \n country : %@ , \n province : %@ , \n city : %@ }", self.unionId, self.openId, self.nickName, self.headImgUrl, self.gender, self.language, self.country, self.province, self.city];
}


@end
