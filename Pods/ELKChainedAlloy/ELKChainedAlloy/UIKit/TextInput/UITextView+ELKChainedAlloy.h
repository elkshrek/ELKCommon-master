//
//  UITextView+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (ELKChainedAlloy)


/**
 make a UITextView, return a new object
 
 @return a new UITextView
 */
+ (UITextView * _Nonnull)elk_make;

/**
 make a UITextView, return a new object
 
 @param block block
 @return a new UITextView
 */
+ (UITextView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITextView * _Nonnull make))block;



/**
 set text
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setText)(NSString * _Nullable text);

/**
 set attribute text
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setAttributeText)(NSAttributedString * _Nullable attrText) NS_AVAILABLE_IOS(6_0);

/**
 set text color
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setTextColor)(UIColor * _Nullable tColor);

/**
 set font
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setFont)(UIFont * _Nullable font);

/**
 set system font of size
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setSysFont)(CGFloat fontSize);

/**
 set bold system font of size
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setBoldFont)(CGFloat fontSize);

/// set Keyboard Type
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setKeyboardType)(UIKeyboardType keyboardType);

/// set keyboard appearance
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setKeyboardAppearance)(UIKeyboardAppearance kbAppearance);

/// set ReturnKey type
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setReturnKeyType)(UIReturnKeyType returnKeyType);

/// set SecureTextEntry
@property (nonatomic, copy, readonly) UITextView * _Nonnull (^elk_setSecureTextEntry)(BOOL secure);

/**
 set text alignment
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setTextAlignment)(NSTextAlignment tAlignment) NS_AVAILABLE_IOS(6_0);

/**
 set <UITextViewDelegate>delegate
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setDelegate)(id<UITextViewDelegate> _Nullable delegate);

/**
 set allows editing text attributes
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setAllowEditTextAttribute)(BOOL allow) NS_AVAILABLE_IOS(6_0);

/**
 set input view
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setInputView)(UIView * _Nullable inputView);

/**
 set input accessory view
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setInputAccessoryView)(UIView * _Nullable accView);

/**
 set selected range
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setSelectedRange)(NSRange selRange);

/**
 set edit able
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setEditable)(BOOL able);

/**
 set select able
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setSelectAble)(BOOL able) NS_AVAILABLE_IOS(7_0);

/**
 set data detector types
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setDataDetectorType)(UIDataDetectorTypes dType);

/**
 set text container inset
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setTextContainerInset)(UIEdgeInsets inset) NS_AVAILABLE_IOS(7_0);

/**
 set link text attribute
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_setLinkTextAttribute)(NSDictionary<NSAttributedStringKey,id> * _Nullable attrDict) NS_AVAILABLE_IOS(7_0);

/**
 scroll range to visible
 */
@property (nonatomic, strong, readonly) UITextView * _Nonnull (^elk_scrollRangeToVisible)(NSRange sRange);




@end

NS_ASSUME_NONNULL_END
