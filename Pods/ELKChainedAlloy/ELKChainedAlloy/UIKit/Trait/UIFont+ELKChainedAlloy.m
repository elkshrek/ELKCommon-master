//
//  UIFont+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by wing on 2019/6/25.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIFont+ELKChainedAlloy.h"

@implementation UIFont (ELKChainedAlloy)


/**
 System Font Of Size
 */
UIFont * _Nonnull ELK_systemFontOfSize(CGFloat fontSize)
{
    return [UIFont systemFontOfSize:fontSize];
}


/**
 System Font Of Size And Weight

 @param fontSize Font Size
 @param weight   UIFontWeight
 @return         UIFont object
 */
UIFont * _Nonnull ELK_systemFontOfSizeWithWeight(CGFloat fontSize, UIFontWeight weight) NS_AVAILABLE_IOS(8_2)
{
    return [UIFont systemFontOfSize:fontSize weight:weight];
}

/**
 Monospaced Digit System Font Of Size And Weight
 
 @param fontSize Font Size
 @param weight   UIFontWeight
 @return         UIFont object
 */
UIFont * _Nonnull ELK_monospacedDigitSystemFontOfSizeWeight(CGFloat fontSize, UIFontWeight weight) NS_AVAILABLE_IOS(9_0)
{
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:weight];
}


/**
 Bold System Font Of Size
 */
UIFont * _Nonnull ELK_boldSystemFontOfSize(CGFloat fontSize)
{
    return [UIFont boldSystemFontOfSize:fontSize];
}


/**
 Italic System Font Of Size
 */
UIFont * _Nonnull ELK_italicSystemFontOfSize(CGFloat fontSize)
{
    return [UIFont italicSystemFontOfSize:fontSize];
}


/**
 Returns an instance of the font associated with the text style and scaled appropriately for the user's selected content size category. See UIFontDescriptor.h for the complete list.     UIFont object
 */
UIFont * _Nonnull ELK_preferredFontForTextStyle(UIFontTextStyle style) NS_AVAILABLE_IOS(7_0)
{
    return [UIFont preferredFontForTextStyle:style];
}

/**
 Returns an instance of the font associated with the text style and scaled appropriately for the content size category defined in the trait collection.
 */
UIFont * _Nonnull ELK_preferredFontForTextStyleWithTrait(UIFontTextStyle _Nonnull style, UITraitCollection * _Nullable traitCollection) NS_AVAILABLE_IOS(10_0) __WATCHOS_PROHIBITED
{
    return [UIFont preferredFontForTextStyle:style compatibleWithTraitCollection:traitCollection];
}


/**
 Returns a font using CSS name matching semantics.
 */
UIFont * _Nullable ELK_fontWithNameAndSize(NSString * _Nonnull fontName, CGFloat fontSize)
{
    return [UIFont fontWithName:fontName size:fontSize];
}


/**
 Returns an array of font names for the specified family name
 */
NSArray <NSString *> * _Nonnull ELK_fontNamesForFamilyName(NSString * _Nonnull familyName)
{
    return [UIFont fontNamesForFamilyName:familyName];
}


/**
 Create a new font that is identical to the current font except the specified size
 */
- (UIFont * _Nonnull (^)(CGFloat))elk_fontWithSize
{
    return ^(CGFloat fontSize) {
        return [self fontWithSize:fontSize];
    };
}


/**
 Returns a font using CSS name matching semantics.
 */
UIFont * _Nonnull ELK_fontWithDescriptorAndSize(UIFontDescriptor * _Nonnull descriptor, CGFloat pointSize) NS_AVAILABLE_IOS(7_0)
{
    return [UIFont fontWithDescriptor:descriptor size:pointSize];
}


#ifndef UIKIT_DEFINE_AS_PROPERTIES
/**
 Returns a font descriptor which describes the font.
 */
- (UIFontDescriptor * _Nonnull (^)(void))elk_fontDescriptor NS_AVAILABLE_IOS(7_0)
{
    return ^(void) {
        return [self fontDescriptor];
    };
}
#endif




@end
