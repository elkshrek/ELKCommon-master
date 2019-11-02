//
//  UICollectionViewFlowLayout+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by wing on 2019/9/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (ELKChainedAlloy)


/**
 set Minimum Line Spacing
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setMinimumLineSpacing)(CGFloat minimumLineSpacing);

/**
 set Minimum Line Interitem Spacing
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setMinimumInteritemSpacing)(CGFloat minimumInteritemSpacing);

/**
 set Item Size
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setItemSize)(CGSize itemSize);

/**
 defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setEstimatedItemSize)(CGSize estimatedItemSize) NS_AVAILABLE_IOS(8_0);

/**
 default is UICollectionViewScrollDirectionVertical
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setScrollDirection)(UICollectionViewScrollDirection scrollDirection);

/**
 set Header Reference Size
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setHeaderReferenceSize)(CGSize headerReferenceSize);

/**
 set Footer Reference Size
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setFooterReferenceSize)(CGSize footerReferenceSize);

/**
 set Section Inset
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setSectionInset)(UIEdgeInsets sectionInset);

/**
 The reference boundary that the section insets will be defined as relative to. Defaults to `.fromContentInset`.
 NOTE: Content inset will always be respected at a minimum. For example, if the sectionInsetReference equals `.fromSafeArea`, but the adjusted content inset is greater that the combination of the safe area and section insets, then section content will be aligned with the content inset instead.
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setSectionInsetReference)(UICollectionViewFlowLayoutSectionInsetReference sectionInsetReference) API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);


/**
 Set these properties to YES to get headers that pin to the top of the screen and footers that pin to the bottom while scrolling (similar to UITableView).
 */
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setSectionHeadersPinToVisibleBounds)(BOOL bounds)NS_AVAILABLE_IOS(9_0);
@property (nonatomic, copy, readonly) UICollectionViewFlowLayout * _Nonnull (^elk_setSectionFootersPinToVisibleBounds)(BOOL bounds)NS_AVAILABLE_IOS(9_0);





@end

NS_ASSUME_NONNULL_END
