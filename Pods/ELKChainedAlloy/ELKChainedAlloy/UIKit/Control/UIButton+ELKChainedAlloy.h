//
//  UIButton+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/5.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 typedef a block to response target/action of button

 @param sender the UIButton object
 */
typedef void(^ELKControlEventBlock)(UIButton *sender);


@interface UIButton (ELKChainedAlloy)

#pragma mark - make a button
/**
 make a UIButton, return a new object
 
 @return a new UIButton
 */
+ (UIButton * _Nonnull)elk_make;

/**
 make a UIButton, return a new object
 
 @param block block
 @return a new UIButton
 */
+ (UIButton * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIButton * _Nonnull make))block;


/**
 make a button with UIButtonType, return a new button
 
 @param btnType UIButtonType
 @return a new button object
 */
+ (UIButton * _Nonnull)elk_makeWithType:(UIButtonType)btnType;

/**
 make a button with UIButtonType, return a new button
 
 @param btnType UIButtonType
 @param block block
 @return a new button object
 */
+ (UIButton * _Nonnull)elk_makeWithType:(UIButtonType)btnType block:(void (^ _Nullable)(UIButton * _Nonnull make))block;


// The tintColor is inherited through the superview hierarchy. See UIView for more information.
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTintColor)(UIColor * tintColor) NS_AVAILABLE_IOS(5_0);


/**
 set frame
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setFrame)(CGRect frame);


/**
 set title lable font
 */
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleLabelFont)(UIFont * font);


#pragma mark - set button title
/**
 set button title with UIControlState
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setTitle)(NSString * _Nonnull title, UIControlState state);

/**
 set button title for UIControlStateNormal
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleForNormal)(NSString * _Nonnull title);

/**
 set button title for UIControlStateHighlighted
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleForHighlighted)(NSString * _Nonnull title);

/**
 set button title for UIControlStateDisabled
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleForDisabled)(NSString * _Nonnull title);

/**
 set button title for UIControlStateSelected
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleForSelected)(NSString * _Nonnull title);

/**
 set button title for UIControlStateFocused
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleForFocused)(NSString * _Nonnull title);


#pragma mark - set button title color
/**
 set button title color with UIControlState
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setTitleColor)(UIColor * _Nonnull color, UIControlState state);

/**
 set button title color for UIControlStateNormal
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleColorForNormal)(UIColor * _Nonnull color);

/**
 set button title color for UIControlStateHighlighted
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleColorForHighlighted)(UIColor * _Nonnull color);

/**
 set button title color for UIControlStateDisabled
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleColorForDisabled)(UIColor * _Nonnull color);

/**
 set button title color for UIControlStateSelected
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleColorForSelected)(UIColor * _Nonnull color);

/**
 set button title color for UIControlStateFocused
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setTitleColorForFocused)(UIColor * _Nonnull color) NS_AVAILABLE_IOS(9_0);


// default is nil. use 50% black
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColor)(UIColor * _Nullable shadowColor, UIControlState state) UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColorForNormal)(UIColor * _Nullable shadowColor) UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColorForHighlighted)(UIColor * _Nullable shadowColor) UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColorForDisabled)(UIColor * _Nullable shadowColor) UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColorForSelected)(UIColor * _Nullable shadowColor) UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleShadowColorForFocused)(UIColor * _Nullable shadowColor) UI_APPEARANCE_SELECTOR;

// default is nil. should be same size if different for different states
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitle)(NSAttributedString * _Nullable title, UIControlState state) NS_AVAILABLE_IOS(6_0);// default is nil. title is assumed to be single line
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitleForNormal)(NSAttributedString * _Nullable title) NS_AVAILABLE_IOS(6_0);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitleForHighlighted)(NSAttributedString * _Nullable title) NS_AVAILABLE_IOS(6_0);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitleForDisabled)(NSAttributedString * _Nullable title) NS_AVAILABLE_IOS(6_0);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitleForSelected)(NSAttributedString * _Nullable title) NS_AVAILABLE_IOS(6_0);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAttributedTitleForFocused)(NSAttributedString * _Nullable title) NS_AVAILABLE_IOS(6_0);


#pragma mark - set button background color
/**
 set button background color
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setBackgroundColor)(UIColor * _Nullable bgColor);


#pragma mark - set button background image
/**
 set button background image with UIControlState
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setBackgroundImage)(UIImage * _Nonnull image, UIControlState state);

/**
 set button background image for UIControlStateNormal
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setBackgroundImageForNormal)(UIImage * _Nonnull image);

/**
 set button background image for UIControlStateHighlighted
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setBackgroundImageForHighlighted)(UIImage * _Nonnull image);

/**
 set button background image for UIControlStateDisabled
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setBackgroundImageForDisabled)(UIImage * _Nonnull image);

/**
 set button background image for UIControlStateSelected
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setBackgroundImageForSelected)(UIImage * _Nonnull image);

/**
 set button background image for UIControlStateFocused
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setBackgroundImageForFocused)(UIImage * _Nonnull image);


#pragma mark - set button image
/**
 set button image with UIControlState
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull (^elk_setImage)(UIImage * _Nonnull image, UIControlState state);

/**
 set button image for UIControlStateNormal
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setImageForNormal)(UIImage * _Nonnull image);

/**
 set button image for UIControlStateHighlighted
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setImageForHighlighted)(UIImage * _Nonnull image);

/**
 set button image for UIControlStateDisabled
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setImageForDisabled)(UIImage * _Nonnull image);

/**
 set button image for UIControlStateSelected
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setImageForSelected)(UIImage * _Nonnull image);

/**
 set button image for UIControlStateFocused
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_setImageForFocused)(UIImage * _Nonnull image);


/**
 set content edge insets
 default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.
 */
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setContentEdgeInsets)(UIEdgeInsets insets);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setContentEdgeInsetsMake)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);


/**
 default is UIEdgeInsetsZero
 */
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleEdgeInsets)(UIEdgeInsets insets);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setTitleEdgeInsetsMake)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

/**
 default is UIEdgeInsetsZero
 */
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setImageEdgeInsets)(UIEdgeInsets insets);
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setImageEdgeInsetsMake)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);


// default is NO. if YES, shadow reverses to shift between engrave and emboss appearance
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setReversesTitleShadowWhenHighlighted)(BOOL reverses);

// default is YES. if YES, image is drawn darker when highlighted(pressed)
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAdjustsImageWhenHighlighted)(BOOL adjust);

// default is YES. if YES, image is drawn lighter when disabled
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setAdjustsImageWhenDisabled)(BOOL adjust);

// default is NO. if YES, show a simple feedback (currently a glow) while highlighted
@property (nonatomic, copy, readonly) UIButton * _Nonnull (^elk_setShowsTouchWhenHighlighted)(BOOL shows) __TVOS_PROHIBITED;


// these getters only take a single state value
@property (nonatomic, copy, readonly) NSString * _Nullable (^elk_titleForState)(UIControlState state);
@property (nonatomic, copy, readonly) UIColor * _Nullable (^elk_titleColorForState)(UIControlState state);
@property (nonatomic, copy, readonly) UIColor * _Nullable (^elk_titleShadowColorForState)(UIControlState state);
@property (nonatomic, copy, readonly) UIImage * _Nullable (^elk_imageForState)(UIControlState state);
@property (nonatomic, copy, readonly) UIImage * _Nullable (^elk_backgroundImageForState)(UIControlState state);
@property (nonatomic, copy, readonly) NSAttributedString * _Nullable (^elk_attributedTitleForState)(UIControlState state);



// these return the rectangle for the background (assumes bounds), the content (image + title) and for the image and title separately. the content rect is calculated based
// on the title and image size and padding and then adjusted based on the control content alignment. there are no draw methods since the contents
// are rendered in separate subviews (UIImageView, UILabel)
@property (nonatomic, copy, readonly) CGRect (^elk_backgroundRectForBounds)(CGRect bounds);
@property (nonatomic, copy, readonly) CGRect (^elk_contentRectForBounds)(CGRect bounds);
@property (nonatomic, copy, readonly) CGRect (^elk_titleRectForContentRect)(CGRect contentRect);
@property (nonatomic, copy, readonly) CGRect (^elk_imageRectForContentRect)(CGRect contentRect);


#pragma mark - add target
/**
 add target/action for particular event.
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_addTarget)(id target, SEL action, UIControlEvents event);

/**
 add target/action for particular event.
 */
@property (nonatomic, strong, readonly) UIButton * _Nonnull(^elk_addTargetBlock)(UIControlEvents event, ELKControlEventBlock block);









@end

NS_ASSUME_NONNULL_END
