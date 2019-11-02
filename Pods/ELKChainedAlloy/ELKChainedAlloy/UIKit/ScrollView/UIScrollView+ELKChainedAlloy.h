//
//  UIScrollView+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ELKChainedAlloy)


/**
 make a UIScrollView, return a new object
 
 @return a new UIScrollView
 */
+ (UIScrollView * _Nonnull)elk_make;

/**
 make a UIScrollView, return a new object
 
 @param block block
 @return a new UIScrollView
 */
+ (UIScrollView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UIScrollView * _Nonnull make))block;






/**
 set content offset
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setContentOffset)(CGPoint offset);

/**
 set content offset animated
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setContentOffsetAnimated)(CGPoint offset, BOOL animate);

/**
 set content size
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setContentSize)(CGSize contSize);

/**
 set content inset
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setContentInset)(UIEdgeInsets insets);

/**
 set delegate
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setDelegate)(id<UIScrollViewDelegate> _Nullable delegate);

/**
 set bounces
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setBounces)(BOOL bounces);

/**
 set bounces zoom
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setBouncesZoom)(BOOL bZoom);

/**
 set always bounce vertical
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setAlwaysBounceV)(BOOL bounceVertical);

/**
 set always bounce horizontal
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setAlwaysBounceH)(BOOL bounceHorizontal);

/**
 set paging enabled
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setPagingEnabled)(BOOL pEnable);

/**
 set scroll enabled
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setScrollEnabled)(BOOL sEnable);

/**
 set shows horizontal scroll indicator
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setShowsHorizontal)(BOOL scrollIndicator);

/**
 set shows vertical scroll indicator
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setShowsVertical)(BOOL scrollIndicator);

/**
 set indicator style
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setIndicatorStyle)(UIScrollViewIndicatorStyle iStyle);

/**
 set scroll indicator insets
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setScrollIndicatorInsets)(UIEdgeInsets iInset);

/**
 set deceleration rate
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setDecelerationRate)(UIScrollViewDecelerationRate rate);

/**
 set zoom scale
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setZoomScale)(CGFloat scale);

/**
 set zoom scale animated
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setZoomScaleAnimated)(CGFloat zScale, BOOL animate);

/**
 set minimum zoom scale
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setMinZoomScale)(CGFloat minScale);

/**
 set maximum zoom scale
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setMaxZoomScale)(CGFloat maxScale);

/**
 set scrolls to top
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_setScrollsToTop)(BOOL toTop);

/**
 scroll rect to visible animated
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_scrollRectToVisibleAnimated)(CGRect rect, BOOL animate);

/**
 zoom to rect animated
 */
@property (nonatomic, strong, readonly) UIScrollView * _Nonnull (^elk_zoomToRectAnimated)(CGRect rect, BOOL animate);





@end

NS_ASSUME_NONNULL_END
