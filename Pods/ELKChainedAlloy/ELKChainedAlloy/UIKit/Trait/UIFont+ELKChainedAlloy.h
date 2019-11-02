//
//  UIFont+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by wing on 2019/6/25.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (ELKChainedAlloy)


/**
 System Font Of Size

 @param fontSize Font Size
 @return         UIFont object
 */
UIFont * _Nonnull ELK_systemFontOfSize(CGFloat fontSize);


/**
 System Font Of Size And Weight

 @param fontSize Font Size
 @param weight   UIFontWeight
 @return         UIFont object
 */
UIFont * _Nonnull ELK_systemFontOfSizeWithWeight(CGFloat fontSize, UIFontWeight weight) NS_AVAILABLE_IOS(8_2);


/**
 Monospaced Digit System Font Of Size And Weight
 
 @param fontSize Font Size
 @param weight   UIFontWeight
 @return         UIFont object
 */
UIFont * _Nonnull ELK_monospacedDigitSystemFontOfSizeWeight(CGFloat fontSize, UIFontWeight weight) NS_AVAILABLE_IOS(9_0);

/**
 Bold System Font Of Size

 @param fontSize Font Size
 @return         UIFont object
 */
UIFont * _Nonnull ELK_boldSystemFontOfSize(CGFloat fontSize);


/**
 Italic System Font Of Size

 @param fontSize Font Size
 @return         UIFont object
 */
UIFont * _Nonnull ELK_italicSystemFontOfSize(CGFloat fontSize);


/**
 Returns an instance of the font associated with the text style and scaled appropriately for the user's selected content size category. See UIFontDescriptor.h for the complete list.

 @param style  UIFontTextStyle
 @return       UIFont object
 */
UIFont * _Nonnull ELK_preferredFontForTextStyle(UIFontTextStyle style) NS_AVAILABLE_IOS(7_0);


/**
 Returns an instance of the font associated with the text style and scaled appropriately for the content size category defined in the trait collection.

 @param style           UIFontTextStyle
 @param traitCollection UITraitCollection
 @return                UIFont object
 */
UIFont * _Nonnull ELK_preferredFontForTextStyleWithTrait(UIFontTextStyle _Nonnull style, UITraitCollection * _Nullable traitCollection) NS_AVAILABLE_IOS(10_0) __WATCHOS_PROHIBITED;


/**
 Returns a font using CSS name matching semantics.
 
 @param fontName Font Name
 @param fontSize Font Size
 @return         UIFont Object
 */
UIFont * _Nullable ELK_fontWithNameAndSize(NSString * _Nonnull fontName, CGFloat fontSize);


/**
 Returns an array of font names for the specified family name
 */

/**
 Returns an array of font names for the specified family name

 @param familyName Family Name
 @return           Font Names List
 */
NSArray <NSString *> * _Nonnull ELK_fontNamesForFamilyName(NSString * _Nonnull familyName);


/**
 Create a new font that is identical to the current font except the specified size
 */
@property (nonatomic, copy, readonly) UIFont * _Nonnull (^elk_fontWithSize)(CGFloat fontSize);


/**
 Returns a font using CSS name matching semantics.

 @param descriptor UIFontDescriptor
 @param pointSize  Point Size
 @return           Font Object
 */
UIFont * _Nonnull ELK_fontWithDescriptorAndSize(UIFontDescriptor * _Nonnull descriptor, CGFloat pointSize) NS_AVAILABLE_IOS(7_0);


#ifndef UIKIT_DEFINE_AS_PROPERTIES
/**
 Returns a font descriptor which describes the font.
 */
@property (nonatomic, copy, readonly) UIFontDescriptor * _Nonnull (^elk_fontDescriptor)(void) NS_AVAILABLE_IOS(7_0);
#endif





@end

NS_ASSUME_NONNULL_END
