//
//  UITextView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UITextView+ELKChainedAlloy.h"

@implementation UITextView (ELKChainedAlloy)


/**
 make a UITextView, return a new object
 
 @return a new UITextView
 */
+ (UITextView * _Nonnull)elk_make
{
    return [[UITextView alloc] init];
}

/**
 make a UITextView, return a new object
 
 @param block block
 @return a new UITextView
 */
+ (UITextView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITextView * _Nonnull make))block
{
    UITextView *make = [[UITextView alloc] init];
    if (block) {
        block(make);
    }
    return make;
}



/**
 set text
 */
- (UITextView * _Nonnull (^)(NSString * _Nullable))elk_setText
{
    return ^(NSString * _Nullable text) {
        [self setText:text];
        return self;
    };
}

/**
 set attribute text
 */
- (UITextView * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributeText NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable attrText) {
        [self setAttributedText:attrText];
        return self;
    };
}

/**
 set text color
 */
- (UITextView * _Nonnull (^)(UIColor * _Nullable))elk_setTextColor
{
    return ^(UIColor * _Nullable tColor) {
        [self setTextColor:tColor];
        return self;
    };
}

/**
 set font
 */
- (UITextView * _Nonnull (^)(UIFont * _Nullable))elk_setFont
{
    return ^(UIFont * _Nullable font) {
        [self setFont:font];
        return self;
    };
}

/**
 set system font of size
 */
- (UITextView * _Nonnull (^)(CGFloat))elk_setSysFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont systemFontOfSize:fontSize]];
        return self;
    };
}

/**
 set bold system font of size
 */
- (UITextView * _Nonnull (^)(CGFloat))elk_setBoldFont
{
    return ^(CGFloat fontSize) {
        [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
        return self;
    };
}

/// set Keyboard Type
- (UITextView * _Nonnull (^)(UIKeyboardType))elk_setKeyboardType
{
    return ^(UIKeyboardType keyboardType) {
        [self setKeyboardType:keyboardType];
        return self;
    };
}

/// set keyboard appearance
- (UITextView * _Nonnull (^)(UIKeyboardAppearance))elk_setKeyboardAppearance
{
    return ^(UIKeyboardAppearance kbAppearance) {
        self.keyboardAppearance = kbAppearance;
        return self;
    };
}

/// set ReturnKey type
- (UITextView * _Nonnull (^)(UIReturnKeyType))elk_setReturnKeyType
{
    return ^(UIReturnKeyType returnKeyType) {
        self.returnKeyType = returnKeyType;
        return self;
    };
}

/// set SecureTextEntry
- (UITextView * _Nonnull (^)(BOOL))elk_setSecureTextEntry
{
    return ^(BOOL secure) {
        self.secureTextEntry = secure;
        return self;
    };
}

/**
 set text alignment
 */
- (UITextView * _Nonnull (^)(NSTextAlignment))elk_setTextAlignment NS_AVAILABLE_IOS(6_0)
{
    return ^(NSTextAlignment tAlignment) {
        [self setTextAlignment:tAlignment];
        return self;
    };
}

/**
 set <UITextViewDelegate>delegate
 */
- (UITextView * _Nonnull (^)(id<UITextViewDelegate> _Nullable))elk_setDelegate
{
    return ^(id<UITextViewDelegate> _Nullable delegate) {
        [self setDelegate:delegate];
        return self;
    };
}

/**
 set allows editing text attributes
 */
- (UITextView * _Nonnull (^)(BOOL))elk_setAllowEditTextAttribute
NS_AVAILABLE_IOS(6_0)
{
    return ^(BOOL allow) {
        [self setAllowsEditingTextAttributes:allow];
        return self;
    };
}

/**
 set input view
 */
- (UITextView * _Nonnull (^)(UIView * _Nullable))elk_setInputView
{
    return ^(UIView * _Nullable inputView) {
        [self setInputView:inputView];
        return self;
    };
}

/**
 set input accessory view
 */
- (UITextView * _Nonnull (^)(UIView * _Nullable))elk_setInputAccessoryView
{
    return ^(UIView * _Nullable accView) {
        [self setInputAccessoryView:accView];
        return self;
    };
}

/**
 set selected range
 */
- (UITextView * _Nonnull (^)(NSRange))elk_setSelectedRange
{
    return ^(NSRange selRange) {
        [self setSelectedRange:selRange];
        return self;
    };
}

/**
 set edit able
 */
- (UITextView * _Nonnull (^)(BOOL))elk_setEditable
{
    return ^(BOOL able) {
        [self setEditable:able];
        return self;
    };
}

/**
 set select able
 */
- (UITextView * _Nonnull (^)(BOOL))elk_setSelectAble NS_AVAILABLE_IOS(7_0)
{
    return ^(BOOL able) {
        [self setSelectable:able];
        return self;
    };
}

/**
 set data detector types
 */
- (UITextView * _Nonnull (^)(UIDataDetectorTypes))elk_setDataDetectorType
{
    return ^(UIDataDetectorTypes dType) {
        [self setDataDetectorTypes:dType];
        return self;
    };
}

/**
 set text container inset
 */
- (UITextView * _Nonnull (^)(UIEdgeInsets))elk_setTextContainerInset NS_AVAILABLE_IOS(7_0)
{
    return ^(UIEdgeInsets inset) {
        [self setTextContainerInset:inset];
        return self;
    };
}

/**
 set link text attribute
 */
- (UITextView * _Nonnull (^)(NSDictionary<NSAttributedStringKey,id> * _Nullable))elk_setLinkTextAttribute
NS_AVAILABLE_IOS(7_0)
{
    return ^(NSDictionary<NSAttributedStringKey,id> * _Nullable attrDict) {
        [self setLinkTextAttributes:attrDict];
        return self;
    };
}

/**
 scroll range to visible
 */
- (UITextView * _Nonnull (^)(NSRange))elk_scrollRangeToVisible
{
    return ^(NSRange sRange) {
        [self scrollRangeToVisible:sRange];
        return self;
    };
}





@end
