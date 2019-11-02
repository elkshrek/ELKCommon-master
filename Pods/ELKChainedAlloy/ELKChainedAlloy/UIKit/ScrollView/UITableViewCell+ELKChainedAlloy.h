//
//  UITableViewCell+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by wing on 2019/9/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (ELKChainedAlloy)


/**
 default is UITableViewCellSelectionStyleDefault.
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setSelectionStyle)(UITableViewCellSelectionStyle style);

/**
 animate between regular and selected state
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setSelectedAnimated)(BOOL selected, BOOL animated);

/**
 animate between regular and highlighted state
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setHighlightedAnimated)(BOOL highlighted, BOOL animated);

/**
 default is NO
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_showsReorderControl)(BOOL shows);

/**
 default is YES.  This is unrelated to the indentation level below.
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_shouldIndentWhileEditing)(BOOL editing);

/**
 default is UITableViewCellAccessoryNone. use to set standard type
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setAccessoryType)(UITableViewCellAccessoryType accType);

/**
 if set, use custom view. ignore accessoryType. tracks if enabled can calls accessory action
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setAccessoryView)(UIView *_Nullable accessoryView);

/**
 default is UITableViewCellAccessoryNone. use to set standard type
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setEditingAccessoryType)(UITableViewCellAccessoryType accType);

/**
 if set, use custom view. ignore editingAccessoryType. tracks if enabled can calls accessory action
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setEditingAccessoryView)(UIView *_Nullable editingAccView);

/**
 adjust content indent. default is 0
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setIndentationLevel)(NSInteger indentationLevel);

/**
 width for each level. default is 10.0
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setIndentationWidth)(CGFloat indentationWidth);

/**
 allows customization of the separator frame
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setSeparatorInset)(UIEdgeInsets separatorInset) NS_AVAILABLE_IOS(7_0) UI_APPEARANCE_SELECTOR __TVOS_PROHIBITED;

/**
 show appropriate edit controls (+/- & reorder). By default -setEditing: calls setEditing:animated: with NO for animated.
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setEditingAnimated)(BOOL editing, BOOL animated);

/**
 set focus style
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setFocusStyle)(UITableViewCellFocusStyle focusStyle) NS_AVAILABLE_IOS(9_0) UI_APPEARANCE_SELECTOR;

/**
 Controls whether the cell in the table view allows user interaction once it is part of a drag (UITableViewCellDragStateDragging).
 Default is NO.
 */
@property (nonatomic, copy, readonly) UITableViewCell * _Nonnull (^elk_setUserInteractionEnabledWhileDragging)(BOOL enable) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);




@end

NS_ASSUME_NONNULL_END
