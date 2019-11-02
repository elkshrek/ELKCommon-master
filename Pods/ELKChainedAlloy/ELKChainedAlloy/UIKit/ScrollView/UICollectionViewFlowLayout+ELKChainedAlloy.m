//
//  UICollectionViewFlowLayout+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by wing on 2019/9/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UICollectionViewFlowLayout+ELKChainedAlloy.h"

@implementation UICollectionViewFlowLayout (ELKChainedAlloy)


/**
 set Minimum Line Spacing
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGFloat))elk_setMinimumLineSpacing
{
    return ^(CGFloat minimumLineSpacing) {
        self.minimumLineSpacing = minimumLineSpacing;
        return self;
    };
}

/**
 set Minimum Line Interitem Spacing
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGFloat))elk_setMinimumInteritemSpacing
{
    return ^(CGFloat minimumInteritemSpacing) {
        self.minimumInteritemSpacing = minimumInteritemSpacing;
        return self;
    };
}

/**
 set Item Size
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGSize))elk_setItemSize
{
    return ^(CGSize itemSize) {
        self.itemSize = itemSize;
        return self;
    };
}

/**
 defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGSize))elk_setEstimatedItemSize NS_AVAILABLE_IOS(8_0)
{
    return ^(CGSize estimatedItemSize) {
        self.estimatedItemSize = estimatedItemSize;
        return self;
    };
}

/**
 default is UICollectionViewScrollDirectionVertical
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(UICollectionViewScrollDirection))elk_setScrollDirection
{
    return ^(UICollectionViewScrollDirection scrollDirection) {
        self.scrollDirection = scrollDirection;
        return self;
    };
}

/**
 set Header Reference Size
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGSize))elk_setHeaderReferenceSize
{
    return ^(CGSize headerReferenceSize) {
        self.headerReferenceSize = headerReferenceSize;
        return self;
    };
}

/**
 set Footer Reference Size
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(CGSize))elk_setFooterReferenceSize
{
    return ^(CGSize footerReferenceSize) {
        self.footerReferenceSize = footerReferenceSize;
        return self;
    };
}

/**
 set Section Inset
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(UIEdgeInsets))elk_setSectionInset
{
    return ^(UIEdgeInsets sectionInset) {
        self.sectionInset = sectionInset;
        return self;
    };
}

/**
 The reference boundary that the section insets will be defined as relative to. Defaults to `.fromContentInset`.
 NOTE: Content inset will always be respected at a minimum. For example, if the sectionInsetReference equals `.fromSafeArea`, but the adjusted content inset is greater that the combination of the safe area and section insets, then section content will be aligned with the content inset instead.
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(UICollectionViewFlowLayoutSectionInsetReference))elk_setSectionInsetReference API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos)
{
    return ^(UICollectionViewFlowLayoutSectionInsetReference sectionInsetReference) {
        self.sectionInsetReference = sectionInsetReference;
        return self;
    };
}

/**
 Set these properties to YES to get headers that pin to the top of the screen and footers that pin to the bottom while scrolling (similar to UITableView).
 */
- (UICollectionViewFlowLayout * _Nonnull (^)(BOOL))elk_setSectionHeadersPinToVisibleBounds NS_AVAILABLE_IOS(9_0)
{
    return ^(BOOL bounds) {
        self.sectionHeadersPinToVisibleBounds = bounds;
        return self;
    };
}
- (UICollectionViewFlowLayout * _Nonnull (^)(BOOL))elk_setSectionFootersPinToVisibleBounds NS_AVAILABLE_IOS(9_0)
{
    return ^(BOOL bounds) {
        self.sectionFootersPinToVisibleBounds = bounds;
        return self;
    };
}



@end
