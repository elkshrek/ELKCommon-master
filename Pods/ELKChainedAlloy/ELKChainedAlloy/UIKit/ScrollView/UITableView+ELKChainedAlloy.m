//
//  UITableView+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UITableView+ELKChainedAlloy.h"

@implementation UITableView (ELKChainedAlloy)



/**
 make a UITableView, return a new object
 
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_make
{
    UITableView *make = [[self alloc] init];
    return make;
}

/**
 make a UITableView, return a new object
 
 @param block block
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITableView * _Nonnull make))block
{
    UITableView *make = [[self alloc] init];
    if (block) {
        block(make);
    }
    return make;
}

/**
 make a UITableView, return a new object
 
 @param style UITableViewStyle
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeStyle:(UITableViewStyle)style
{
    UITableView *make = [[self alloc] initWithFrame:CGRectZero style:style];
    return make;
}

/**
 make a UITableView, return a new object
 
 @param style UITableViewStyle
 @param block block
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeStyle:(UITableViewStyle)style block:(void (^ _Nullable)(UITableView * _Nonnull make))block
{
    UITableView *make = [[self alloc] initWithFrame:CGRectZero style:style];
    if (block) {
        block(make);
    }
    return make;
}


/**
 Make A UITableView, return a new object
 
 @param style UITableViewStyle
 @return Object Of UITableView
 */
UITableView * _Nonnull ELK_makeTableView(UITableViewStyle style)
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    return tableView;
}

/**
 Make A UITableView, return a new object
 
 @param style UITableViewStyle
 @param block block
 @return Object Of UITableView
 */
UITableView * _Nonnull ELK_makeTableViewBlock(UITableViewStyle style, ELKTableViewMakeBlock _Nullable block)
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    if (block) {
        block(tableView);
    }
    return tableView;
}


/**
 set dataSource
 */
- (UITableView * _Nonnull (^)(id<UITableViewDataSource> _Nullable))elk_setDataSource
{
    return ^(id<UITableViewDataSource> _Nullable dataSource) {
        [self setDataSource:dataSource];
        return self;
    };
}

/**
 set delegate
 */
- (UITableView * _Nonnull (^)(id<UITableViewDelegate> _Nullable))elk_setDelegate
{
    return ^(id<UITableViewDelegate> _Nullable delegate) {
        [self setDelegate:delegate];
        return self;
    };
}

/**
 set table header view
 */
- (UITableView * _Nonnull (^)(UIView * _Nullable))elk_setTableHeaderView
{
    return ^(UIView * _Nullable tableHeaderView) {
        [self setTableHeaderView:tableHeaderView];
        return self;
    };
}

/**
 set table footer view
 */
- (UITableView * _Nonnull (^)(UIView * _Nullable))elk_setTableFooterView
{
    return ^(UIView * _Nullable tableFooterView) {
        [self setTableFooterView:tableFooterView];
        return self;
    };
}

/**
 set row height
 */
- (UITableView * _Nonnull (^)(CGFloat))elk_setRowHeight
{
    return ^(CGFloat rowHeight) {
        [self setRowHeight:rowHeight];
        return self;
    };
}

/**
 set section header height
 */
- (UITableView * _Nonnull (^)(CGFloat))elk_setSectionHeadHeight
{
    return ^(CGFloat headHeight) {
        [self setSectionHeaderHeight:headHeight];
        return self;
    };
}

/**
 set section footer height
 */
- (UITableView * _Nonnull (^)(CGFloat))elk_setSectionFootHeight
{
    return ^(CGFloat footHeight) {
        [self setSectionFooterHeight:footHeight];
        return self;
    };
}

/**
 set estimated row height
 */
- (UITableView * _Nonnull (^)(CGFloat))elk_setEstimatedRowHeight
NS_AVAILABLE_IOS(7_0)
{
    return ^(CGFloat estRowHeight) {
        [self setEstimatedRowHeight:estRowHeight];
        return self;
    };
}

/**
 set section index color
 */
- (UITableView * _Nonnull (^)(UIColor * _Nullable))elk_setSectionIndexColor
NS_AVAILABLE_IOS(6_0)
{
    return ^(UIColor * _Nullable color) {
        [self setSectionIndexColor:color];
        return self;
    };
}

/**
 set section index backgroud color
 */
- (UITableView * _Nonnull (^)(UIColor * _Nullable))elk_setSectionIndexBgColor
NS_AVAILABLE_IOS(7_0)
{
    return ^(UIColor * _Nullable color) {
        [self setSectionIndexBackgroundColor:color];
        return self;
    };
}

/**
 set section index tracking background color
 */
- (UITableView * _Nonnull (^)(UIColor * _Nullable))elk_setSectionIndexTrackBgColor
NS_AVAILABLE_IOS(6_0)
{
    return ^(UIColor * _Nullable color) {
        [self setSectionIndexTrackingBackgroundColor:color];
        return self;
    };
}

/**
 set separator style
 */
- (UITableView * _Nonnull (^)(UITableViewCellSeparatorStyle))elk_setSeparatorStyle
{
    return ^(UITableViewCellSeparatorStyle sepStyle) {
        [self setSeparatorStyle:sepStyle];
        return self;
    };
}

/**
 set separator color
 */
- (UITableView * _Nonnull (^)(UIColor * _Nullable))elk_setSeparatorColor
{
    return ^(UIColor * _Nullable color) {
        [self setSeparatorColor:color];
        return self;
    };
}

/**
 set separator inset
 */
- (UITableView * _Nonnull (^)(UIEdgeInsets))elk_setSeparatInset
NS_AVAILABLE_IOS(7_0)
{
    return ^(UIEdgeInsets inset) {
        [self setSeparatorInset:inset];
        return self;
    };
}

/**
 register class for cell reuse identifier
 */
- (UITableView * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))elk_registerClassForCell
NS_AVAILABLE_IOS(6_0)
{
    return ^(Class cellClass, NSString * _Nonnull identifier) {
        [self registerClass:cellClass forCellReuseIdentifier:identifier];
        return self;
    };
}

/**
 register nib for cell reuse identifier
 */
- (UITableView * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull))elk_registerNibForCell
NS_AVAILABLE_IOS(5_0)
{
    return ^(UINib * _Nonnull nib, NSString * _Nonnull identifier) {
        [self registerNib:nib forCellReuseIdentifier:identifier];
        return self;
    };
}

/**
 dequeue Reusable Cell With Identifier
 */
- (__kindof UITableViewCell * _Nonnull (^)(NSString * _Nonnull))elk_dequeueReusableCell
{
    return ^(NSString * _Nonnull identifier) {
        UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
        return cell;
    };
}

/**
 dequeue Reusable Cell With Identifier For IndexPath
 */
- (__kindof UITableViewCell * _Nonnull (^)(NSString * _Nonnull, NSIndexPath * _Nonnull))elk_dequeueReusableCellForIndexPath
NS_AVAILABLE_IOS(6_0)
{
    return ^(NSString * _Nonnull identifier, NSIndexPath *_Nonnull indexPath) {
        UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        return cell;
    };
}

/**
 register nib for header footer view reuse identifier
 */
- (UITableView * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull))elk_registerNibForHeadFootView
NS_AVAILABLE_IOS(6_0)
{
    return ^(UINib * _Nonnull nib, NSString * _Nonnull identifier) {
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

/**
 register class for header footer view reuse identifier
 */
- (UITableView * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))elk_registerClassForHeadFootView
NS_AVAILABLE_IOS(6_0)
{
    return ^(Class hfClass, NSString * _Nonnull identifier) {
        [self registerClass:hfClass forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

/**
 like dequeueReusableCellWithIdentifier:, but for headers/footers
 */
- (__kindof UITableViewHeaderFooterView * _Nonnull (^)(NSString * _Nonnull))elk_dequeueReusableHeaderFooterView NS_AVAILABLE_IOS(6_0)
{
    return ^(NSString *identifier) {
        UITableViewHeaderFooterView *headerFooterView = [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        return headerFooterView;
    };
}

/**
 set background view
 */
- (UITableView * _Nonnull (^)(UIView * _Nullable))elk_setBackgroundView
{
    return ^(UIView * _Nullable backView) {
        [self setBackgroundView:backView];
        return self;
    };
}

/**
 set editing
 */
- (UITableView * _Nonnull (^)(BOOL))elk_setEditing
{
    return ^(BOOL editing) {
        [self setEditing:editing];
        return self;
    };
}

/**
 set editing animated
 */
- (UITableView * _Nonnull (^)(BOOL, BOOL))elk_setEditingAnimated
{
    return ^(BOOL editing, BOOL animate) {
        [self setEditing:editing animated:animate];
        return self;
    };
}

/**
 set allows selection
 */
- (UITableView * _Nonnull (^)(BOOL))elk_setAllowsSelection
{
    return ^(BOOL allowSel) {
        [self setAllowsSelection:allowSel];
        return self;
    };
}

/**
 set allows multiple selection
 */
- (UITableView * _Nonnull (^)(BOOL))elk_setAllowsMultSelect
NS_AVAILABLE_IOS(5_0)
{
    return ^(BOOL AllowMult) {
        [self setAllowsMultipleSelection:AllowMult];
        return self;
    };
}

/**
 set allows selection during editing
 */
- (UITableView * _Nonnull (^)(BOOL))elk_setAllowsSelectDuringEdit
{
    return ^(BOOL allowDuringEdit) {
        [self setAllowsSelectionDuringEditing:allowDuringEdit];
        return self;
    };
}

/**
 set allows multiple selection during editing
 */
- (UITableView * _Nonnull (^)(BOOL))elk_setAllowsMultSelectDuringEdit
NS_AVAILABLE_IOS(5_0)
{
    return ^(BOOL allowMult) {
        [self setAllowsMultipleSelectionDuringEditing:allowMult];
        return self;
    };
}


@end
