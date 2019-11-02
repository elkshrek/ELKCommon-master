//
//  UIControl+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (ELKChainedAlloy)


/**
 set selected
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_setSelected)(BOOL selected);

/**
 set enabled
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_setEnabled)(BOOL enable);

/**
 set highlighted
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_setHighlighted)(BOOL highlighted);

/**
 set content vertical alignment
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_setVerticalAlignment)(UIControlContentVerticalAlignment contentAlignment);

/**
 set content horizontal alignment
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_setHorizontalAlignment)(UIControlContentHorizontalAlignment contentAlignment);

/**
 add target action for control events
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_addTarget)(id _Nonnull target, SEL _Nonnull selector, UIControlEvents contEvent);

/**
 remove target action for control events
 */
@property (nonatomic, strong, readonly) UIControl * _Nonnull (^elk_removeTarget)(id _Nullable target, SEL _Nullable selector, UIControlEvents contEvent);




@end

NS_ASSUME_NONNULL_END
