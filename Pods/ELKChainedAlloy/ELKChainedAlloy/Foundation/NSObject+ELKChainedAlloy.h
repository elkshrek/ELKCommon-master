//
//  NSObject+ELKChainedAlloy.h
//  ELKChained-master
//
//  Created by Jonathan on 2019/6/9.
//  Copyright © 2019 elk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ELKChainedAlloy)


/**
 make a object, return a new object
 
 @return a new object
 */
+ (NSObject * _Nonnull)elk_make;

/**
 make a object, return a new object

 @param block block
 @return a new object
 */
+ (NSObject * _Nonnull)elk_makeBlock:(void (^ _Nullable)(NSObject * _Nonnull make))block;


/**
 perform select on main
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_performSelOnMain)(SEL selector, id _Nonnull obj, BOOL untilDone);

/**
 perform select on thread
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_performSelOnThread)(SEL selector, NSThread * _Nonnull thread, id _Nonnull obj, BOOL untilDone);

/**
 perform select in background
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_performSelInBackground)(SEL selector, id _Nonnull obj);

/**
 perform select with delay
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_performSelWithDelay)(SEL selector, id _Nonnull obj, NSTimeInterval tInterval);


/**
 set value for key
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_setValueForKey)(id _Nonnull object, NSString * _Nonnull key);

/**
 value for key
 */
@property (nonatomic, copy, readonly) id _Nonnull (^elk_valueForKey)(NSString * _Nonnull key);

/**
 set value for key path
 */
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_setValueForKeyPath)(id _Nonnull object, NSString * _Nonnull keyPath);
@property (nonatomic, copy, readonly) id _Nonnull (^elk_valueForKeyPath)(NSString * _Nonnull keyPath);
@property (nonatomic, strong, readonly) NSObject * _Nonnull (^elk_setValuesForKeysWithDict)(NSDictionary * _Nonnull dict);
@property (nonatomic, copy, readonly) NSDictionary * _Nonnull (^elk_dictWithValuesForKeys)(NSArray<NSString *> * _Nonnull keyArray);


@property (nonatomic, copy, readonly) BOOL (^elk_isEqual)(id _Nonnull obj);
@property (nonatomic, copy, readonly) BOOL (^elk_isKindOfClass)(Class cls);
@property (nonatomic, copy, readonly) BOOL (^elk_isMemberOfClass)(Class cls);
@property (nonatomic, copy, readonly) BOOL (^elk_conformsToProtocol)(Protocol * _Nonnull protocol);
@property (nonatomic, copy, readonly) BOOL (^elk_responsToSel)(SEL selector);



@end

NS_ASSUME_NONNULL_END
