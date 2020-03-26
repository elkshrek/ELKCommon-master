//
//  UITableView+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ELKTableViewMakeBlock)(UITableView * _Nonnull make);

@interface UITableView (ELKChainedAlloy)


/**
 make a UITableView, return a new object
 
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_make;

/**
 make a UITableView, return a new object
 
 @param block block
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeBlock:(void (^ _Nullable)(UITableView * _Nonnull make))block;

/**
 make a UITableView, return a new object

 @param style UITableViewStyle
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeStyle:(UITableViewStyle)style;

/**
 make a UITableView, return a new object

 @param style UITableViewStyle
 @param block block
 @return a new UITableView
 */
+ (UITableView * _Nonnull)elk_makeStyle:(UITableViewStyle)style block:(void (^ _Nullable)(UITableView * _Nonnull make))block;


/**
 Make A UITableView, return a new object

 @param style UITableViewStyle
 @return Object Of UITableView
 */
UITableView * _Nonnull ELK_makeTableView(UITableViewStyle style);

/**
 Make A UITableView, return a new object

 @param style UITableViewStyle
 @param block block
 @return Object Of UITableView
 */
UITableView * _Nonnull ELK_makeTableViewBlock(UITableViewStyle style, ELKTableViewMakeBlock _Nullable block);


/**
 set dataSource
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setDataSource)(id<UITableViewDataSource> _Nullable dataSource);

/**
 set delegate
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setDelegate)(id<UITableViewDelegate> _Nullable delegate);

/**
 set table header view
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setTableHeaderView)(UIView * _Nullable tableHeaderView);

/**
 set table footer view
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setTableFooterView)(UIView * _Nullable tableFooterView);

/**
 set row height
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setRowHeight)(CGFloat rowHeight);

/**
 set section header height
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSectionHeadHeight)(CGFloat headHeight);

/**
 set section footer height
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSectionFootHeight)(CGFloat footHeight);

/**
 set estimated row height
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setEstimatedRowHeight)(CGFloat estRowHeight) NS_AVAILABLE_IOS(7_0);

/**
 set section index color
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSectionIndexColor)(UIColor * _Nullable color) NS_AVAILABLE_IOS(6_0);

/**
 set section index backgroud color
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSectionIndexBgColor)(UIColor * _Nullable color) NS_AVAILABLE_IOS(7_0);

/**
 set section index tracking background color
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSectionIndexTrackBgColor)(UIColor * _Nullable color) NS_AVAILABLE_IOS(6_0);

/**
 set separator style
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSeparatorStyle)(UITableViewCellSeparatorStyle sepStyle);

/**
 set separator color
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSeparatorColor)(UIColor * _Nullable color);

/**
 set separator inset
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setSeparatInset)(UIEdgeInsets inset) NS_AVAILABLE_IOS(7_0);

/**
 register class for cell reuse identifier
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_registerClassForCell)(Class cellClass, NSString * _Nonnull identifier) NS_AVAILABLE_IOS(6_0);

/**
 register nib for cell reuse identifier
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_registerNibForCell)(UINib * _Nonnull nib, NSString * _Nonnull identifier) NS_AVAILABLE_IOS(5_0);

/**
 dequeue Reusable Cell With Identifier
 */
@property (nonatomic, copy, readonly) __kindof UITableViewCell * _Nonnull (^elk_dequeueReusableCell)(NSString * _Nonnull identifier);

/**
 dequeue Reusable Cell With Identifier For IndexPath
 */
@property (nonatomic, copy, readonly) __kindof UITableViewCell * _Nonnull (^elk_dequeueReusableCellForIndexPath)(NSString * _Nonnull identifier, NSIndexPath *_Nonnull indexPath) NS_AVAILABLE_IOS(6_0);

/**
 register nib for header footer view reuse identifier
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_registerNibForHeadFootView)(UINib * _Nonnull nib, NSString * _Nonnull identifier) NS_AVAILABLE_IOS(6_0);

/**
 register class for header footer view reuse identifier
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_registerClassForHeadFootView)(Class hfClass, NSString * _Nonnull identifier) NS_AVAILABLE_IOS(6_0);

/**
 like dequeueReusableCellWithIdentifier:, but for headers/footers
 */
@property (nonatomic, copy, readonly) __kindof UITableViewHeaderFooterView * _Nonnull (^elk_dequeueReusableHeaderFooterView)(NSString *identifier) NS_AVAILABLE_IOS(6_0);

/**
 set background view
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setBackgroundView)(UIView * _Nullable backView);

/**
 set editing
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setEditing)(BOOL editing);

/**
 set editing animated
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setEditingAnimated)(BOOL editing, BOOL animate);

/**
 set allows selection
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setAllowsSelection)(BOOL allowSel);

/**
 set allows multiple selection
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setAllowsMultSelect)(BOOL AllowMult) NS_AVAILABLE_IOS(5_0);

/**
 set allows selection during editing
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setAllowsSelectDuringEdit)(BOOL allowDuringEdit);

/**
 set allows multiple selection during editing
 */
@property (nonatomic, strong, readonly) UITableView * _Nonnull (^elk_setAllowsMultSelectDuringEdit)(BOOL allowMult) NS_AVAILABLE_IOS(5_0);





@end

NS_ASSUME_NONNULL_END
