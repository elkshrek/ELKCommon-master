//
//  UILabel+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UILabel+ELKChainedAlloy.h"

@implementation UILabel (ELKChainedAlloy)


/**
 make a UILabel, return a new object
 
 @return a new UILabel
 */
+ (UILabel *)elk_make
{
    return [[UILabel alloc] init];
}


/**
 make a UILabel, return a new object
 
 @param block block
 @return a new UILabel
 */
+ (UILabel *)elk_makeBlock:(void (^)(UILabel * _Nonnull))block
{
    UILabel *make = [[UILabel alloc] init];
    if (block) {
        block(make);
    }
    return make;
}


/**
 set text
 */
- (UILabel * _Nonnull (^)(NSString * _Nonnull))elk_setText
{
    return ^(NSString * _Nonnull text) {
        [self setText:text];
        return self;
    };
}


/**
 set attribute text
 */
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))elk_setAttributeText NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nonnull attrText) {
        [self setAttributedText:attrText];
        return self;
    };
}


/**
 set text alignment
 */
- (UILabel * _Nonnull (^)(NSTextAlignment))elk_setTextAlignment NS_AVAILABLE_IOS(6_0)
{
    return ^(NSTextAlignment textAlign) {
        [self setTextAlignment:textAlign];
        return self;
    };
}

/**
 set text color
 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))elk_setTextColor
{
    return ^(UIColor * _Nonnull color) {
        [self setTextColor:color];
        return self;
    };
}

/**
 set highlight text color
 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))elk_setHighlightTextColor
{
    return ^(UIColor * _Nonnull hColor) {
        [self setHighlightedTextColor:hColor];
        return self;
    };
}

/**
 set highlighted
 */
- (UILabel * _Nonnull (^)(BOOL))elk_setHighlighted
{
    return ^(BOOL highlighted) {
        [self setHighlighted:highlighted];
        return self;
    };
}

/**
 set enable
 */
- (UILabel * _Nonnull (^)(BOOL))elk_setEnable
{
    return ^(BOOL enable) {
        [self setEnabled:enable];
        return self;
    };
}

/**
 set font
 */
- (UILabel * _Nonnull (^)(UIFont * _Nonnull))elk_setFont
{
    return ^(UIFont * _Nonnull font) {
        [self setFont:font];
        return self;
    };
}

/**
 set system font with size
 */
- (UILabel * _Nonnull (^)(CGFloat))elk_setSysFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont systemFontOfSize:fontSize]];
        return self;
    };
}

/**
 set bold font with size
 */
- (UILabel * _Nonnull (^)(CGFloat))elk_setBoldFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
        return self;
    };
}


/**
 set shadow color
 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))elk_setShadowColor
{
    return ^(UIColor * _Nonnull sColor) {
        [self setShadowColor:sColor];
        return self;
    };
}

/**
 set shadow offset
 */
- (UILabel * _Nonnull (^)(CGSize))elk_setShadowOffset
{
    return ^(CGSize offset) {
        [self setShadowOffset:offset];
        return self;
    };
}


/**
 set line break mode
 */
- (UILabel * _Nonnull (^)(NSLineBreakMode))elk_setLineBreakMode NS_AVAILABLE_IOS(6_0)
{
    return ^(NSLineBreakMode lbMode) {
        [self setLineBreakMode:lbMode];
        return self;
    };
}

/**
 set number of lines
 */
- (UILabel * _Nonnull (^)(NSInteger))elk_setNumberOfLines
{
    return ^(NSInteger lNumber) {
        [self setNumberOfLines:lNumber];
        return self;
    };
}

/**
 set adjust font to fit width
 */
- (UILabel * _Nonnull (^)(BOOL))elk_setAdjustFontToFitWidth
{
    return ^(BOOL adjust) {
        [self setAdjustsFontSizeToFitWidth:adjust];
        return self;
    };
}

/**
 set baseline adjustment
 */
- (UILabel * _Nonnull (^)(UIBaselineAdjustment))elk_setBaselineAdjustment
{
    return ^(UIBaselineAdjustment lineAdjust) {
        [self setBaselineAdjustment:lineAdjust];
        return self;
    };
}

/**
 draw text in rect
 */
- (UILabel * _Nonnull (^)(CGRect))elk_drawTextInRect
{
    return ^(CGRect drawRect) {
        [self drawTextInRect:drawRect];
        return self;
    };
}





@end
