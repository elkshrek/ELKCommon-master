//
//  UITextField+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UITextField+ELKChainedAlloy.h"

@implementation UITextField (ELKChainedAlloy)


/**
 make a UITextField, return a new object
 
 @return a new UITextField
 */
+ (UITextField * _Nonnull)elk_make
{
    return [[UITextField alloc] init];
}

/**
 make a UITextField, return a new object
 
 @param block block
 @return a new UITextField
 */
+ (UITextField * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITextField * _Nonnull make))block
{
    UITextField *make = [[UITextField alloc] init];
    if (block) {
        block(make);
    }
    return make;
}



/**
 set text
 */
- (UITextField * _Nonnull (^)(NSString * _Nonnull))elk_setText
{
    return ^(NSString * _Nonnull text) {
        [self setText:text];
        return self;
    };
}

/**
 set placeholder
 */
- (UITextField * _Nonnull (^)(NSString * _Nonnull))elk_setPlaceholder
{
    return ^(NSString * _Nonnull placeholder) {
        [self setPlaceholder:placeholder];
        return self;
    };
}

/**
 set attribute text
 */
- (UITextField * _Nonnull (^)(NSAttributedString * _Nonnull))elk_setAttributeText NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nonnull attrText) {
        [self setAttributedText:attrText];
        return self;
    };
}

/**
 set attribute placeholder
 */
- (UITextField * _Nonnull (^)(NSAttributedString * _Nonnull))elk_setAttrPlaceholder
{
    return ^(NSAttributedString * _Nonnull attrPlaceholder) {
        [self setAttributedPlaceholder:attrPlaceholder];
        return self;
    };
}

/**
 set text color
 */
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))elk_setTextColor
{
    return ^(UIColor * _Nonnull color) {
        [self setTextColor:color];
        return self;
    };
}

/**
 set font
 */
- (UITextField * _Nonnull (^)(UIFont * _Nonnull))elk_setFont
{
    return ^(UIFont * _Nonnull font) {
        [self setFont:font];
        return self;
    };
}

/**
 set system font with size
 */
- (UITextField * _Nonnull (^)(CGFloat))elk_setSysFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont systemFontOfSize:fontSize]];
        return self;
    };
}

/**
 set bold font with size
 */
- (UITextField * _Nonnull (^)(CGFloat))elk_setBoldFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
        return self;
    };
}

/**
 set text alignment
 */
- (UITextField * _Nonnull (^)(NSTextAlignment))elk_setTextAlignment NS_AVAILABLE_IOS(6_0)
{
    return ^(NSTextAlignment textAlign) {
        [self setTextAlignment:textAlign];
        return self;
    };
}

/**
 set border style
 */
- (UITextField * _Nonnull (^)(UITextBorderStyle))elk_setBorderStyle
{
    return ^(UITextBorderStyle bStyle) {
        [self setBorderStyle:bStyle];
        return self;
    };
}

/**
 set clears on begin editing
 */
- (UITextField * _Nonnull (^)(BOOL))elk_setClearOnBeginEditing
{
    return ^(BOOL cOnEditing) {
        [self setClearsOnBeginEditing:cOnEditing];
        return self;
    };
}

/**
 set clear button mode
 */
- (UITextField * _Nonnull (^)(UITextFieldViewMode))elk_setClearButtonMode
{
    return ^(UITextFieldViewMode cMode) {
        [self setClearButtonMode:cMode];
        return self;
    };
}

/**
 set adjust font to fit width
 */
- (UITextField * _Nonnull (^)(BOOL))elk_setAdjustFontToFitWidth
{
    return ^(BOOL adjust) {
        [self setAdjustsFontSizeToFitWidth:adjust];
        return self;
    };
}

/**
 set <UITextFieldDelegate> delegate
 */
- (UITextField * _Nonnull (^)(id<UITextFieldDelegate> _Nullable))elk_setDelegate
{
    return ^(id<UITextFieldDelegate> delegate) {
        [self setDelegate:delegate];
        return self;
    };
}

/**
 set background image
 */
- (UITextField * _Nonnull (^)(UIImage * _Nullable))elk_setBackgroundImage
{
    return ^(UIImage * _Nullable image) {
        [self setBackground:image];
        return self;
    };
}

/**
 set disable background image
 */
- (UITextField * _Nonnull (^)(UIImage * _Nullable))elk_setDisableBackgroundImage
{
    return ^(UIImage * _Nullable image) {
        [self setDisabledBackground:image];
        return self;
    };
}

/**
 set allows editing text attributes
 */
- (UITextField * _Nonnull (^)(BOOL))elk_setAllowEditTextAttribute
{
    return ^(BOOL allow) {
        [self setAllowsEditingTextAttributes:allow];
        return self;
    };
}

/**
 set left view
 */
- (UITextField * _Nonnull (^)(UIView * _Nullable))elk_setLeftView
{
    return ^(UIView * _Nullable leftView) {
        [self setLeftView:leftView];
        return self;
    };
}

/**
 set left view mode
 */
- (UITextField * _Nonnull (^)(UITextFieldViewMode))elk_setLeftViewMode
{
    return ^(UITextFieldViewMode leftMode) {
        [self setLeftViewMode:leftMode];
        return self;
    };
}

/**
 set right view
 */
- (UITextField * _Nonnull (^)(UIView * _Nullable))elk_setRightView
{
    return ^(UIView * _Nullable rightView) {
        [self setRightView:rightView];
        return self;
    };
}

/**
 set right view mode
 */
- (UITextField * _Nonnull (^)(UITextFieldViewMode))elk_setRightViewMode
{
    return ^(UITextFieldViewMode rightMode) {
        [self setRightViewMode:rightMode];
        return self;
    };
}

/**
 draw text in rect
 */
- (UITextField * _Nonnull (^)(CGRect))elk_drawText
{
    return ^(CGRect inRect) {
        [self drawTextInRect:inRect];
        return self;
    };
}

/**
 draw placeholder in rect
 */
- (UITextField * _Nonnull (^)(CGRect))elk_drawPlaceholder
{
    return ^(CGRect inRect) {
        [self drawPlaceholderInRect:inRect];
        return self;
    };
}

/**
 set input view
 */
- (UITextField * _Nonnull (^)(UIView * _Nullable))elk_setInputView
{
    return ^(UIView * _Nullable inputView) {
        [self setInputView:inputView];
        return self;
    };
}

/**
 set input accessory view
 */
- (UITextField * _Nonnull (^)(UIView * _Nullable))elk_setInputAccessoryView
{
    return ^(UIView * _Nullable accView) {
        [self setInputAccessoryView:accView];
        return self;
    };
}





@end
