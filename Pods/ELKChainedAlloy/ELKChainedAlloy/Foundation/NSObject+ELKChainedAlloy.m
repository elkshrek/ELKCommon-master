//
//  NSObject+ELKChainedAlloy.m
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/9.
//  Copyright © 2019 elk. All rights reserved.
//

#import "NSObject+ELKChainedAlloy.h"

@implementation NSObject (ELKChainedAlloy)

/**
 make a object, return a new object
 
 @return a new object
 */
+ (NSObject *)elk_make
{
    id object = [[self alloc] init];
    return object;
}

/**
 make a object, return a new object
 
 @param block block
 @return a new object
 */
+ (NSObject *)elk_makeBlock:(void (^)(NSObject * _Nonnull))block
{
    id object = [[self alloc] init];
    if (block) {
        block(object);
    }
    return object;
}

- (NSObject * _Nonnull (^)(SEL _Nonnull, id _Nonnull, BOOL))elk_performSelOnMain
{
    return ^(SEL selector, id _Nonnull obj, BOOL untilDone) {
        [self performSelectorOnMainThread:selector withObject:obj waitUntilDone:untilDone];
        return self;
    };
}

- (NSObject * _Nonnull (^)(SEL _Nonnull, NSThread * _Nonnull, id _Nonnull, BOOL))elk_performSelOnThread
{
    return ^(SEL selector, NSThread * _Nonnull thread, id _Nonnull obj, BOOL untilDone) {
        [self performSelector:selector onThread:thread withObject:obj waitUntilDone:untilDone];
        return self;
    };
}

- (NSObject * _Nonnull (^)(SEL _Nonnull, id _Nonnull))elk_performSelInBackground
{
    return ^(SEL selector, id _Nonnull obj) {
        [self performSelectorInBackground:selector withObject:obj];
        return self;
    };
}

- (NSObject * _Nonnull (^)(SEL _Nonnull, id _Nonnull, NSTimeInterval))elk_performSelWithDelay
{
    return ^(SEL selector, id _Nonnull obj, NSTimeInterval tInterval) {
        [self performSelector:selector withObject:obj afterDelay:tInterval];
        return self;
    };
}


- (NSObject * _Nonnull (^)(id _Nonnull, NSString * _Nonnull))elk_setValueForKey
{
    return ^(id _Nonnull object, NSString * _Nonnull key) {
        [self setValue:object forKey:key];
        return self;
    };
}

- (id _Nonnull (^)(NSString * _Nonnull))elk_valueForKey
{
    return ^(NSString * _Nonnull key) {
        return [self valueForKey:key];
    };
}

- (NSObject * _Nonnull (^)(id _Nonnull, NSString * _Nonnull))elk_setValueForKeyPath
{
    return ^(id _Nonnull object, NSString * _Nonnull keyPath) {
        [self setValue:object forKeyPath:keyPath];
        return self;
    };
}

- (id _Nonnull (^)(NSString * _Nonnull))elk_valueForKeyPath
{
    return ^(NSString * _Nonnull keyPath) {
        return [self valueForKeyPath:keyPath];
    };
}

- (NSObject * _Nonnull (^)(NSDictionary * _Nonnull))elk_setValuesForKeysWithDict
{
    return ^(NSDictionary * _Nonnull dict) {
        [self setValuesForKeysWithDictionary:dict];
        return self;
    };
}

- (NSDictionary * _Nonnull (^)(NSArray<NSString *> * _Nonnull))elk_dictWithValuesForKeys
{
    return ^(NSArray<NSString *> * _Nonnull keyArray) {
        return [self dictionaryWithValuesForKeys:keyArray];
    };
}


- (BOOL (^)(id _Nonnull))elk_isEqual
{
    return ^(id _Nonnull obj) {
        return [self isEqual:obj];
    };
}

- (BOOL (^)(Class _Nonnull __unsafe_unretained))elk_isKindOfClass
{
    return ^(Class cls) {
        return [self isKindOfClass:cls];
    };
}

- (BOOL (^)(Class  _Nonnull __unsafe_unretained))elk_isMemberOfClass
{
    return ^(Class cls) {
        return [self isMemberOfClass:cls];
    };
}

- (BOOL (^)(Protocol * _Nonnull))elk_conformsToProtocol
{
    return ^(Protocol * _Nonnull protocol) {
        return [self conformsToProtocol:protocol];
    };
}

- (BOOL (^)(SEL _Nonnull))elk_responsToSel
{
    return ^(SEL selector) {
        return [self respondsToSelector:selector];
    };
}





@end
