//
//  UIImageView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIImageView+ELKChainedAlloy.h"

@implementation UIImageView (ELKChainedAlloy)


/**
 make a UIImageView, return a new object
 
 @return a new UIImageView
 */
+ (UIImageView * _Nonnull)elk_make
{
    return [[UIImageView alloc] init];
}

/**
 make a UIImageView, return a new object
 
 @param block block
 @return a new UIImageView
 */
+ (UIImageView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIImageView * _Nonnull make))block
{
    UIImageView *make = [[UIImageView alloc] init];
    if (block) {
        block(make);
    }
    return make;
}



/**
 set image
 */
- (UIImageView * _Nonnull (^)(UIImage * _Nonnull))elk_setImage
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image];
        return self;
    };
}

/**
 set image with name
 */
- (UIImageView * _Nonnull (^)(NSString * _Nonnull))elk_setImageNamed
{
    return ^(NSString * _Nonnull imgName) {
        [self setImage:[UIImage imageNamed:imgName]];
        return self;
    };
}


/**
 set highlighted image
 */
- (UIImageView * _Nonnull (^)(UIImage * _Nonnull))elk_setHighlightedImage
{
    return ^(UIImage * _Nonnull hImage) {
        [self setHighlightedImage:hImage];
        return self;
    };
}

/**
 set highlighted image with name
 */
- (UIImageView * _Nonnull (^)(NSString * _Nonnull))elk_setHighlightedImageNamed
{
    return ^(NSString * _Nonnull hImgName) {
        [self setHighlightedImage:[UIImage imageNamed:hImgName]];
        return self;
    };
}


/**
 set highlighted
 */
- (UIImageView * _Nonnull (^)(BOOL))elk_setHighlighted
{
    return ^(BOOL highLight) {
        [self setHighlighted:highLight];
        return self;
    };
}


/**
 set animation images
 */
- (UIImageView * _Nonnull (^)(NSArray<UIImage *> * _Nonnull))elk_setAnimationImages
{
    return ^(NSArray<UIImage *> * _Nonnull images) {
        [self setAnimationImages:images];
        return self;
    };
}

/**
 set animation images with names
 */
- (UIImageView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))elk_setAnimationImgNames
{
    return ^(NSArray<NSString *> * _Nonnull imgNames) {
        NSMutableArray *imgArray = [[NSMutableArray alloc] init];
        for (NSString *iName in imgNames) {
            [imgArray addObject:[UIImage imageNamed:iName]];
        }
        [self setAnimationImages:imgArray];
        return self;
    };
}



/**
 set highlight animation images
 */
- (UIImageView * _Nonnull (^)(NSArray<UIImage *> * _Nonnull))elk_setHighlightAnimationImages
{
    return ^(NSArray<UIImage *> * _Nonnull images) {
        [self setHighlightedAnimationImages:images];
        return self;
    };
}

/**
 set highlight animation images with names
 */
- (UIImageView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))elk_setHighlightAnimationImgNames
{
    return ^(NSArray<NSString *> * _Nonnull imgNames) {
        NSMutableArray *imgArray = [[NSMutableArray alloc] init];
        for (NSString *iName in imgNames) {
            [imgArray addObject:[UIImage imageNamed:iName]];
        }
        [self setHighlightedAnimationImages:imgArray];
        return self;
    };
}



/**
 set animation duration
 */
- (UIImageView * _Nonnull (^)(NSTimeInterval))elk_setAnimationDuration
{
    return ^(NSTimeInterval tInterval) {
        [self setAnimationDuration:tInterval];
        return self;
    };
}

/**
 set animation repeat count
 */
- (UIImageView * _Nonnull (^)(NSInteger))elk_setAnimationRepeatCount
{
    return ^(NSInteger rCount) {
        [self setAnimationRepeatCount:rCount];
        return self;
    };
}





@end
