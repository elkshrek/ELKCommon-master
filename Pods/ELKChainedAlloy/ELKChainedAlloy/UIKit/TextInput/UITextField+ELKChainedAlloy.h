//
//  UITextField+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (ELKChainedAlloy)


/**
 make a UITextField, return a new object
 
 @return a new UITextField
 */
+ (UITextField * _Nonnull)elk_make;

/**
 make a UITextField, return a new object
 
 @param block block
 @return a new UITextField
 */
+ (UITextField * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITextField * _Nonnull make))block;



/**
 set text
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setText)(NSString * _Nonnull text);

/**
 set placeholder
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setPlaceholder)(NSString * _Nonnull placeholder);

/**
 set attribute text
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setAttributeText)(NSAttributedString * _Nonnull attrText) NS_AVAILABLE_IOS(6_0);

/**
 set attribute placeholder
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setAttrPlaceholder) (NSAttributedString * _Nonnull attrPlaceholder);

/**
 set text color
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setTextColor)(UIColor * _Nonnull color);

/**
 set font
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setFont)(UIFont * _Nonnull font);

/**
 set system font with size
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setSysFont)(CGFloat fontSize);

/**
 set bold font with size
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setBoldFont)(CGFloat fontSize);

/**
 set text alignment
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setTextAlignment)(NSTextAlignment textAlign) NS_AVAILABLE_IOS(6_0);

/**
 set border style
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setBorderStyle)(UITextBorderStyle bStyle);

/**
 set clears on begin editing
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setClearOnBeginEditing)(BOOL cOnEditing);

/**
 set clear button mode
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setClearButtonMode)(UITextFieldViewMode cMode);

/**
 set adjust font to fit width
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setAdjustFontToFitWidth)(BOOL adjust);

/**
 set <UITextFieldDelegate> delegate
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setDelegate)(id<UITextFieldDelegate> _Nullable delegate);

/**
 set background image
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setBackgroundImage)(UIImage * _Nullable image);

/**
 set disable background image
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setDisableBackgroundImage)(UIImage * _Nullable image);

/**
 set allows editing text attributes
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setAllowEditTextAttribute)(BOOL allow);

/**
 set left view
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setLeftView)(UIView * _Nullable leftView);

/**
 set left view mode
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setLeftViewMode)(UITextFieldViewMode leftMode);

/**
 set right view
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setRightView)(UIView * _Nullable rightView);

/**
 set right view mode
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setRightViewMode)(UITextFieldViewMode rightMode);

/**
 draw text in rect
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_drawText)(CGRect inRect);

/**
 draw placeholder in rect
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_drawPlaceholder)(CGRect inRect);

/**
 set input view
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setInputView)(UIView * _Nullable inputView);

/**
 set input accessory view
 */
@property (nonatomic, strong, readonly) UITextField * _Nonnull (^elk_setInputAccessoryView)(UIView * _Nullable accView);



@end

NS_ASSUME_NONNULL_END
