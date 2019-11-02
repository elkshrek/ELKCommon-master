//
//  UIScrollView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIScrollView+ELKChainedAlloy.h"

@implementation UIScrollView (ELKChainedAlloy)


/**
 make a UIScrollView, return a new object
 
 @return a new UIScrollView
 */
+ (UIScrollView *)elk_make
{
    return [[UIScrollView alloc] init];
}

/**
 make a UIScrollView, return a new object
 
 @param block block
 @return a new UIScrollView
 */
+ (UIScrollView *)elk_makeBlock:(void (^)(UIScrollView * _Nonnull))block
{
    UIScrollView *make = [[UIScrollView alloc] init];
    if (block) {
        block(make);
    }
    return make;
}



/**
 set content offset
 */
- (UIScrollView * _Nonnull (^)(CGPoint))elk_setContentOffset
{
    return ^(CGPoint offset) {
        [self setContentOffset:offset];
        return self;
    };
}

/**
 set content offset animated
 */
- (UIScrollView * _Nonnull (^)(CGPoint, BOOL))elk_setContentOffsetAnimated
{
    return ^(CGPoint offset, BOOL animate) {
        [self setContentOffset:offset animated:animate];
        return self;
    };
}

/**
 set content size
 */
- (UIScrollView * _Nonnull (^)(CGSize))elk_setContentSize
{
    return ^(CGSize contSize) {
        [self setContentSize:contSize];
        return self;
    };
}

/**
 set content inset
 */
- (UIScrollView * _Nonnull (^)(UIEdgeInsets))elk_setContentInset
{
    return ^(UIEdgeInsets insets) {
        [self setContentInset:insets];
        return self;
    };
}

/**
 set delegate
 */
- (UIScrollView * _Nonnull (^)(id<UIScrollViewDelegate> _Nullable))elk_setDelegate
{
    return ^(id<UIScrollViewDelegate> _Nullable delegate) {
        [self setDelegate:delegate];
        return self;
    };
}

/**
 set bounces
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setBounces
{
    return ^(BOOL bounces) {
        [self setBounces:bounces];
        return self;
    };
}

/**
 set bounces zoom
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setBouncesZoom
{
    return ^(BOOL bZoom) {
        [self setBouncesZoom:bZoom];
        return self;
    };
}

/**
 set always bounce vertical
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setAlwaysBounceV
{
    return ^(BOOL bounceVertical) {
        [self setAlwaysBounceVertical:bounceVertical];
        return self;
    };
}

/**
 set always bounce horizontal
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setAlwaysBounceH
{
    return ^(BOOL bounceHorizontal) {
        [self setAlwaysBounceHorizontal:bounceHorizontal];
        return self;
    };
}

/**
 set paging enabled
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setPagingEnabled
{
    return ^(BOOL pEnable) {
        [self setPagingEnabled:pEnable];
        return self;
    };
}

/**
 set scroll enabled
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setScrollEnabled
{
    return ^(BOOL sEnable) {
        [self setScrollEnabled:sEnable];
        return self;
    };
}

/**
 set shows horizontal scroll indicator
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setShowsHorizontal
{
    return ^(BOOL scrollIndicator) {
        [self setShowsHorizontalScrollIndicator:scrollIndicator];
        return self;
    };
}

/**
 set shows vertical scroll indicator
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setShowsVertical
{
    return ^(BOOL scrollIndicator) {
        [self setShowsVerticalScrollIndicator:scrollIndicator];
        return self;
    };
}

/**
 set indicator style
 */
- (UIScrollView * _Nonnull (^)(UIScrollViewIndicatorStyle))elk_setIndicatorStyle
{
    return ^(UIScrollViewIndicatorStyle iStyle) {
        [self setIndicatorStyle:iStyle];
        return self;
    };
}

/**
 set scroll indicator insets
 */
- (UIScrollView * _Nonnull (^)(UIEdgeInsets))elk_setScrollIndicatorInsets
{
    return ^(UIEdgeInsets iInset) {
        [self setScrollIndicatorInsets:iInset];
        return self;
    };
}

/**
 set deceleration rate
 */
- (UIScrollView * _Nonnull (^)(UIScrollViewDecelerationRate))elk_setDecelerationRate
{
    return ^(UIScrollViewDecelerationRate rate) {
        [self setDecelerationRate:rate];
        return self;
    };
}

/**
 set zoom scale
 */
- (UIScrollView * _Nonnull (^)(CGFloat))elk_setZoomScale
{
    return ^(CGFloat scale) {
        [self setZoomScale:scale];
        return self;
    };
}

/**
 set zoom scale animated
 */
- (UIScrollView * _Nonnull (^)(CGFloat, BOOL))elk_setZoomScaleAnimated
{
    return ^(CGFloat zScale, BOOL animate) {
        [self setZoomScale:zScale animated:animate];
        return self;
    };
}

/**
 set minimum zoom scale
 */
- (UIScrollView * _Nonnull (^)(CGFloat))elk_setMinZoomScale
{
    return ^(CGFloat minScale) {
        [self setMinimumZoomScale:minScale];
        return self;
    };
}

/**
 set maximum zoom scale
 */
- (UIScrollView * _Nonnull (^)(CGFloat))elk_setMaxZoomScale
{
    return ^(CGFloat maxScale) {
        [self setMaximumZoomScale:maxScale];
        return self;
    };
}

/**
 set scrolls to top
 */
- (UIScrollView * _Nonnull (^)(BOOL))elk_setScrollsToTop
{
    return ^(BOOL toTop) {
        [self setScrollsToTop:toTop];
        return self;
    };
}

/**
 scroll rect to visible animated
 */
- (UIScrollView * _Nonnull (^)(CGRect, BOOL))elk_scrollRectToVisibleAnimated
{
    return ^(CGRect rect, BOOL animate) {
        [self scrollRectToVisible:rect animated:animate];
        return self;
    };
}

/**
 zoom to rect animated
 */
- (UIScrollView * _Nonnull (^)(CGRect, BOOL))elk_zoomToRectAnimated
{
    return ^(CGRect rect, BOOL animate) {
        [self zoomToRect:rect animated:animate];
        return self;
    };
}




@end
