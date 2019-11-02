//
//  ARootViewController.m
//  ELKCommon-master
//
//  Created by wing on 2019/11/1.
//  Copyright © 2019 wing. All rights reserved.
//

#import "ARootViewController.h"
#import <Masonry/Masonry.h>
#import "ELKCommonMaster.h"


@interface ARootViewController ()

@property (nonatomic, strong) UIButton *wcAuthButton;
@property (nonatomic, strong) UIButton *wcShareButton;

@property (nonatomic, strong) UIButton *qqAuthButton;
@property (nonatomic, strong) UIButton *qqShareButton;

@property (nonatomic, strong) UIButton *sinaAuthButton;
@property (nonatomic, strong) UIButton *sinaShareButton;


@end

@implementation ARootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSubview];
    
}

- (void)wcAuthAction:(UIButton *)sender
{
    [ELKWeChatSDKMaster elk_weChatAuthLoginBlock:^(ELKWeChatUserInfo * _Nullable userInfo, SendAuthResp * _Nonnull authResp, ELKWeChatAuthRespStatus authStatus) {
        if (authStatus == ELKWeAuthRespSucData) {
            NSLog(@"WeChat logged in successfully and obtained user information : %@", userInfo);
        } else if (authStatus == ELKWeAuthRespSuccess) {
            NSLog(@"WeChat logged in successfully, but failed to get user information");
        } else if (authStatus == ELKWeAuthRespCancel) {
            NSLog(@"User canceled WeChat login");
        } else if (authStatus == ELKWeAuthRespDeny) {
            NSLog(@"WeChat authorized login denied");
        } else {
            NSLog(@"WeChat login failed");
        }
    }];
}
- (void)wcShareAction:(UIButton *)sender
{
    ELKWeChatShareModel *shareModel = [[ELKWeChatShareModel alloc] init];
    shareModel.title = @"ELKCommonMaster";
    shareModel.desString = @"Share To WeChat";
    shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
    shareModel.thumbImage = [UIImage imageNamed:@"wing"];
    
    [ELKWeChatSDKMaster elk_weChatShareWebPage:shareModel sence:ELKWeSceneSession block:^(ELKWeChatShareRespStatus shareStatus) {
        if (shareStatus == ELKWeShareRespSuccess) {
            NSLog(@"WeChat Share Success");
        } else if (shareStatus == ELKWeShareRespCancel) {
            NSLog(@"User Canceled WeChat Share");
        } else {
            NSLog(@"WeChat Share failed");
        }
    }];
}
- (void)qqAuthAction:(UIButton *)sender
{
    [ELKTencentSDKMaster elk_tencentAuthLoginBlock:^(ELKTencentUserInfo * _Nullable userInfo, TencentOAuth * _Nonnull tenAuth, ELKTenAuthRespStatus authStatus) {
        if (authStatus == ELKTenAuthSucData) {
            NSLog(@"QQ logged in successfully and obtained user information : %@", userInfo);
        } else if (authStatus == ELKTenAuthSuccess) {
            NSLog(@"QQ logged in successfully, but failed to get user information");
        } else if (authStatus == ELKTenAuthCancel) {
            NSLog(@"User canceled QQ login");
        } else {
            NSLog(@"QQ login failed");
        }
    }];
}
- (void)qqShareAction:(UIButton *)sender
{
    ELKTencentShareModel *shareModel = [[ELKTencentShareModel alloc] init];
    shareModel.title = @"ELKCommonMaster";
    shareModel.desString = @"Share To QQ";
    shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
    shareModel.previewImageUrl = @"";
    
    [ELKTencentSDKMaster elk_tencentShare:shareModel sence:ELKTenSceneMessage block:^(ELKTenShareRespStatus shareStatus) {
        if (shareStatus == ELKTenShareRespSuccess) {
            NSLog(@"Tencent Share Success");
        } else if (shareStatus == ELKTenShareRespCancel) {
            NSLog(@"User Canceled Tencent Share");
        } else {
            NSLog(@"Tencent Share failed");
        }
    }];
}
- (void)sinaAuthAction:(UIButton *)sender
{
    [ELKSinaSDKMaster elk_sinaAuthLoginBlock:^(ELKSinaUserInfo * _Nullable userInfo, WBAuthorizeResponse * _Nonnull authResp, ELKSinaAuthRespStatus authStatus) {
        if (authStatus == ELKSinaAuthSucData) {
            NSLog(@"Sina logged in successfully and obtained user information : %@", userInfo);
        } else if (authStatus == ELKSinaAuthSuccess) {
            NSLog(@"Sina logged in successfully, but failed to get user information");
        } else if (authStatus == ELKSinaAuthCancel) {
            NSLog(@"User canceled Sina login");
        } else {
            NSLog(@"Sina login failed");
        }
    }];
}
- (void)sinaShareAction:(UIButton *)sender
{
    ELKSinaShareModel *shareModel = [[ELKSinaShareModel alloc] init];
    shareModel.title = @"ELKCommonMaster";
    shareModel.desString = @"Share To Sina";
    shareModel.shareLink = @"https://github.com/elkshrek/ELKCommon-master";
    shareModel.thumbImage = [UIImage imageNamed:@"wing"];
    shareModel.text = @"";
    
    [ELKSinaSDKMaster elk_sinaShareInfo:shareModel shareBlock:^(ELKSinaShareRespStatus shareStatus) {
        if (shareStatus == ELKSinaShareRespSuccess) {
            NSLog(@"Sina Share Success");
        } else if (shareStatus == ELKSinaShareRespCancel) {
            NSLog(@"User Canceled Sina Share");
        } else {
            NSLog(@"Sina Share failed");
        }
    }];
    
}


- (void)configSubview
{
    self.view.elk_setBackgroundColor(UIColor.whiteColor);
    
    self.view.elk_addSubview(self.wcAuthButton)
    .elk_addSubview(self.wcShareButton)
    .elk_addSubview(self.qqAuthButton)
    .elk_addSubview(self.qqShareButton)
    .elk_addSubview(self.sinaAuthButton)
    .elk_addSubview(self.sinaShareButton);
    
    [self.wcAuthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.f);
        make.top.equalTo(self.view).offset(100.f);
        make.right.equalTo(self.wcShareButton.mas_left).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.wcShareButton);
    }];
    [self.wcShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wcAuthButton.mas_right).offset(15.f);
        make.top.equalTo(self.view).offset(100.f);
        make.right.equalTo(self.view).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.wcAuthButton);
    }];
    [self.qqAuthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.f);
        make.top.equalTo(self.wcAuthButton.mas_bottom).offset(15.f);
        make.right.equalTo(self.qqShareButton.mas_left).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.qqShareButton);
    }];
    [self.qqShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qqAuthButton.mas_right).offset(15.f);
        make.top.equalTo(self.wcShareButton.mas_bottom).offset(15.f);
        make.right.equalTo(self.view).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.qqAuthButton);
    }];
    [self.sinaAuthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.f);
        make.top.equalTo(self.qqAuthButton.mas_bottom).offset(15.f);
        make.right.equalTo(self.sinaShareButton.mas_left).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.sinaShareButton);
    }];
    [self.sinaShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sinaAuthButton.mas_right).offset(15.f);
        make.top.equalTo(self.qqShareButton.mas_bottom).offset(15.f);
        make.right.equalTo(self.view).offset(-15.f);
        make.height.mas_equalTo(46.f);
        make.width.equalTo(self.sinaAuthButton);
    }];
    
}

- (UIButton *)wcAuthButton
{
    return _wcAuthButton ?: ({
        _wcAuthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wcAuthButton.elk_setTitleForNormal(@"微信登录")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(wcAuthAction:), UIControlEventTouchUpInside);
        _wcAuthButton;
    });
}
- (UIButton *)wcShareButton
{
    return _wcShareButton ?: ({
        _wcShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wcShareButton.elk_setTitleForNormal(@"微信分享")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(wcShareAction:), UIControlEventTouchUpInside);
        _wcShareButton;
    });
}
- (UIButton *)qqAuthButton
{
    return _qqAuthButton ?: ({
        _qqAuthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _qqAuthButton.elk_setTitleForNormal(@"QQ登录")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(qqAuthAction:), UIControlEventTouchUpInside);
        _qqAuthButton;
    });
}
- (UIButton *)qqShareButton
{
    return _qqShareButton ?: ({
        _qqShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _qqShareButton.elk_setTitleForNormal(@"QQ分享")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(qqShareAction:), UIControlEventTouchUpInside);
        _qqShareButton;
    });
}
- (UIButton *)sinaAuthButton
{
    return _sinaAuthButton ?: ({
        _sinaAuthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sinaAuthButton.elk_setTitleForNormal(@"Sina登录")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(sinaAuthAction:), UIControlEventTouchUpInside);
        _sinaAuthButton;
    });
}
- (UIButton *)sinaShareButton
{
    return _sinaShareButton ?: ({
        _sinaShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sinaShareButton.elk_setTitleForNormal(@"Sina分享")
        .elk_setTitleColorForNormal(UIColor.blackColor)
        .elk_addTarget(self, @selector(sinaShareAction:), UIControlEventTouchUpInside);
        _sinaShareButton;
    });
}



@end
