//
//  UIView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIView+ELKChainedAlloy.h"

@implementation UIView (ELKChainedAlloy)


/**
 make a UIView, return a new object
 
 @return a new UIView
 */
+ (UIView * _Nonnull)elk_make
{
    return [[UIView alloc] init];
}

/**
 make a UIView, return a new object
 
 @param block block
 @return a new UIView
 */
+ (UIView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIView * _Nonnull make))block
{
    UIView *make = [[UIView alloc] init];
    if (block) {
        block(make);
    }
    return make;
}


#pragma mark - base property
/**
 set frame
 */
- (UIView * _Nonnull (^)(CGRect))elk_setFrame
{
    return ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))elk_setFrameMake
{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}
- (CGRect (^)(void))elk_frame
{
    return ^(void) {
        return self.frame;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setX
{
    return ^(CGFloat x) {
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setY
{
    return ^(CGFloat y) {
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setWidth
{
    return ^(CGFloat width) {
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setHeight
{
    return ^(CGFloat height) {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}
- (CGFloat (^)(void))elk_x
{
    return ^(void) {
        return self.frame.origin.x;
    };
}
- (CGFloat (^)(void))elk_y
{
    return ^(void) {
       return self.frame.origin.y;
    };
}
- (CGFloat (^)(void))elk_width
{
    return ^(void) {
        return self.frame.size.width;
    };
}
- (CGFloat (^)(void))elk_height
{
    return ^(void) {
        return self.frame.size.height;
    };
}
- (CGFloat (^)(void))elk_maxX
{
    return ^(void) {
        return CGRectGetMaxX(self.frame);
    };
}
- (CGFloat (^)(void))elk_maxY
{
    return ^(void) {
        return CGRectGetMaxY(self.frame);
    };
}
- (UIView * _Nonnull (^)(CGRect))elk_setBounds
{
    return ^(CGRect bounds) {
        self.bounds = bounds;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))elk_setBoundsMake
{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
        self.bounds = CGRectMake(x, y, width, height);
        return self;
    };
}
- (CGRect (^)(void))elk_bounds
{
    return ^(void) {
        return self.bounds;
    };
}
- (UIView * _Nonnull (^)(CGPoint))elk_setCenter
{
    return ^(CGPoint center) {
        self.center = center;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat, CGFloat))elk_setCenterMake
{
    return ^(CGFloat centerX, CGFloat centerY) {
        self.center = CGPointMake(centerX, centerY);
        return self;
    };
}
- (CGPoint (^)(void))elk_center
{
    return ^(void) {
        return self.center;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setCenterX
{
    return ^(CGFloat centerX) {
        CGPoint center = self.center;
        center.x = centerX;
        self.center = center;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat))elk_setCenterY
{
    return ^(CGFloat centerY) {
        CGPoint center = self.center;
        center.y = centerY;
        self.center = center;
        return self;
    };
}
- (CGFloat (^)(void))elk_centerX
{
    return ^(void) {
        return self.center.x;
    };
}
- (CGFloat (^)(void))elk_centerY
{
    return ^(void) {
        return self.center.y;
    };
}
- (UIView * _Nonnull (^)(CGSize))elk_setSize
{
    return ^(CGSize size) {
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat, CGFloat))elk_setSizeMake
{
    return ^(CGFloat width, CGFloat height) {
        CGRect frame = self.frame;
        frame.size = CGSizeMake(width, height);
        self.frame = frame;
        return self;
    };
}
- (CGSize (^)(void))elk_size
{
    return ^(void) {
        return self.frame.size;
    };
}
- (UIView * _Nonnull (^)(CGPoint))elk_setOrigin
{
    return ^(CGPoint origin) {
        CGRect frame = self.frame;
        frame.origin = origin;
        self.frame = frame;
        return self;
    };
}
- (UIView * _Nonnull (^)(CGFloat, CGFloat))elk_setOriginMake
{
    return ^(CGFloat originX, CGFloat originY) {
        CGRect frame = self.frame;
        frame.origin = CGPointMake(originX, originY);
        self.frame = frame;
        return self;
    };
}
- (CGPoint (^)(void))elk_origin
{
    return ^(void) {
        return self.frame.origin;
    };
}


/**
 set background color
 */
- (UIView * _Nonnull (^)(UIColor * _Nonnull))elk_setBackgroundColor
{
    return ^(UIColor * _Nonnull bgColor) {
        self.backgroundColor = bgColor;
        return self;
    };
}

/**
 set alpha
 */
- (UIView * _Nonnull (^)(CGFloat))elk_setAlpha
{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}
/**
 set opaque
 */
- (UIView * _Nonnull (^)(CGFloat))elk_setOpaque
{
    return ^(CGFloat opaque) {
        self.opaque = opaque;
        return self;
    };
}

/**
 set corner radius
 */
- (UIView * _Nonnull (^)(CGFloat))elk_setCornerRadius
{
    return ^(CGFloat cRadius) {
        self.layer.cornerRadius = cRadius;
        return self;
    };
}

/**
 set mask to bounds
 */
- (UIView * _Nonnull (^)(BOOL))elk_setMaskToBounds
{
    return ^(BOOL bounds) {
        self.layer.masksToBounds = bounds;
        return self;
    };
}

/**
 set clip to bounds
 */
- (UIView * _Nonnull (^)(BOOL))elk_setClipToBounds
{
    return ^(BOOL clip) {
        self.clipsToBounds = clip;
        return self;
    };
}

/**
 set user interaction enable
 */
- (UIView * _Nonnull (^)(BOOL))elk_setUserInteractionEnable
{
    return ^(BOOL enable) {
        self.userInteractionEnabled = enable;
        return self;
    };
}

/**
 set hidden
 */
- (UIView * _Nonnull (^)(BOOL))elk_setHidden
{
    return ^(BOOL hide) {
        self.hidden = hide;
        return self;
    };
}

/**
 set tag
 */
- (UIView * _Nonnull (^)(NSInteger))elk_setTag
{
    return ^(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

/**
 set content mode
 */
- (UIView * _Nonnull (^)(UIViewContentMode))elk_setContentMode
{
    return ^(UIViewContentMode contentMode) {
        self.contentMode = contentMode;
        return self;
    };
}

/**
 set mutiple touch
 */
- (UIView * _Nonnull (^)(BOOL))elk_setMutipleTouch
{
    return ^(BOOL mutipleTouch) {
        self.multipleTouchEnabled = mutipleTouch;
        return self;
    };
}

/**
 set autoresize subviews
 */
- (UIView * _Nonnull (^)(BOOL))elk_setAutoresizeSubViews
{
    return ^(BOOL autoresize) {
        self.autoresizesSubviews = autoresize;
        return self;
    };
}

/**
 set autoresize mask
 */
- (UIView * _Nonnull (^)(BOOL))elk_setAutoresizeMask
{
    return ^(BOOL autoresize) {
        self.autoresizingMask = autoresize;
        return self;
    };
}

/**
 end editing
 */
- (UIView * _Nonnull (^)(BOOL))elk_endEditing
{
    return ^(BOOL endEditing) {
        [self endEditing:endEditing];
        return self;
    };
}

/**
 remove from superview
 */
- (UIView * _Nonnull (^)(void))elk_removeFromSuperView
{
    return ^(void) {
        [self removeFromSuperview];
        return self;
    };
}

/**
 insert subView at index
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull, NSInteger))elk_insertSubviewAtIndex
{
    return ^(UIView * _Nonnull subView, NSInteger index) {
        [self insertSubview:subView atIndex:index];
        return self;
    };
}

/**
 insert subView below tView
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull, UIView * _Nonnull))elk_inserSubviewBelowView
{
    return ^(UIView * _Nonnull subView, UIView * _Nonnull tView) {
        [self insertSubview:subView belowSubview:tView];
        return self;
    };
}

/**
 insert subView above tView
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull, UIView * _Nonnull))elk_insertSubviewAboveView
{
    return ^(UIView * _Nonnull subView, UIView * _Nonnull tView) {
        [self insertSubview:subView aboveSubview:tView];
        return self;
    };
}

/**
 exchange subview at index with index
 */
- (UIView * _Nonnull (^)(NSInteger, NSInteger))elk_exchangeSubviewAtIndexWithIndex
{
    return ^(NSInteger index1, NSInteger index2) {
        [self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return self;
    };
}

/**
 bring subView to front
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull))elk_bringSubViewToFront
{
    return ^(UIView * _Nonnull subView) {
        [self bringSubviewToFront:subView];
        return self;
    };
}

/**
 send subView to back
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull))elk_sendSubviewToBack
{
    return ^(UIView * _Nonnull subView) {
        [self sendSubviewToBack:subView];
        return self;
    };
}

/**
 add subView
 */
- (UIView * _Nonnull (^)(UIView * _Nonnull))elk_addSubview
{
    return ^(UIView * _Nonnull subView) {
        [self addSubview:subView];
        return self;
    };
}

/**
 add gesture
 */
- (UIView * _Nonnull (^)(UIGestureRecognizer * _Nonnull))elk_addGesture
{
    return ^(UIGestureRecognizer * _Nonnull gesture) {
        [self addGestureRecognizer:gesture];
        return self;
    };
}

/**
 remove gesture
 */
- (UIView * _Nonnull (^)(UIGestureRecognizer * _Nonnull))elk_removeGesture
{
    return ^(UIGestureRecognizer * _Nonnull gesture) {
        [self removeGestureRecognizer:gesture];
        return self;
    };
}


#pragma mark - get view property
- (BOOL (^)(void))elk_isZeroSize
{
    return ^(void) {
        if (CGRectEqualToRect(self.frame, CGRectZero)) {
            return YES;
        }
        return NO;
    };
}

/**
 set Tint color
 */
- (UIView * _Nonnull (^)(UIColor * _Nonnull))elk_setTintColor NS_AVAILABLE_IOS(7_0)
{
    return ^(UIColor * _Nonnull tColor) {
        [self setTintColor:tColor];
        return self;
    };
}








@end
