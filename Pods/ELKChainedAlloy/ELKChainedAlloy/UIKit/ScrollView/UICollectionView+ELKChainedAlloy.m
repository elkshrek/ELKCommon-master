//
//  UICollectionView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UICollectionView+ELKChainedAlloy.h"

@implementation UICollectionView (ELKChainedAlloy)


/**
 make a UICollectionView, return a new object

 @return a new UICollectionView
 */
+ (UICollectionView *)elk_make
{
    UICollectionViewFlowLayout *fLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fLayout];
    return make;
}

/**
 make a UICollectionView, return a new object
 
 @param block block
 @return a new UICollectionView
 */
+ (UICollectionView *)elk_makeBlock:(void (^)(UICollectionView * _Nonnull))block
{
    UICollectionViewFlowLayout *fLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fLayout];
    if (block) {
        block(make);
    }
    return make;
}

/**
 make a UICollecitonView, return a new object

 @param layout UICollectionViewLayout
 @return a new UICollectionView
 */
+ (UICollectionView *)elk_makeViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    return make;
}

/**
 make a UICollecitonView, return a new object

 @param layout UICollectionViewLayout
 @param block block
 @return return a new UICollectionView
 */
+ (UICollectionView *)elk_makeViewLayout:(UICollectionViewLayout *)layout block:(void (^)(UICollectionView * _Nonnull))block
{
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    if (block) {
        block(make);
    }
    return make;
}


/**
 Make A UICollectionView, return a new object
 
 @param layout UICollectionViewLayout
 @return Object Of UICollectionView
 */
UICollectionView * _Nonnull ELK_makeCollectionView(UICollectionViewLayout *_Nonnull layout)
NS_AVAILABLE_IOS(6_0)
{
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    return make;
}

/**
 Make A UICollectionView, return a new object
 
 @param layout UICollectionViewLayout
 @param block  block
 @return Object Of UICollectionView
 */
UICollectionView * _Nonnull ELK_makeCollectionViewBlock(UICollectionViewLayout *_Nonnull layout, ELKCollectionViewMakeBlock _Nullable block)
NS_AVAILABLE_IOS(6_0)
{
    UICollectionView *make = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    if (block) {
        block(make);
    }
    return make;
}



/**
 set delegate
 */
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDelegate> _Nonnull))elk_setDelegate
{
    return ^(id<UICollectionViewDelegate> delegate) {
        [self setDelegate:delegate];
        return self;
    };
}

/**
 set data source
 */
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDataSource> _Nonnull))elk_setDataSource
{
    return ^(id<UICollectionViewDataSource> dataSource) {
        [self setDataSource:dataSource];
        return self;
    };
}

/**
 set prefetch data source
 */
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDataSourcePrefetching> _Nonnull))elk_setPrefetchDataSource
{
    return ^(id<UICollectionViewDataSourcePrefetching> prefetchDataSource) {
        [self setPrefetchDataSource:prefetchDataSource];
        return self;
    };
}

/**
 set drag delegate
 */
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDragDelegate> _Nonnull))elk_setDragDelegate
{
    return ^(id<UICollectionViewDragDelegate> dragDelegate) {
        [self setDragDelegate:dragDelegate];
        return self;
    };
}

/**
 set drop delegate
 */
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDropDelegate> _Nonnull))elk_setDropDelegate
{
    return ^(id <UICollectionViewDropDelegate> dropDelegate) {
        [self setDropDelegate:dropDelegate];
        return self;
    };
}

/**
 set drag interaction enable
 */
- (UICollectionView * _Nonnull (^)(BOOL))elk_setDragInteractionEnabled
{
    return ^(BOOL enable) {
        [self setDragInteractionEnabled:enable];
        return self;
    };
}

/**
 set reordering cadence
 */
- (UICollectionView * _Nonnull (^)(UICollectionViewReorderingCadence))elk_setReorderingCadence
{
    return ^(UICollectionViewReorderingCadence recoderingCadence) {
        [self setReorderingCadence:recoderingCadence];
        return self;
    };
}

- (UICollectionView * _Nonnull (^)(UIView * _Nullable))elk_setBackgroundView
{
    return ^(UIView * _Nullable backView) {
        [self setBackgroundView:backView];
        return self;
    };
}

// For each reuse identifier that the collection view will use, register either a class or a nib from which to instantiate a cell.
// If a nib is registered, it must contain exactly 1 top level object which is a UICollectionViewCell.
// If a class is registered, it will be instantiated via alloc/initWithFrame:
- (UICollectionView * _Nonnull (^)(Class  _Nullable __unsafe_unretained, NSString * _Nonnull))elk_registerClassCell
{
    return ^(Class _Nullable cellClass, NSString * _Nonnull identifier) {
        [self registerClass:cellClass forCellWithReuseIdentifier:identifier];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(UINib * _Nullable, NSString * _Nonnull))elk_registerNibCell
{
    return ^(UINib * _Nullable nib, NSString * _Nonnull identifier) {
        [self registerNib:nib forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView * _Nonnull (^)(Class  _Nullable __unsafe_unretained, NSString * _Nonnull, NSString * _Nonnull))elk_registerClassForSupplementaryView
{
    return ^(Class _Nullable supClass, NSString * _Nonnull elementKind, NSString * _Nonnull identifier) {
        [self registerClass:supClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(UINib * _Nullable, NSString * _Nonnull, NSString * _Nonnull))elk_registerNibForSupplementaryView
{
    return ^(UINib * _Nullable nib, NSString * _Nonnull elementKind, NSString * _Nonnull identifier) {
        [self registerNib:nib forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
        return self;
    };
}

- (__kindof UICollectionViewCell * _Nonnull (^)(NSString * _Nonnull, NSIndexPath * _Nonnull))elk_dequeueReusableCell
{
    return ^(NSString * _Nonnull identifier, NSIndexPath * _Nonnull indexPath) {
        UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return cell;
    };
}
- (__kindof UICollectionReusableView * _Nonnull (^)(NSString * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))elk_dequeueReusableSupplementaryView
{
    return ^(NSString * _Nonnull elementKind, NSString * _Nonnull identifier, NSIndexPath * _Nonnull indexPath) {
        UICollectionReusableView *reusableView = [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
        return reusableView;
    };
}

// These properties control whether items can be selected, and if so, whether multiple items can be simultaneously selected.
- (UICollectionView * _Nonnull (^)(BOOL))elk_setAllowsSelection
{
    return ^(BOOL allows) {
        [self setAllowsSelection:allows];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(BOOL))elk_setAllowsMultipleSelection
{
    return ^(BOOL allowsMult) {
        [self setAllowsMultipleSelection:allowsMult];
        return self;
    };
}

- (UICollectionView * _Nonnull (^)(NSIndexPath * _Nullable, BOOL, UICollectionViewScrollPosition))elk_selectItemAtIndexPath
{
    return ^(NSIndexPath * _Nullable indexPath, BOOL animated, UICollectionViewScrollPosition scrollPosition) {
        [self selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
        return self;
    };
}

- (UICollectionView * _Nonnull (^)(NSIndexPath * _Nullable, BOOL))elk_deselectItemAtIndexPath
{
    return ^(NSIndexPath * _Nullable indexPath, BOOL animated) {
        [self deselectItemAtIndexPath:indexPath animated:animated];
        return self;
    };
}

// Note: -reloadData will discard any uncommitted updates (e.g. placeholders)
// discard the dataSource and delegate data and requery as necessary
- (UICollectionView * _Nonnull (^)(void))elk_reloadData
{
    return ^(void) {
        [self reloadData];
        return self;
    };
}


- (UICollectionView * _Nonnull (^)(UICollectionViewLayout * _Nonnull))elk_setViewLayout
{
    return ^(UICollectionViewLayout * layout) {
        [self setCollectionViewLayout:layout];
        return self;
    };
}

/**
 transition from one layout to another
 */
- (UICollectionView * _Nonnull (^)(UICollectionViewLayout * _Nonnull, BOOL))elk_setCollectionViewLayout
{
    return ^(UICollectionViewLayout *layout, BOOL animated) {
        [self setCollectionViewLayout:layout animated:animated];
        return self;
    };
}

- (UICollectionView * _Nonnull (^)(UICollectionViewLayout * _Nonnull, BOOL, ELKCollCompletionBlock _Nullable))elk_setCollectionViewLayoutCompletion
NS_AVAILABLE_IOS(7_0)
{
    return ^(UICollectionViewLayout *layout, BOOL animated, ELKCollCompletionBlock _Nullable completion) {
        [self setCollectionViewLayout:layout animated:animated completion:completion];
        return self;
    };
}

- (UICollectionViewTransitionLayout * _Nonnull (^)(UICollectionViewLayout * _Nonnull, UICollectionViewLayoutInteractiveTransitionCompletion _Nullable))elk_startInteractiveTransitionToCollectionViewLayout
NS_AVAILABLE_IOS(7_0)
{
    return ^(UICollectionViewLayout *layout, UICollectionViewLayoutInteractiveTransitionCompletion _Nullable completion) {
        UICollectionViewTransitionLayout *transitionLayout = [self startInteractiveTransitionToCollectionViewLayout:layout completion:completion];
        return transitionLayout;
    };
}

- (UICollectionView * _Nonnull (^)(void))elk_finishInteractiveTransition
{
    return ^(void) {
        [self finishInteractiveTransition];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(void))elk_cancelInteractiveTransition
{
    return ^(void) {
        [self cancelInteractiveTransition];
        return self;
    };
}


// Information about the current state of the collection view.
- (NSInteger (^)(void))elk_numberOfSections
{
    return ^(void) {
#if UIKIT_DEFINE_AS_PROPERTIES
        return self.numberOfSections;
#else
        return [self numberOfSections];
#endif
    };
}

// Information about the current state of the collection view.
- (NSInteger (^)(NSInteger))elk_numberOfItemsInSection
{
    return ^(NSInteger section) {
        return [self numberOfItemsInSection:section];
    };
}

- (UICollectionViewLayoutAttributes * _Nullable (^)(NSIndexPath * _Nonnull))elk_layoutAttributesForItemAtIndexPath
{
    return ^(NSIndexPath * indexPath) {
        UICollectionViewLayoutAttributes *layoutAttr = [self layoutAttributesForItemAtIndexPath:indexPath];
        return layoutAttr;
    };
}

- (UICollectionViewLayoutAttributes * _Nullable (^)(NSString * _Nonnull, NSIndexPath * _Nonnull))elk_layoutAttributesForSupplementaryElementOfKind
{
    return ^(NSString * kind, NSIndexPath * indexPath) {
        UICollectionViewLayoutAttributes *layoutAttr = [self layoutAttributesForSupplementaryElementOfKind:kind atIndexPath:indexPath];
        return layoutAttr;
    };
}

- (NSIndexPath * _Nullable (^)(CGPoint))elk_indexPathForItemAtPoint
{
    return ^(CGPoint point) {
        NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
        return indexPath;
    };
}

- (NSIndexPath * _Nullable (^)(UICollectionViewCell * _Nonnull))elk_indexPathForCell
{
    return ^(UICollectionViewCell * cell) {
        NSIndexPath *indexPath = [self indexPathForCell:cell];
        return indexPath;
    };
}

- (UICollectionViewCell * _Nullable (^)(NSIndexPath * _Nonnull))elk_cellForItemAtIndexPath
{
    return ^(NSIndexPath * indexPath) {
        UICollectionViewCell *cell = [self cellForItemAtIndexPath:indexPath];
        return cell;
    };
}

- (UICollectionReusableView * _Nullable (^)(NSString * _Nonnull, NSIndexPath * _Nonnull))elk_supplementaryViewForElementKind
{
    return ^(NSString * elementKind, NSIndexPath * indexPath) {
        UICollectionReusableView *reusableView = [self supplementaryViewForElementKind:elementKind atIndexPath:indexPath];
        return reusableView;
    };
}

- (NSArray<UICollectionReusableView *> * _Nonnull (^)(NSString * _Nonnull))elk_visibleSupplementaryViewsOfKind
{
    return ^(NSString * elementKind) {
        NSArray<UICollectionReusableView *> *supViews = [self visibleSupplementaryViewsOfKind:elementKind];
        return supViews;
    };
}

- (NSArray<NSIndexPath *> * _Nonnull (^)(NSString * _Nonnull))elk_indexPathsForVisibleSupplementaryElementsOfKind
{
    return ^(NSString * elementKind) {
        NSArray<NSIndexPath *> *elements = [self indexPathsForVisibleSupplementaryElementsOfKind:elementKind];
        return elements;
    };
}


// Interacting with the collection view.
- (UICollectionView * _Nonnull (^)(NSIndexPath * _Nonnull, UICollectionViewScrollPosition, BOOL))elk_scrollToItemAtIndexPath
{
    return ^(NSIndexPath * indexPath, UICollectionViewScrollPosition scrollPosition, BOOL animated) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
        return self;
    };
}


// These methods allow dynamic modification of the current set of items in the collection view
- (UICollectionView * _Nonnull (^)(NSIndexSet * _Nonnull))elk_insertSections
{
    return ^(NSIndexSet * sections) {
        [self insertSections:sections];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSIndexSet * _Nonnull))elk_deleteSections
{
    return ^(NSIndexSet * sections) {
        [self deleteSections:sections];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSIndexSet * _Nonnull))elk_reloadSections
{
    return ^(NSIndexSet * sections) {
        [self reloadSections:sections];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSInteger, NSInteger))elk_moveSectionToSection
{
    return ^(NSInteger section, NSInteger toSection) {
        [self moveSection:section toSection:toSection];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSArray<NSIndexPath *> * _Nonnull))elk_insertItemsAtIndexPaths
{
    return ^(NSArray<NSIndexPath *> * indexPaths) {
        [self insertItemsAtIndexPaths:indexPaths];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSArray<NSIndexPath *> * _Nonnull))elk_deleteItemsAtIndexPaths
{
    return ^(NSArray<NSIndexPath *> * indexPaths) {
        [self deleteItemsAtIndexPaths:indexPaths];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSArray<NSIndexPath *> * _Nonnull))elk_reloadItemsAtIndexPaths
{
    return ^(NSArray<NSIndexPath *> * indexPaths) {
        [self reloadItemsAtIndexPaths:indexPaths];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(NSIndexPath * _Nonnull, NSIndexPath * _Nonnull))elk_moveItemAtIndexPathToIndexPath
{
    return ^(NSIndexPath *indexPath, NSIndexPath * toIndexPath) {
        [self moveItemAtIndexPath:indexPath toIndexPath:toIndexPath];
        return self;
    };
}


/**
 allows multiple insert/delete/reload/move calls to be animated simultaneously. Nestable.
 */
- (UICollectionView * _Nonnull (^)(__attribute__((noescape)) ELKBatchUpdatesBlock _Nullable, ELKCollCompletionBlock _Nullable))elk_performBatchUpdates
{
    return ^(NS_NOESCAPE ELKBatchUpdatesBlock _Nullable updates, ELKCollCompletionBlock _Nullable completion) {
        [self performBatchUpdates:updates completion:completion];
        return self;
    };
}

// Support for reordering
// returns NO if reordering was prevented from beginning - otherwise YES
- (BOOL (^)(NSIndexPath * _Nonnull))elk_beginInteractiveMovementForItemAtIndexPath
{
    return ^(NSIndexPath * indexPath) {
        BOOL begin = [self beginInteractiveMovementForItemAtIndexPath:indexPath];
        return begin;
    };
}
- (UICollectionView * _Nonnull (^)(CGPoint))elk_updateInteractiveMovementTargetPosition
{
    return ^(CGPoint targetPosition) {
        [self updateInteractiveMovementTargetPosition:targetPosition];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(void))elk_endInteractiveMovement
{
    return ^(void) {
        [self endInteractiveMovement];
        return self;
    };
}
- (UICollectionView * _Nonnull (^)(void))elk_cancelInteractiveMovement
{
    return ^(void) {
        [self cancelInteractiveMovement];
        return self;
    };
}


// Support for Focus
// defaults to NO. If YES, when focusing on a collection view the last focused index path is focused automatically. If the collection view has never been focused, then the preferred focused index path is used.
- (UICollectionView * _Nonnull (^)(BOOL))elk_remembersLastFocusedIndexPath
{
    return ^(BOOL remembers) {
        [self setRemembersLastFocusedIndexPath:remembers];
        return self;
    };
}





@end
