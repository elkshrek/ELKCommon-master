//
//  NSString+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import "NSString+ELKChainedAlloy.h"

@implementation NSString (ELKChainedAlloy)


//- (NSString * _Nonnull (^)(NSString * _Nonnull, int))elk_stringByAppendingFormat
//{
//    return ^(NSString * formatt, __attribute__((format(__NSString__, 1, 2))) moreParams) {
//        return [self stringByAppendingFormat:formatt, moreParams];
//    };
//}



/**
 compare
 */
- (NSComparisonResult (^)(NSString * _Nonnull))elk_compare
{
    return ^(NSString * _Nonnull string) {
        return [self compare:string];
    };
}

/**
 compare options
 */
- (NSComparisonResult (^)(NSString * _Nonnull, NSStringCompareOptions))elk_compareOptions
{
    return ^(NSString * _Nonnull string, NSStringCompareOptions mask) {
        return [self compare:string options:mask];
    };
}

/**
 compare options range
 */
- (NSComparisonResult (^)(NSString * _Nonnull, NSStringCompareOptions, NSRange))elk_compareOptionsRange
{
    return ^(NSString * _Nonnull string, NSStringCompareOptions mask, NSRange range) {
        return [self compare:string options:mask range:range];
    };
}

/**
 compare options range locale
 */
- (NSComparisonResult (^)(NSString * _Nonnull, NSStringCompareOptions, NSRange, id _Nullable))elk_compareOptionsRangeLocale
{
    return ^(NSString * _Nonnull string, NSStringCompareOptions mask, NSRange range, id _Nullable locale) {
        return [self compare:string options:mask range:range locale:locale];
    };
}

/**
 case insensitive compare
 */
- (NSComparisonResult (^)(NSString * _Nonnull))elk_caseInsensitiveCompare
{
    return ^(NSString * _Nonnull string) {
        return [self caseInsensitiveCompare:string];
    };
}

/**
 localized compare
 */
- (NSComparisonResult (^)(NSString * _Nonnull))elk_localizedCompare
{
    return ^(NSString * _Nonnull string) {
        return [self localizedCompare:string];
    };
}

/**
 localized case insensitive compare
 */
- (NSComparisonResult (^)(NSString * _Nonnull))elk_localizedCaseInsensitiveCompare
{
    return ^(NSString * _Nonnull string) {
        return [self localizedCaseInsensitiveCompare:string];
    };
}

/**
 localized standard compare
 */
- (NSComparisonResult (^)(NSString * _Nonnull))elk_localizedStandardCompare
{
    return ^(NSString * _Nonnull string) {
        return [self localizedStandardCompare:string];
    };
}

/**
 check if is equal to string
 */
- (BOOL (^)(NSString * _Nonnull))elk_isEqualToStr
{
    return ^(NSString * _Nonnull string) {
        return [self isEqualToString:string];
    };
}

/**
 has prefix
 */
- (BOOL (^)(NSString * _Nonnull))elk_hasPrefix
{
    return ^(NSString * _Nonnull str) {
        return [self hasPrefix:str];
    };
}

/**
 has suffix
 */
- (BOOL (^)(NSString * _Nonnull))elk_hasSuffix
{
    return ^(NSString * _Nonnull str) {
        return [self hasSuffix:str];
    };
}

/**
 common prefix with string options
 */
- (NSString * _Nonnull (^)(NSString * _Nonnull, NSStringCompareOptions))elk_commonPrefixWithStringOption
{
    return ^(NSString * _Nonnull str, NSStringCompareOptions mask) {
        return [self commonPrefixWithString:str options:mask];
    };
}

/**
 contains string
 */
- (BOOL (^)(NSString * _Nonnull))elk_containsString
{
    return ^(NSString * _Nonnull str) {
        return [self containsString:str];
    };
}

/**
 localized case insensitive contains string
 */
- (BOOL (^)(NSString * _Nonnull))elk_localizedCaseInsensitiveContainsString
{
    return ^(NSString * _Nonnull str) {
        return [self localizedCaseInsensitiveContainsString:str];
    };
}

/**
 localized standard contains string
 */
- (BOOL (^)(NSString * _Nonnull))elk_localizedStandardContainsString
{
    return ^(NSString * _Nonnull str) {
        return [self localizedStandardContainsString:str];
    };
}

/**
 localized standard range of string
 */
- (NSRange (^)(NSString * _Nonnull))elk_localizedStandardRangeOfString
{
    return ^(NSString * _Nonnull str) {
        return [self localizedStandardRangeOfString:str];
    };
}

/**
 range of string
 */
- (NSRange (^)(NSString * _Nonnull))elk_rangeOfString
{
    return ^(NSString * _Nonnull searchString) {
        return [self rangeOfString:searchString];
    };
}

/**
 range of string options
 */
- (NSRange (^)(NSString * _Nonnull, NSStringCompareOptions))elk_rangeOfStringOptions
{
    return ^(NSString * _Nonnull searchString, NSStringCompareOptions mask) {
        return [self rangeOfString:searchString options:mask];
    };
}

/**
 range of string options range
 */
- (NSRange (^)(NSString * _Nonnull, NSStringCompareOptions, NSRange))elk_rangeOfStringOptionRange
{
    return ^(NSString * _Nonnull searchString, NSStringCompareOptions mask, NSRange range) {
        return [self rangeOfString:searchString options:mask range:range];
    };
}

/**
 range of string options range locale
 */
- (NSRange (^)(NSString * _Nonnull, NSStringCompareOptions, NSRange, NSLocale * _Nullable))elk_rangeOfStringOptionRangeLocale
{
    return ^(NSString * _Nonnull searchString, NSStringCompareOptions mask, NSRange range, NSLocale * _Nullable locale) {
        return [self rangeOfString:searchString options:mask range:range locale:locale];
    };
}

/**
 range of character from set
 */
- (NSRange (^)(NSCharacterSet * _Nonnull))elk_rangeOfCharacterFromSet
{
    return ^(NSCharacterSet * _Nonnull searchSet) {
        return [self rangeOfCharacterFromSet:searchSet];
    };
}

/**
 range of character from set options
 */
- (NSRange (^)(NSCharacterSet * _Nonnull, NSStringCompareOptions))elk_rangeOfCharacterFromSetOption
{
    return ^(NSCharacterSet * _Nonnull searchSet, NSStringCompareOptions mask) {
        return [self rangeOfCharacterFromSet:searchSet options:mask];
    };
}

/**
 range of character from set options range
 */
- (NSRange (^)(NSCharacterSet * _Nonnull, NSStringCompareOptions, NSRange))elk_rangeOfCharacterFromSetOptionRange
{
    return ^(NSCharacterSet * _Nonnull searchSet, NSStringCompareOptions mask, NSRange range) {
        return [self rangeOfCharacterFromSet:searchSet options:mask range:range];
    };
}

/**
 range of composed character sequence at index
 */
- (NSRange (^)(NSUInteger))elk_rangeOfComposedCharacterSequenceAtIndex
{
    return ^(NSUInteger index) {
        return [self rangeOfComposedCharacterSequenceAtIndex:index];
    };
}

/**
 range of composed character sequences for range
 */
- (NSRange (^)(NSRange))elk_rangeOfComposedCharacterSequencesForRange
{
    return ^(NSRange range) {
        return [self rangeOfComposedCharacterSequencesForRange:range];
    };
}

/**
 string by appending string
 */
- (NSString * _Nonnull (^)(NSString * _Nonnull))elk_stringByAppendingString
{
    return ^(NSString * _Nonnull aString) {
        return [self stringByAppendingString:aString];
    };
}


/**
 upperace string with locale
 */
- (NSString * _Nonnull (^)(NSLocale * _Nullable))elk_uppercaseStringWithLocale
NS_AVAILABLE_IOS(6_0)
{
    return ^(NSLocale * _Nullable locale) {
        return [self uppercaseStringWithLocale:locale];
    };
}

/**
 lowercase String With Locale
 */
- (NSString * _Nonnull (^)(NSLocale * _Nullable))elk_lowercaseStringWithLocale
NS_AVAILABLE_IOS(6_0)
{
    return ^(NSLocale * _Nullable locale) {
        return [self lowercaseStringWithLocale:locale];
    };
}

/**
 capitalized String With Locale
 */
- (NSString * _Nonnull (^)(NSLocale * _Nullable))elk_capitalizedStringWithLocale
NS_AVAILABLE_IOS(6_0)
{
    return ^(NSLocale * _Nullable locale) {
        return [self capitalizedStringWithLocale:locale];
    };
}

/**
 substring from index
 */
- (NSString * _Nonnull (^)(NSUInteger))elk_substringFromIndex
{
    return ^(NSUInteger from) {
        return [self substringFromIndex:from];
    };
}

/**
 substring to index
 */
- (NSString * _Nonnull (^)(NSUInteger))elk_substringToIndex
{
    return ^(NSUInteger to) {
        return [self substringToIndex:to];
    };
}

/**
 substring with range
 */
- (NSString * _Nonnull (^)(NSRange))elk_substringWithRange
{
    return ^(NSRange range) {
        return [self substringWithRange:range];
    };
}


#pragma mark *** Finding lines, sentences, words, etc ***

/**
 Line Range For Range
 */
- (NSRange (^)(NSRange))elk_lineRangeForRange
{
    return ^(NSRange range) {
        return [self lineRangeForRange:range];
    };
}

/**
 Paragraph Range For Range
 */
- (NSRange (^)(NSRange))elk_paragraphRangeForRange
{
    return ^(NSRange range) {
        return [self paragraphRangeForRange:range];
    };
}

/**
 In the enumerate methods, the blocks will be invoked inside an autorelease pool, so any values assigned inside the block should be retained.
 */
- (void (^)(NSRange, NSStringEnumerationOptions, ELKEnumSubStringBlock _Nonnull))elk_enumerateSubstrInRangeOptions API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0))
{
    return ^(NSRange range, NSStringEnumerationOptions opts, ELKEnumSubStringBlock usingBlock) {
        [self enumerateSubstringsInRange:range options:opts usingBlock:usingBlock];
    };
}
- (void (^)(ELKEnumerateLinesBlock _Nonnull))elk_enumerateLinesUsingBlock
{
    return ^(ELKEnumerateLinesBlock usingBlock) {
        [self enumerateLinesUsingBlock:usingBlock];
    };
}






@end
