//
//  UITableViewCell+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by wing on 2019/9/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UITableViewCell+ELKChainedAlloy.h"

@implementation UITableViewCell (ELKChainedAlloy)


/**
 default is UITableViewCellSelectionStyleDefault.
 */
- (UITableViewCell * _Nonnull (^)(UITableViewCellSelectionStyle))elk_setSelectionStyle
{
    return ^(UITableViewCellSelectionStyle style) {
        [self setSelectionStyle:style];
        return self;
    };
}

/**
 animate between regular and selected state
 */
- (UITableViewCell * _Nonnull (^)(BOOL, BOOL))elk_setSelectedAnimated
{
    return ^(BOOL selected, BOOL animated) {
        [self setSelected:selected animated:animated];
        return self;
    };
}

/**
 animate between regular and highlighted state
 */
- (UITableViewCell * _Nonnull (^)(BOOL, BOOL))elk_setHighlightedAnimated
{
    return ^(BOOL highlighted, BOOL animated) {
        [self setHighlighted:highlighted animated:animated];
        return self;
    };
}

/**
 default is NO
 */
- (UITableViewCell * _Nonnull (^)(BOOL))elk_showsReorderControl
{
    return ^(BOOL shows) {
        [self setShowsReorderControl:shows];
        return self;
    };
}

/**
 default is YES.  This is unrelated to the indentation level below.
 */
- (UITableViewCell * _Nonnull (^)(BOOL))elk_shouldIndentWhileEditing
{
    return ^(BOOL editing) {
        [self setShouldIndentWhileEditing:editing];
        return self;
    };
}

/**
 default is UITableViewCellAccessoryNone. use to set standard type
 */
- (UITableViewCell * _Nonnull (^)(UITableViewCellAccessoryType))elk_setAccessoryType
{
    return ^(UITableViewCellAccessoryType accType) {
        [self setAccessoryType:accType];
        return self;
    };
}

/**
 if set, use custom view. ignore accessoryType. tracks if enabled can calls accessory action
 */
- (UITableViewCell * _Nonnull (^)(UIView * _Nullable))elk_setAccessoryView
{
    return ^(UIView *_Nullable accessoryView) {
        [self setAccessoryView:accessoryView];
        return self;
    };
}

/**
 default is UITableViewCellAccessoryNone. use to set standard type
 */
- (UITableViewCell * _Nonnull (^)(UITableViewCellAccessoryType))elk_setEditingAccessoryType
{
    return ^(UITableViewCellAccessoryType accType) {
        [self setEditingAccessoryType:accType];
        return self;
    };
}

/**
 if set, use custom view. ignore editingAccessoryType. tracks if enabled can calls accessory action
 */
- (UITableViewCell * _Nonnull (^)(UIView * _Nullable))elk_setEditingAccessoryView
{
    return ^(UIView *_Nullable editingAccView) {
        [self setEditingAccessoryView:editingAccView];
        return self;
    };
}

/**
 adjust content indent. default is 0
 */
- (UITableViewCell * _Nonnull (^)(NSInteger))elk_setIndentationLevel
{
    return ^(NSInteger indentationLevel) {
        [self setIndentationLevel:indentationLevel];
        return self;
    };
}

/**
 width for each level. default is 10.0
 */
- (UITableViewCell * _Nonnull (^)(CGFloat))elk_setIndentationWidth
{
    return ^(CGFloat indentationWidth) {
        [self setIndentationWidth:indentationWidth];
        return self;
    };
}

/**
 allows customization of the separator frame
 */
- (UITableViewCell * _Nonnull (^)(UIEdgeInsets))elk_setSeparatorInset NS_AVAILABLE_IOS(7_0) UI_APPEARANCE_SELECTOR __TVOS_PROHIBITED
{
    return ^(UIEdgeInsets separatorInset) {
        [self setSeparatorInset:separatorInset];
        return self;
    };
}

/**
 show appropriate edit controls (+/- & reorder). By default -setEditing: calls setEditing:animated: with NO for animated.
 */
- (UITableViewCell * _Nonnull (^)(BOOL, BOOL))elk_setEditingAnimated
{
    return ^(BOOL editing, BOOL animated) {
        [self setEditing:editing animated:animated];
        return self;
    };
}

/**
 set focus style
 */
- (UITableViewCell * _Nonnull (^)(UITableViewCellFocusStyle))elk_setFocusStyle NS_AVAILABLE_IOS(9_0) UI_APPEARANCE_SELECTOR
{
    return ^(UITableViewCellFocusStyle focusStyle) {
        [self setFocusStyle:focusStyle];
        return self;
    };
}

/**
 Controls whether the cell in the table view allows user interaction once it is part of a drag (UITableViewCellDragStateDragging).
 Default is NO.
 */
- (UITableViewCell * _Nonnull (^)(BOOL))elk_setUserInteractionEnabledWhileDragging
{
    return ^(BOOL enable) {
        [self setUserInteractionEnabledWhileDragging:enable];
        return self;
    };
}




@end
