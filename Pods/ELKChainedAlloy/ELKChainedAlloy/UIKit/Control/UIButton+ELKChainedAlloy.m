//
//  UIButton+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/5.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIButton+ELKChainedAlloy.h"
#import <objc/runtime.h>


@interface UIButton ()

/**
 the response block of touch down event
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDownBlock;
/**
 the response block of touch down repeat
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDownRepeatBlock;
/**
 the response block of touch drag Inside
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDragInsideBlock;
/**
 the response block of touch drag outside
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDragOutsideBlock;
/**
 the response block of touch drag enter
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDragEnterBlock;
/**
 the response block of touch drag exit
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchDragExitBlock;
/**
 the response block of touch up inside
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchUpInsideBlock;
/**
 the response block of touch up outside
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchUpOutsideBlock;
/**
 the response block of touch cancel
 */
@property (nonatomic, copy) ELKControlEventBlock elk_touchCancelBlock;
/**
 the response block of primary action triggered
 */
@property (nonatomic, copy) ELKControlEventBlock elk_primaryActionTriggeredBlock;
/**
 the response block of all touch events
 */
@property (nonatomic, copy) ELKControlEventBlock elk_allTouchEventsBlock;
/**
 the response block of application reserved
 */
@property (nonatomic, copy) ELKControlEventBlock elk_applicationReservedBlock;
/**
 the response block of all events
 */
@property (nonatomic, copy) ELKControlEventBlock elk_allEventsBlock;


@end

@implementation UIButton (ELKChainedAlloy)

#pragma mark - make a button
/**
 make a UIButton, return a new object
 
 @return a new UIButton
 */
+ (UIButton * _Nonnull)elk_make
{
    return [[UIButton alloc] init];
}

/**
 make a UIButton, return a new object
 
 @param block block
 @return a new UIButton
 */
+ (UIButton * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIButton * _Nonnull make))block
{
    UIButton *make = [[UIButton alloc] init];
    if (block) {
        block(make);
    }
    return make;
}


/**
 make a button with UIButtonType, return a new button

 @param btnType UIButtonType
 @return a new button object
 */
+ (UIButton *)elk_makeWithType:(UIButtonType)btnType
{
    UIButton *button = [UIButton buttonWithType:btnType];
    return button;
}

/**
 make a button with UIButtonType, return a new button

 @param btnType UIButtonType
 @param block block
 @return a new button object
 */
+ (UIButton *)elk_makeWithType:(UIButtonType)btnType block:(void (^)(UIButton * _Nonnull))block
{
    UIButton *button = [self elk_makeWithType:btnType];
    if (block) {
        block(button);
    }
    return button;
}


// The tintColor is inherited through the superview hierarchy. See UIView for more information.
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTintColor
{
    return ^(UIColor * tintColor) {
        [self setTintColor:tintColor];
        return self;
    };
}

/**
 set frame
 */
- (UIButton * _Nonnull (^)(CGRect))elk_setFrame
{
    return ^(CGRect f) {
        self.frame = f;
        return self;
    };
}


/**
 set title lable font
 */
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))elk_setTitleLabelFont
{
    return ^(UIFont * font) {
        self.titleLabel.font = font;
        return self;
    };
}


#pragma mark - set button title
/**
 set button title with UIControlState
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull, UIControlState))elk_setTitle
{
    return ^(NSString * _Nonnull title, UIControlState state) {
        [self setTitle:title forState:state];
        return self;
    };
}

/**
 set button title for UIControlStateNormal
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull))elk_setTitleForNormal
{
    return ^(NSString * _Nonnull title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

/**
 set button title for UIControlStateHighlighted
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull))elk_setTitleForHighlighted
{
    return ^(NSString * _Nonnull title) {
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

/**
 set button title for UIControlStateDisabled
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull))elk_setTitleForDisabled
{
    return ^(NSString * _Nonnull title) {
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

/**
 set button title for UIControlStateSelected
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull))elk_setTitleForSelected
{
    return ^(NSString * _Nonnull title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

/**
 set button title for UIControlStateFocused
 */
- (UIButton * _Nonnull (^)(NSString * _Nonnull))elk_setTitleForFocused
{
    return ^(NSString * _Nonnull title) {
        [self setTitle:title forState:UIControlStateFocused];
        return self;
    };
}


#pragma mark - set button title color
/**
 set button title color with UIControlState
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull, UIControlState))elk_setTitleColor
{
    return ^(UIColor * _Nonnull color, UIControlState state) {
        [self setTitleColor:color forState:state];
        return self;
    };
}

/**
 set button title color for UIControlStateNormal
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTitleColorForNormal
{
    return ^(UIColor * _Nonnull color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

/**
 set button title color for UIControlStateHighlighted
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTitleColorForHighlighted
{
    return ^(UIColor * _Nonnull color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

/**
 set button title color for UIControlStateDisabled
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTitleColorForDisabled
{
    return ^(UIColor * _Nonnull color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}

/**
 set button title color for UIControlStateSelected
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTitleColorForSelected
{
    return ^(UIColor * _Nonnull color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

/**
 set button title color for UIControlStateFocused
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))elk_setTitleColorForFocused NS_AVAILABLE_IOS(9_0)
{
    return ^(UIColor * _Nonnull color) {
        [self setTitleColor:color forState:UIControlStateFocused];
        return self;
    };
}

// default is nil. use 50% black
- (UIButton * _Nonnull (^)(UIColor * _Nullable, UIControlState))elk_setTitleShadowColor UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor, UIControlState state) {
        [self setTitleShadowColor:shadowColor forState:state];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setTitleShadowColorForNormal UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor) {
        [self setTitleShadowColor:shadowColor forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setTitleShadowColorForHighlighted UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor) {
        [self setTitleShadowColor:shadowColor forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setTitleShadowColorForDisabled UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor) {
        [self setTitleShadowColor:shadowColor forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setTitleShadowColorForSelected UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor) {
        [self setTitleShadowColor:shadowColor forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setTitleShadowColorForFocused UI_APPEARANCE_SELECTOR
{
    return ^(UIColor * _Nullable shadowColor) {
        [self setTitleShadowColor:shadowColor forState:UIControlStateFocused];
        return self;
    };
}

// default is nil. should be same size if different for different states
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable, UIControlState))elk_setAttributedTitle NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title, UIControlState state) {
        [self setAttributedTitle:title forState:state];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributedTitleForNormal NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title) {
        [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributedTitleForHighlighted NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title) {
        [self setAttributedTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributedTitleForDisabled NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title) {
        [self setAttributedTitle:title forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributedTitleForSelected NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title) {
        [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSAttributedString * _Nullable))elk_setAttributedTitleForFocused NS_AVAILABLE_IOS(6_0)
{
    return ^(NSAttributedString * _Nullable title) {
        [self setAttributedTitle:title forState:UIControlStateFocused];
        return self;
    };
}

#pragma mark - set button background color
/**
 set button background color
 */
- (UIButton * _Nonnull (^)(UIColor * _Nullable))elk_setBackgroundColor
{
    return ^(UIColor * _Nullable bgColor) {
        [self setBackgroundColor:bgColor];
        return self;
    };
}


#pragma mark - set button background image
/**
 set button background image with UIControlState
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))elk_setBackgroundImage
{
    return ^(UIImage * _Nonnull image, UIControlState state) {
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

/**
 set button background image for UIControlStateNormal
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setBackgroundImageForNormal
{
    return ^(UIImage * _Nonnull image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

/**
 set button background image for UIControlStateHighlighted
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setBackgroundImageForHighlighted
{
    return ^(UIImage * _Nonnull image) {
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

/**
 set button background image for UIControlStateDisabled
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setBackgroundImageForDisabled
{
    return ^(UIImage * _Nonnull image) {
        [self setBackgroundImage:image forState:UIControlStateDisabled];
        return self;
    };
}

/**
 set button background image for UIControlStateSelected
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setBackgroundImageForSelected
{
    return ^(UIImage * _Nonnull image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

/**
 set button background image for UIControlStateFocused
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setBackgroundImageForFocused
{
    return ^(UIImage * _Nonnull image) {
        [self setBackgroundImage:image forState:UIControlStateFocused];
        return self;
    };
}


#pragma mark - set button image
/**
 set button image with ELKControlState
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))elk_setImage
{
    return ^(UIImage * _Nonnull image, UIControlState state) {
        [self setImage:image forState:state];
        return self;
    };
}

/**
 set button image for UIControlStateNormal
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setImageForNormal
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

/**
 set button image for UIControlStateHighlighted
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setImageForHighlighted
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

/**
 set button image for UIControlStateDisabled
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setImageForDisabled
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

/**
 set button image for UIControlStateSelected
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setImageForSelected
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

/**
 set button image for UIControlStateFocused
 */
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))elk_setImageForFocused
{
    return ^(UIImage * _Nonnull image) {
        [self setImage:image forState:UIControlStateFocused];
        return self;
    };
}

/**
 set content edge insets
 */
- (UIButton * _Nonnull (^)(UIEdgeInsets))elk_setContentEdgeInsets
{
    return ^(UIEdgeInsets insets) {
        [self setContentEdgeInsets:insets];
        return self;
    };
}
- (UIButton * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))elk_setContentEdgeInsetsMake
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        [self setContentEdgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        return self;
    };
}


/**
 default is UIEdgeInsetsZero
 */
- (UIButton * _Nonnull (^)(UIEdgeInsets))elk_setTitleEdgeInsets
{
    return ^(UIEdgeInsets insets) {
        [self setTitleEdgeInsets:insets];
        return self;
    };
}
- (UIButton * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))elk_setTitleEdgeInsetsMake
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        return self;
    };
}

/**
 default is UIEdgeInsetsZero
 */
- (UIButton * _Nonnull (^)(UIEdgeInsets))elk_setImageEdgeInsets
{
    return ^(UIEdgeInsets insets) {
        [self setImageEdgeInsets:insets];
        return self;
    };
}
- (UIButton * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))elk_setImageEdgeInsetsMake
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        return self;
    };
}


// default is NO. if YES, shadow reverses to shift between engrave and emboss appearance
- (UIButton * _Nonnull (^)(BOOL))elk_setReversesTitleShadowWhenHighlighted
{
    return ^(BOOL reverses) {
        [self setReversesTitleShadowWhenHighlighted:reverses];
        return self;
    };
}

// default is YES. if YES, image is drawn darker when highlighted(pressed)
- (UIButton * _Nonnull (^)(BOOL))elk_setAdjustsImageWhenHighlighted
{
    return ^(BOOL adjust) {
        [self setAdjustsImageWhenHighlighted:adjust];
        return self;
    };
}

// default is YES. if YES, image is drawn lighter when disabled
- (UIButton * _Nonnull (^)(BOOL))elk_setAdjustsImageWhenDisabled
{
    return ^(BOOL adjust) {
        [self setAdjustsImageWhenDisabled:adjust];
        return self;
    };
}

// default is NO. if YES, show a simple feedback (currently a glow) while highlighted
- (UIButton * _Nonnull (^)(BOOL))elk_setShowsTouchWhenHighlighted
{
    return ^(BOOL shows) {
        [self setShowsTouchWhenHighlighted:shows];
        return self;
    };
}

// these getters only take a single state value
- (NSString * _Nullable (^)(UIControlState))elk_titleForState
{
    return ^(UIControlState state) {
        return [self titleForState:state];
    };
}
- (UIColor * _Nullable (^)(UIControlState))elk_titleColorForState
{
    return ^(UIControlState state) {
        return [self titleColorForState:state];
    };
}
- (UIColor * _Nullable (^)(UIControlState))elk_titleShadowColorForState
{
    return ^(UIControlState state) {
        return [self titleShadowColorForState:state];
    };
}
- (UIImage * _Nullable (^)(UIControlState))elk_imageForState
{
    return ^(UIControlState state) {
        return [self imageForState:state];
    };
}
- (UIImage * _Nullable (^)(UIControlState))elk_backgroundImageForState
{
    return ^(UIControlState state) {
        return [self backgroundImageForState:state];
    };
}
- (NSAttributedString * _Nullable (^)(UIControlState))elk_attributedTitleForState
{
    return ^(UIControlState state) {
        return [self attributedTitleForState:state];
    };
}


// these return the rectangle for the background (assumes bounds), the content (image + title) and for the image and title separately. the content rect is calculated based
// on the title and image size and padding and then adjusted based on the control content alignment. there are no draw methods since the contents
// are rendered in separate subviews (UIImageView, UILabel)
- (CGRect (^)(CGRect))elk_backgroundRectForBounds
{
    return ^(CGRect bounds) {
        return [self backgroundRectForBounds:bounds];
    };
}
- (CGRect (^)(CGRect))elk_contentRectForBounds
{
    return ^(CGRect bounds) {
        return [self contentRectForBounds:bounds];
    };
}
- (CGRect (^)(CGRect))elk_titleRectForContentRect
{
    return ^(CGRect contentRect) {
        return [self titleRectForContentRect:contentRect];
    };
}
- (CGRect (^)(CGRect))elk_imageRectForContentRect
{
    return ^(CGRect contentRect) {
        return [self imageRectForContentRect:contentRect];
    };
}





#pragma mark - add target
/**
 add target/action for particular event.
 */
- (UIButton * _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))elk_addTarget
{
    return ^(id target, SEL action, UIControlEvents event) {
        [self addTarget:target action:action forControlEvents:event];
        return self;
    };
}

/**
 add target/action for particular event.
 */
- (UIButton * _Nonnull (^)(UIControlEvents, ELKControlEventBlock _Nonnull))elk_addTargetBlock
{
    return ^(UIControlEvents event, ELKControlEventBlock _Nonnull block) {
        switch (event) {
            case UIControlEventTouchDown:
            {
                [self addTarget:self action:@selector(elk_touchDownAction:) forControlEvents:UIControlEventTouchDown];
                self.elk_touchDownBlock = block;
                break;
            }
            case UIControlEventTouchDownRepeat:
            {
                [self addTarget:self action:@selector(elk_touchDownRepeatAction:) forControlEvents:UIControlEventTouchDownRepeat];
                self.elk_touchDownRepeatBlock = block;
                break;
            }
            case UIControlEventTouchDragInside:
            {
                [self addTarget:self action:@selector(elk_touchDragInsideAction:) forControlEvents:UIControlEventTouchDragInside];
                self.elk_touchDragInsideBlock = block;
                break;
            }
            case UIControlEventTouchDragOutside:
            {
                [self addTarget:self action:@selector(elk_touchDragOutsideAction:) forControlEvents:UIControlEventTouchDragOutside];
                self.elk_touchDragOutsideBlock = block;
                break;
            }
            case UIControlEventTouchDragEnter:
            {
                [self addTarget:self action:@selector(elk_touchDragEnterAction:) forControlEvents:UIControlEventTouchDragEnter];
                self.elk_touchDragEnterBlock = block;
                break;
            }
            case UIControlEventTouchDragExit:
            {
                [self addTarget:self action:@selector(elk_touchDragExitAction:) forControlEvents:UIControlEventTouchDragExit];
                self.elk_touchDragExitBlock = block;
                break;
            }
            case UIControlEventTouchUpInside:
            {
                [self addTarget:self action:@selector(elk_touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
                self.elk_touchUpInsideBlock = block;
                break;
            }
            case UIControlEventTouchUpOutside:
            {
                [self addTarget:self action:@selector(elk_touchUpOutsideAction:) forControlEvents:UIControlEventTouchUpOutside];
                self.elk_touchUpOutsideBlock = block;
                break;
            }
            case UIControlEventTouchCancel:
            {
                [self addTarget:self action:@selector(elk_touchCancelAction:) forControlEvents:UIControlEventTouchCancel];
                self.elk_touchCancelBlock = block;
                break;
            }
            case UIControlEventPrimaryActionTriggered:
            {
                [self addTarget:self action:@selector(elk_primaryActionTriggeredAction:) forControlEvents:UIControlEventPrimaryActionTriggered];
                self.elk_primaryActionTriggeredBlock = block;
                break;
            }
            case UIControlEventAllTouchEvents:
            {
                [self addTarget:self action:@selector(elk_allTouchEventsAction:) forControlEvents:UIControlEventAllTouchEvents];
                self.elk_allTouchEventsBlock = block;
                break;
            }
            case UIControlEventApplicationReserved:
            {
                [self addTarget:self action:@selector(elk_applicationReservedAction:) forControlEvents:UIControlEventApplicationReserved];
                self.elk_applicationReservedBlock = block;
                break;
            }
            case UIControlEventAllEvents:
            {
                [self addTarget:self action:@selector(elk_allEventsAction:) forControlEvents:UIControlEventAllEvents];
                self.elk_allEventsBlock = block;
                break;
            }
                
            default:
            {
                [self addTarget:self action:@selector(elk_touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
                self.elk_touchUpInsideBlock = block;
                break;
            }
        }
        
        return self;
    };
}

/**
 touch event of touch down

 @param sender UIButton object
 */
- (void)elk_touchDownAction:(UIButton *)sender
{
    if (self.elk_touchDownBlock) {
        self.elk_touchDownBlock(sender);
    }
}
/**
 touch event of touch down repeat

 @param sender UIButton object
 */
- (void)elk_touchDownRepeatAction:(UIButton *)sender
{
    if (self.elk_touchDownRepeatBlock) {
        self.elk_touchDownRepeatBlock(sender);
    }
}
/**
 touch event of touch drag inside repeat

 @param sender UIButton object
 */
- (void)elk_touchDragInsideAction:(UIButton *)sender
{
    if (self.elk_touchDragInsideBlock) {
        self.elk_touchDragInsideBlock(sender);
    }
}
/**
 touch event of touch drag outside

 @param sender UIButton object
 */
- (void)elk_touchDragOutsideAction:(UIButton *)sender
{
    if (self.elk_touchDragOutsideBlock) {
        self.elk_touchDragOutsideBlock(sender);
    }
}
/**
 touch event of touch drag enter

 @param sender UIButton object
 */
- (void)elk_touchDragEnterAction:(UIButton *)sender
{
    if (self.elk_touchDragEnterBlock) {
        self.elk_touchDragEnterBlock(sender);
    }
}
/**
 touch event of touch drag exit

 @param sender UIButton object
 */
- (void)elk_touchDragExitAction:(UIButton *)sender
{
    if (self.elk_touchDragExitBlock) {
        self.elk_touchDragExitBlock(sender);
    }
}
/**
 touch event of touch up inside

 @param sender UIButton object
 */
- (void)elk_touchUpInsideAction:(UIButton *)sender
{
    if (self.elk_touchUpInsideBlock) {
        self.elk_touchUpInsideBlock(sender);
    }
}
/**
 touch event of touch up outside

 @param sender UIButton object
 */
- (void)elk_touchUpOutsideAction:(UIButton *)sender
{
    if (self.elk_touchUpOutsideBlock) {
        self.elk_touchUpOutsideBlock(sender);
    }
}
/**
 touch event of touch cancel

 @param sender UIButton object
 */
- (void)elk_touchCancelAction:(UIButton *)sender
{
    if (self.elk_touchCancelBlock) {
        self.elk_touchCancelBlock(sender);
    }
}
/**
 touch event of primary action triggered

 @param sender UIButton object
 */
- (void)elk_primaryActionTriggeredAction:(UIButton *)sender
{
    if (self.elk_primaryActionTriggeredBlock) {
        self.elk_primaryActionTriggeredBlock(sender);
    }
}
/**
 touch event of touch events

 @param sender UIButton object
 */
- (void)elk_allTouchEventsAction:(UIButton *)sender
{
    if (self.elk_allTouchEventsBlock) {
        self.elk_allTouchEventsBlock(sender);
    }
}
/**
 touch event of application reserved

 @param sender UIButton object
 */
- (void)elk_applicationReservedAction:(UIButton *)sender
{
    if (self.elk_applicationReservedBlock) {
        self.elk_applicationReservedBlock(sender);
    }
}
- (void)elk_allEventsAction:(UIButton *)sender
{
    if (self.elk_allEventsBlock) {
        self.elk_allEventsBlock(sender);
    }
}


@end


@implementation UIButton (ELKControlEvent)

#pragma mark - set and get
/**
 get the block who was use to add target for button
 
 @return get the event touch down block
 */
- (ELKControlEventBlock)elk_touchDownBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDownBlock));
}
/**
 set the block to button, the block is use to response the button's touch event

 @param elk_touchDownBlock event touch down block
 */
- (void)setElk_touchDownBlock:(ELKControlEventBlock)elk_touchDownBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDownBlock), elk_touchDownBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button

 @return get the event touch down repeat block
 */
- (ELKControlEventBlock)elk_touchDownRepeatBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDownRepeatBlock));
}
/**
 set the block to button, the block is use to response the button's touch event

 @param elk_touchDownRepeatBlock event touch down repeat block
 */
- (void)setElk_touchDownRepeatBlock:(ELKControlEventBlock)elk_touchDownRepeatBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDownRepeatBlock), elk_touchDownRepeatBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event touch drag inside block
 */
- (ELKControlEventBlock)elk_touchDragInsideBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDragInsideBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_touchDragInsideBlock event touch drag inside block
 */
- (void)setElk_touchDragInsideBlock:(ELKControlEventBlock)elk_touchDragInsideBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDragInsideBlock), elk_touchDragInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event touch drag inside block
 */
- (ELKControlEventBlock)elk_touchDragOutsideBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDragOutsideBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_touchDragOutsideBlock event touch drag outside block
 */
- (void)setElk_touchDragOutsideBlock:(ELKControlEventBlock)elk_touchDragOutsideBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDragOutsideBlock), elk_touchDragOutsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button

 @return get the event touch drag enter block
 */
- (ELKControlEventBlock)elk_touchDragEnterBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDragEnterBlock));
}
/**
 set the block to button, the block is use to response the button's touch event

 @param elk_touchDragEnterBlock event touch drag enter block
 */
- (void)setElk_touchDragEnterBlock:(ELKControlEventBlock)elk_touchDragEnterBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDragEnterBlock), elk_touchDragEnterBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button

 @return get the event touch drag exit block
 */
- (ELKControlEventBlock)elk_touchDragExitBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchDragExitBlock));
}
/**
 set the block to button, the block is use to response the button's touch event

 @param elk_touchDragExitBlock event touch drag exit block
 */
- (void)setElk_touchDragExitBlock:(ELKControlEventBlock)elk_touchDragExitBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchDragExitBlock), elk_touchDragExitBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button

 @return get the event touch up inside block
 */
- (ELKControlEventBlock)elk_touchUpInsideBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchUpInsideBlock));
}
/**
 set the block to button, the block is use to response the button's touch event

 @param elk_touchUpInsideBlock event touch up inside block
 */
- (void)setElk_touchUpInsideBlock:(ELKControlEventBlock)elk_touchUpInsideBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchUpInsideBlock), elk_touchUpInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event touch up outside block
 */
- (ELKControlEventBlock)elk_touchUpOutsideBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchUpOutsideBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_touchUpOutsideBlock event touch up outside block
 */
- (void)setElk_touchUpOutsideBlock:(ELKControlEventBlock)elk_touchUpOutsideBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchUpOutsideBlock), elk_touchUpOutsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event touch cancel block
 */
- (ELKControlEventBlock)elk_touchCancelBlock
{
    return objc_getAssociatedObject(self, @selector(elk_touchCancelBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_touchCancelBlock event touch cancel block
 */
- (void)setElk_touchCancelBlock:(ELKControlEventBlock)elk_touchCancelBlock
{
    objc_setAssociatedObject(self, @selector(elk_touchCancelBlock), elk_touchCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event primary action triggered block
 */
- (ELKControlEventBlock)elk_primaryActionTriggeredBlock
{
    return objc_getAssociatedObject(self, @selector(elk_primaryActionTriggeredBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_primaryActionTriggeredBlock event primary action triggered block
 */
- (void)setElk_primaryActionTriggeredBlock:(ELKControlEventBlock)elk_primaryActionTriggeredBlock
{
    objc_setAssociatedObject(self, @selector(elk_primaryActionTriggeredBlock), elk_primaryActionTriggeredBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event all touch event block
 */
- (ELKControlEventBlock)elk_allTouchEventsBlock
{
    return objc_getAssociatedObject(self, @selector(elk_allTouchEventsBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_allTouchEventsBlock event all touch events block
 */
- (void)setElk_allTouchEventsBlock:(ELKControlEventBlock)elk_allTouchEventsBlock
{
    objc_setAssociatedObject(self, @selector(elk_allTouchEventsBlock), elk_allTouchEventsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event application reserved block
 */
- (ELKControlEventBlock)elk_applicationReservedBlock
{
    return objc_getAssociatedObject(self, @selector(elk_applicationReservedBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_applicationReservedBlock event application reserved block
 */
- (void)setElk_applicationReservedBlock:(ELKControlEventBlock)elk_applicationReservedBlock
{
    objc_setAssociatedObject(self, @selector(elk_applicationReservedBlock), elk_applicationReservedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 get the block who was use to add target for button
 
 @return get the event all events block
 */
- (ELKControlEventBlock)elk_allEventsBlock
{
    return objc_getAssociatedObject(self, @selector(elk_allEventsBlock));
}
/**
 set the block to button, the block is use to response the button's touch event
 
 @param elk_allEventsBlock event all events block
 */
- (void)setElk_allEventsBlock:(ELKControlEventBlock)elk_allEventsBlock
{
    objc_setAssociatedObject(self, @selector(elk_allEventsBlock), elk_allEventsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
