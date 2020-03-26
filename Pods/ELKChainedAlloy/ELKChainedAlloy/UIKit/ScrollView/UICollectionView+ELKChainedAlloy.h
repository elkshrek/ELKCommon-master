//
//  UICollectionView+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ELKCollCompletionBlock)(BOOL finished);
typedef void(^ELKBatchUpdatesBlock)(void);
typedef void(^ELKCollectionViewMakeBlock)(UICollectionView * _Nonnull make) NS_AVAILABLE_IOS(6_0);


NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (ELKChainedAlloy)


/**
 make a UICollectionView, return a new object
 
 @return a new UICollectionView
 */
+ (UICollectionView * _Nonnull)elk_make;

/**
 make a UICollectionView, return a new object
 
 @param block block
 @return a new UICollectionView
 */
+ (UICollectionView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UICollectionView * _Nonnull make))block;

/**
 make a UICollecitonView, return a new object
 
 @param layout UICollectionViewLayout
 @return a new UICollectionView
 */
+ (UICollectionView * _Nonnull)elk_makeViewLayout:(UICollectionViewLayout * _Nonnull)layout;

/**
 make a UICollecitonView, return a new object
 
 @param layout UICollectionViewLayout
 @param block block
 @return return a new UICollectionView
 */
+ (UICollectionView * _Nonnull)elk_makeViewLayout:(UICollectionViewLayout * _Nonnull)layout block:(void (^ _Nullable)(UICollectionView * _Nonnull make))block;

/**
 Make A UICollectionView, return a new object

 @param layout UICollectionViewLayout
 @return Object Of UICollectionView
 */
UICollectionView * _Nonnull ELK_makeCollectionView(UICollectionViewLayout *_Nonnull layout) NS_AVAILABLE_IOS(6_0);

/**
 Make A UICollectionView, return a new object

 @param layout UICollectionViewLayout
 @param block  block
 @return Object Of UICollectionView
 */
UICollectionView * _Nonnull ELK_makeCollectionViewBlock(UICollectionViewLayout *_Nonnull layout, ELKCollectionViewMakeBlock _Nullable block) NS_AVAILABLE_IOS(6_0);



/**
 set delegate
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setDelegate)(id<UICollectionViewDelegate> delegate);
/**
 set data source
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setDataSource)(id<UICollectionViewDataSource> dataSource);
/**
 set prefetch data source
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setPrefetchDataSource)(id<UICollectionViewDataSourcePrefetching> prefetchDataSource) NS_AVAILABLE_IOS(10_0);
/**
 set drag delegate
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setDragDelegate)(id<UICollectionViewDragDelegate> dragDelegate) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
/**
 set drop delegate
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setDropDelegate)(id <UICollectionViewDropDelegate> dropDelegate) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);


/* To enable intra-app drags on iPhone, set this to YES.
 * You can also force drags to be disabled for this collection view by setting this to NO.
 * By default, For iPad this will return YES and iPhone will return NO.
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setDragInteractionEnabled)(BOOL enable) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

/* Reordering cadence affects how easily reordering occurs while dragging around a reorder-capable drop destination.
 * Default is UICollectionViewReorderingCadenceImmediate.
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setReorderingCadence)(UICollectionViewReorderingCadence recoderingCadence) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);;

// will be automatically resized to track the size of the collection view and placed behind all cells and supplementary views.
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setBackgroundView)(UIView * _Nullable backView);


// For each reuse identifier that the collection view will use, register either a class or a nib from which to instantiate a cell.
// If a nib is registered, it must contain exactly 1 top level object which is a UICollectionViewCell.
// If a class is registered, it will be instantiated via alloc/initWithFrame:
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_registerClassCell)(Class _Nullable cellClass, NSString * _Nonnull identifier);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_registerNibCell)(UINib * _Nullable nib, NSString * _Nonnull identifier);

@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_registerClassForSupplementaryView)(Class _Nullable supClass, NSString * _Nonnull elementKind, NSString * _Nonnull identifier);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_registerNibForSupplementaryView)(UINib * _Nullable nib, NSString * _Nonnull elementKind, NSString * _Nonnull identifier);

@property (nonatomic, copy, readonly) __kindof UICollectionViewCell * _Nonnull (^elk_dequeueReusableCell)(NSString * _Nonnull identifier, NSIndexPath * _Nonnull indexPath);
@property (nonatomic, copy, readonly) __kindof UICollectionReusableView * _Nonnull (^elk_dequeueReusableSupplementaryView)(NSString * _Nonnull elementKind, NSString * _Nonnull identifier, NSIndexPath * _Nonnull indexPath);


// These properties control whether items can be selected, and if so, whether multiple items can be simultaneously selected.
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setAllowsSelection)(BOOL allows);// default is YES
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setAllowsMultipleSelection)(BOOL allowsMult);// default is NO


@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_selectItemAtIndexPath)(NSIndexPath * _Nullable indexPath, BOOL animated, UICollectionViewScrollPosition scrollPosition);

@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_deselectItemAtIndexPath)(NSIndexPath * _Nullable indexPath, BOOL animated);



// Note: -reloadData will discard any uncommitted updates (e.g. placeholders)
// discard the dataSource and delegate data and requery as necessary
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_reloadData)(void);


@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setViewLayout)(UICollectionViewLayout * layout);

/**
 transition from one layout to another
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setCollectionViewLayout)(UICollectionViewLayout *layout, BOOL animated);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_setCollectionViewLayoutCompletion)(UICollectionViewLayout *layout, BOOL animated, ELKCollCompletionBlock _Nullable completion) NS_AVAILABLE_IOS(7_0);


@property (nonatomic, copy, readonly) UICollectionViewTransitionLayout * _Nonnull (^elk_startInteractiveTransitionToCollectionViewLayout)(UICollectionViewLayout *layout, UICollectionViewLayoutInteractiveTransitionCompletion _Nullable completion) NS_AVAILABLE_IOS(7_0);

@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_finishInteractiveTransition)(void) NS_AVAILABLE_IOS(7_0);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_cancelInteractiveTransition)(void) NS_AVAILABLE_IOS(7_0);


// Information about the current state of the collection view.
@property (nonatomic, copy, readonly) NSInteger (^elk_numberOfSections)(void);
@property (nonatomic, copy, readonly) NSInteger (^elk_numberOfItemsInSection)(NSInteger section);


@property (nonatomic, copy, readonly) UICollectionViewLayoutAttributes * _Nullable (^elk_layoutAttributesForItemAtIndexPath)(NSIndexPath * indexPath);
@property (nonatomic, copy, readonly) UICollectionViewLayoutAttributes * _Nullable (^elk_layoutAttributesForSupplementaryElementOfKind)(NSString * kind, NSIndexPath * indexPath);


@property (nonatomic, copy, readonly) NSIndexPath * _Nullable (^elk_indexPathForItemAtPoint)(CGPoint point);
@property (nonatomic, copy, readonly) NSIndexPath * _Nullable (^elk_indexPathForCell)(UICollectionViewCell * cell);
@property (nonatomic, copy, readonly) UICollectionViewCell * _Nullable (^elk_cellForItemAtIndexPath)(NSIndexPath * indexPath);


@property (nonatomic, copy, readonly) UICollectionReusableView * _Nullable (^elk_supplementaryViewForElementKind)(NSString * elementKind, NSIndexPath * indexPath) NS_AVAILABLE_IOS(9_0);
@property (nonatomic, copy, readonly) NSArray<UICollectionReusableView *> * (^elk_visibleSupplementaryViewsOfKind)(NSString * elementKind) NS_AVAILABLE_IOS(9_0);
@property (nonatomic, copy, readonly) NSArray<NSIndexPath *> * (^elk_indexPathsForVisibleSupplementaryElementsOfKind)(NSString * elementKind) NS_AVAILABLE_IOS(9_0);


// Interacting with the collection view.
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_scrollToItemAtIndexPath)(NSIndexPath * indexPath, UICollectionViewScrollPosition scrollPosition, BOOL animated);

// These methods allow dynamic modification of the current set of items in the collection view
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_insertSections)(NSIndexSet * sections);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_deleteSections)(NSIndexSet * sections);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_reloadSections)(NSIndexSet * sections);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_moveSectionToSection)(NSInteger section, NSInteger toSection);

@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_insertItemsAtIndexPaths)(NSArray<NSIndexPath *> * indexPaths);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_deleteItemsAtIndexPaths)(NSArray<NSIndexPath *> * indexPaths);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_reloadItemsAtIndexPaths)(NSArray<NSIndexPath *> * indexPaths);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_moveItemAtIndexPathToIndexPath)(NSIndexPath *indexPath, NSIndexPath * toIndexPath);


/**
 allows multiple insert/delete/reload/move calls to be animated simultaneously. Nestable.
 */
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_performBatchUpdates)(NS_NOESCAPE ELKBatchUpdatesBlock _Nullable updates, ELKCollCompletionBlock _Nullable completion);



// Support for reordering
@property (nonatomic, copy, readonly) BOOL (^elk_beginInteractiveMovementForItemAtIndexPath)(NSIndexPath * indexPath) NS_AVAILABLE_IOS(9_0); // returns NO if reordering was prevented from beginning - otherwise YES
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_updateInteractiveMovementTargetPosition)(CGPoint targetPosition) NS_AVAILABLE_IOS(9_0);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_endInteractiveMovement)(void) NS_AVAILABLE_IOS(9_0);
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_cancelInteractiveMovement)(void) NS_AVAILABLE_IOS(9_0);



// Support for Focus
// defaults to NO. If YES, when focusing on a collection view the last focused index path is focused automatically. If the collection view has never been focused, then the preferred focused index path is used.
@property (nonatomic, copy, readonly) UICollectionView * _Nonnull (^elk_remembersLastFocusedIndexPath)(BOOL remembers) NS_AVAILABLE_IOS(9_0);




@end

NS_ASSUME_NONNULL_END
