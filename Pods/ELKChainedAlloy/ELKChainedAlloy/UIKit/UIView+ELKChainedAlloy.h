//
//  UIView+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ELKChainedAlloy)


/**
 make a UIView, return a new object
 
 @return a new UIView
 */
+ (UIView * _Nonnull)elk_make;

/**
 make a UIView, return a new object
 
 @param block block
 @return a new UIView
 */
+ (UIView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIView * _Nonnull make))block;



#pragma mark - base property
/**
 set frame
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setFrame)(CGRect frame);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setFrameMake)(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
@property (nonatomic, copy, readonly) CGRect (^elk_frame)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setX)(CGFloat x);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setY)(CGFloat y);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setWidth)(CGFloat width);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setHeight)(CGFloat height);
@property (nonatomic, copy, readonly) CGFloat (^elk_x)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_y)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_width)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_height)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_maxX)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_maxY)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setBounds)(CGRect bounds);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setBoundsMake)(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
@property (nonatomic, copy, readonly) CGRect (^elk_bounds)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setCenter)(CGPoint cPoint);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setCenterMake)(CGFloat centerX, CGFloat centerY);
@property (nonatomic, copy, readonly) CGPoint (^elk_center)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setCenterX)(CGFloat centerX);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setCenterY)(CGFloat centerY);
@property (nonatomic, copy, readonly) CGFloat (^elk_centerX)(void);
@property (nonatomic, copy, readonly) CGFloat (^elk_centerY)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setSize)(CGSize size);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setSizeMake)(CGFloat width, CGFloat height);
@property (nonatomic, copy, readonly) CGSize (^elk_size)(void);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setOrigin)(CGPoint origin);
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setOriginMake)(CGFloat originX, CGFloat originY);
@property (nonatomic, copy, readonly) CGPoint (^elk_origin)(void);

/**
 set background color
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setBackgroundColor)(UIColor * _Nonnull bgColor);
/**
 set alpha
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setAlpha)(CGFloat alpha);
/**
 set opaque
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setOpaque)(CGFloat opaque);

/// set border color
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setBorderColor)(UIColor *borderColor);

/// set border width
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setBorderWidth)(CGFloat borderWidth);

/**
 set corner radius
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setCornerRadius)(CGFloat cRadius);
/**
 set mask to bounds
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setMaskToBounds)(BOOL bounds);
/**
 set clip to bounds
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setClipToBounds)(BOOL clip);
/**
 set user interaction enable
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setUserInteractionEnable)(BOOL enable);
/**
 set hidden
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setHidden)(BOOL hide);
/**
 set tag
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setTag)(NSInteger tag);
/**
 set content mode
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setContentMode)(UIViewContentMode contentMode);
/**
 set mutiple touch
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setMutipleTouch)(BOOL mutipleTouch);
/**
 set autoresize subviews
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setAutoresizeSubViews)(BOOL autoresize);
/**
 set autoresize mask
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setAutoresizeMask)(BOOL autoresize);
/**
 end editing
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_endEditing)(BOOL endEditing);

/**
 remove from superview
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_removeFromSuperView)(void);
/**
 insert subView at index
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_insertSubviewAtIndex)(UIView * _Nonnull subView, NSInteger index);
/**
 insert subView below tView
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_inserSubviewBelowView)(UIView * _Nonnull subView, UIView * _Nonnull tView);
/**
 insert subView above tView
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_insertSubviewAboveView)(UIView * _Nonnull subView, UIView * _Nonnull tView);
/**
 exchange subview at index with index
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_exchangeSubviewAtIndexWithIndex)(NSInteger index1, NSInteger index2);
/**
 bring subView to front
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_bringSubViewToFront)(UIView * _Nonnull subView);
/**
 send subView to back
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_sendSubviewToBack)(UIView * _Nonnull subView);
/**
 add subView
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_addSubview)(UIView * _Nonnull subView);

/**
 add gesture
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_addGesture)(UIGestureRecognizer * _Nonnull gesture);
/**
 remove gesture
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_removeGesture)(UIGestureRecognizer * _Nonnull gesture);



#pragma mark - get view property
@property (nonatomic, copy, readonly) BOOL (^elk_isZeroSize)(void);



/**
 set Tint color
 */
@property (nonatomic, strong, readonly) UIView * _Nonnull (^elk_setTintColor)(UIColor * _Nonnull tColor) NS_AVAILABLE_IOS(7_0);






@end

NS_ASSUME_NONNULL_END
