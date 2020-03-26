//
//  NSString+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/10.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ELKEnumSubStringBlock)(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop);

typedef void(^ELKEnumerateLinesBlock)(NSString *line, BOOL *stop);


@interface NSString (ELKChainedAlloy)

#define ELK_stringWithFormat(format, ...)     \
    [NSString stringWithFormat:(format), ##__VA_ARGS__]




//- (NSString *)stringByAppendingFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);



#pragma mark *** Character encoding and converting to/from c-string representations ***

//- (nullable NSData *)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;   // External representation
//- (nullable NSData *)dataUsingEncoding:(NSStringEncoding)encoding;                                    // External representation
//
//- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding;
//
///* Methods to convert NSString to a NULL-terminated cString using the specified encoding. Note, these are the "new" cString methods, and are not deprecated like the older cString methods which do not take encoding arguments.  Also, cString methods should be used just with 8-bit encodings, and not encodings such as UTF-16 or UTF-32.  For those, use methods such as getCharacters:range: (for UTF-16 characters in system endianness) or getBytes:... (which can take any encoding).
// */
//- (nullable const char *)cStringUsingEncoding:(NSStringEncoding)encoding NS_RETURNS_INNER_POINTER;    // "Autoreleased"; NULL return if encoding conversion not possible; for performance reasons, lifetime of this should not be considered longer than the lifetime of the receiving string (if the receiver string is freed, this might go invalid then, before the end of the autorelease scope). Use only with 8-bit encodings, and not encodings such as UTF-16 or UTF-32.
//- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding;    // NO return if conversion not possible due to encoding errors or too small of a buffer. The buffer should include room for maxBufferCount bytes; this number should accomodate the expected size of the return value plus the NULL termination character, which this method adds. (So note that the maxLength passed to this method is one more than the one you would have passed to the deprecated getCString:maxLength:.) Use only with 8-bit encodings, and not encodings such as UTF-16 or UTF-32.

/* Use this to convert string section at a time into a fixed-size buffer, without any allocations.  Does not NULL-terminate.
 buffer is the buffer to write to; if NULL, this method can be used to computed size of needed buffer.
 maxBufferCount is the length of the buffer in bytes. It's a good idea to make sure this is at least enough to hold one character's worth of conversion.
 usedBufferCount is the length of the buffer used up by the current conversion. Can be NULL.
 encoding is the encoding to convert to.
 options specifies the options to apply.
 range is the range to convert.
 leftOver is the remaining range. Can be NULL.
 YES return indicates some characters were converted. Conversion might usually stop when the buffer fills,
 but it might also stop when the conversion isn't possible due to the chosen encoding.
 */
//- (BOOL)getBytes:(nullable void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(nullable NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(nullable NSRangePointer)leftover;
//
///* These return the maximum and exact number of bytes needed to store the receiver in the specified encoding in non-external representation. The first one is O(1), while the second one is O(n). These do not include space for a terminating null.
// */
//- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;    // Result in O(1) time; the estimate may be way over what's needed. Returns 0 on error (overflow)
//- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;        // Result in O(n) time; the result is exact. Returns 0 on error (cannot convert to specified encoding, or overflow)

//+ (NSString *)localizedNameOfStringEncoding:(NSStringEncoding)encoding;
//
//
//#pragma mark *** Other ***
//
//- (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator;
//- (NSArray<NSString *> *)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

//- (NSString *)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
//- (NSString *)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex;
//
///* Returns a string with the character folding options applied. theOptions is a mask of compare flags with *InsensitiveSearch suffix.
// */
//- (NSString *)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(nullable NSLocale *)locale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//
///* Replace all occurrences of the target string in the specified range with replacement. Specified compare options are used for matching target. If NSRegularExpressionSearch is specified, the replacement is treated as a template, as in the corresponding NSRegularExpression methods, and no other options can apply except NSCaseInsensitiveSearch and NSAnchoredSearch.
// */
//- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//
///* Replace all occurrences of the target string with replacement. Invokes the above method with 0 options and range of the whole string.
// */
//- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

/* Replace characters in range with the specified string, returning new string.
 */
//- (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

/* Perform string transliteration.  The transformation represented by transform is applied to the receiver. reverse indicates that the inverse transform should be used instead, if it exists. Attempting to use an invalid transform identifier or reverse an irreversible transform will return nil; otherwise the transformed string value is returned (even if no characters are actually transformed). You can pass one of the predefined transforms below (NSStringTransformLatinToKatakana, etc), or any valid ICU transform ID as defined in the ICU User Guide. Arbitrary ICU transform rules are not supported.
 */
//- (nullable NSString *)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0));    // Returns nil if reverse not applicable or transform is invalid


/* Write to specified url or path using the specified encoding.  The optional error return is to indicate file system or encoding errors.
 */
//- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//


#pragma mark *** Initializers ***

/* In general creation methods in NSString do not apply to subclassers, as subclassers are assumed to provide their own init methods which create the string in the way the subclass wishes.  Designated initializers of NSString are thus init and initWithCoder:.
 */
//- (instancetype)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;    /* "NoCopy" is a hint */
//- (instancetype)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
//- (nullable instancetype)initWithUTF8String:(const char *)nullTerminatedCString;
//- (instancetype)initWithString:(NSString *)aString;
//- (instancetype)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
//- (instancetype)initWithFormat:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
//- (instancetype)initWithFormat:(NSString *)format locale:(nullable id)locale, ... NS_FORMAT_FUNCTION(1,3);
//- (instancetype)initWithFormat:(NSString *)format locale:(nullable id)locale arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
//- (nullable instancetype)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
//- (nullable instancetype)initWithBytes:(const void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding;
//- (nullable instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer;    /* "NoCopy" is a hint */

//+ (instancetype)string;
//+ (instancetype)stringWithString:(NSString *)string;
//+ (instancetype)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length;
//+ (nullable instancetype)stringWithUTF8String:(const char *)nullTerminatedCString;
//+ (instancetype)stringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
//+ (instancetype)localizedStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
//
//- (nullable instancetype)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
//+ (nullable instancetype)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc;

/* These use the specified encoding.  If nil is returned, the optional error return indicates problem that was encountered (for instance, file system or encoding errors).
 */
//- (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
//- (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
//+ (nullable instancetype)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
//+ (nullable instancetype)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;

/* These try to determine the encoding, and return the encoding which was used.  Note that these methods might get "smarter" in subsequent releases of the system, and use additional techniques for recognizing encodings. If nil is returned, the optional error return indicates problem that was encountered (for instance, file system or encoding errors).
 */
//- (nullable instancetype)initWithContentsOfURL:(NSURL *)url usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//- (nullable instancetype)initWithContentsOfFile:(NSString *)path usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//+ (nullable instancetype)stringWithContentsOfURL:(NSURL *)url usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//+ (nullable instancetype)stringWithContentsOfFile:(NSString *)path usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//
//+ (NSStringEncoding)stringEncodingForData:(NSData *)data
//                          encodingOptions:(nullable NSDictionary<NSStringEncodingDetectionOptionsKey, id> *)opts
//                          convertedString:(NSString * _Nullable * _Nullable)string
//                      usedLossyConversion:(nullable BOOL *)usedLossyConversion API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));
//


/**
 compare
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_compare)(NSString * _Nonnull string);

/**
 compare options
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_compareOptions)(NSString * _Nonnull string, NSStringCompareOptions mask);

/**
 compare options range
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_compareOptionsRange)(NSString * _Nonnull string, NSStringCompareOptions mask, NSRange range);

/**
 compare options range locale
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_compareOptionsRangeLocale)(NSString * _Nonnull string, NSStringCompareOptions mask, NSRange range, id _Nullable locale);

/**
 case insensitive compare
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_caseInsensitiveCompare)(NSString * _Nonnull string);

/**
 localized compare
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_localizedCompare)(NSString * _Nonnull string);

/**
 localized case insensitive compare
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_localizedCaseInsensitiveCompare)(NSString * _Nonnull string);

/**
 localized standard compare
 */
@property (nonatomic, copy, readonly) NSComparisonResult (^elk_localizedStandardCompare)(NSString * _Nonnull string);

/**
 check if is equal to string
 */
@property (nonatomic, copy, readonly) BOOL (^elk_isEqualToStr)(NSString * _Nonnull string);

/**
 has prefix
 */
@property (nonatomic, copy, readonly) BOOL (^elk_hasPrefix)(NSString * _Nonnull str);

/**
 has suffix
 */
@property (nonatomic, copy, readonly) BOOL (^elk_hasSuffix)(NSString * _Nonnull str);

/**
 common prefix with string options
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_commonPrefixWithStringOption)(NSString * _Nonnull str, NSStringCompareOptions mask);

/**
 contains string
 */
@property (nonatomic, copy, readonly) BOOL (^elk_containsString)(NSString * _Nonnull str) API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

/**
 localized case insensitive contains string
 */
@property (nonatomic, copy, readonly) BOOL (^elk_localizedCaseInsensitiveContainsString)(NSString * _Nonnull str) API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

/**
 localized standard contains string
 */
@property (nonatomic, copy, readonly) BOOL (^elk_localizedStandardContainsString)(NSString * _Nonnull str) API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0));

/**
 localized standard range of string
 */
@property (nonatomic, copy, readonly) NSRange (^elk_localizedStandardRangeOfString)(NSString * _Nonnull str) API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0));

/**
 range of string
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfString)(NSString * _Nonnull searchString);

/**
 range of string options
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfStringOptions)(NSString * _Nonnull searchString, NSStringCompareOptions mask);

/**
 range of string options range
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfStringOptionRange)(NSString * _Nonnull searchString, NSStringCompareOptions mask, NSRange range);

/**
 range of string options range locale
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfStringOptionRangeLocale)(NSString * _Nonnull searchString, NSStringCompareOptions mask, NSRange range, NSLocale * _Nullable locale) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

/**
 range of character from set
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfCharacterFromSet)(NSCharacterSet * _Nonnull searchSet);

/**
 range of character from set options
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfCharacterFromSetOption)(NSCharacterSet * _Nonnull searchSet, NSStringCompareOptions mask);

/**
 range of character from set options range
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfCharacterFromSetOptionRange)(NSCharacterSet * _Nonnull searchSet, NSStringCompareOptions mask, NSRange range);

/**
 range of composed character sequence at index
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfComposedCharacterSequenceAtIndex)(NSUInteger index);

/**
 range of composed character sequences for range
 */
@property (nonatomic, copy, readonly) NSRange (^elk_rangeOfComposedCharacterSequencesForRange)(NSRange range) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

/**
 string by appending string
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_stringByAppendingString)(NSString * _Nonnull aString);


//@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_stringByAppendingFormat)(NSString * formatt, __attribute__((MTLVertexFormat(__NSString__, 1, 2))) moreParams);

/**
 uppercase String With Locale
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_uppercaseStringWithLocale)(NSLocale * _Nullable locale) NS_AVAILABLE_IOS(6_0);

/**
 lowercase String With Locale
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_lowercaseStringWithLocale)(NSLocale * _Nullable locale) NS_AVAILABLE_IOS(6_0);

/**
 capitalized String With Locale
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_capitalizedStringWithLocale)(NSLocale * _Nullable locale) NS_AVAILABLE_IOS(6_0);


/**
 substring from index
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_substringFromIndex)(NSUInteger from);

/**
 substring to index
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_substringToIndex)(NSUInteger to);

/**
 substring with range
 */
@property (nonatomic, copy, readonly) NSString * _Nonnull (^elk_substringWithRange)(NSRange range);


#pragma mark - Finding lines, sentences, words, etc

/**
 Line Range For Range
 */
@property (nonatomic, copy, readonly) NSRange (^elk_lineRangeForRange)(NSRange range);


/**
 Paragraph Range For Range
 */
@property (nonatomic, copy, readonly) NSRange (^elk_paragraphRangeForRange)(NSRange range);


/**
 In the enumerate methods, the blocks will be invoked inside an autorelease pool, so any values assigned inside the block should be retained.
 */
@property (nonatomic, copy, readonly) void (^elk_enumerateSubstrInRangeOptions)(NSRange range, NSStringEnumerationOptions opts, ELKEnumSubStringBlock usingBlock) API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
@property (nonatomic, copy, readonly) void (^elk_enumerateLinesUsingBlock)(ELKEnumerateLinesBlock usingBlock) API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));









@end

NS_ASSUME_NONNULL_END
