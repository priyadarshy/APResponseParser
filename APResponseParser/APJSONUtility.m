//
//  APJSONUtility.m
//  APJSONUtilities
//
//  Created by Ashutosh Priyadarshy on 11/14/13.
//  Copyright (c) 2013 Ashutosh Priyadarshy. All rights reserved.
//

#import "APJSONUtility.h"

@interface NSObject (PrivateAPUtilityAdditions)

- (id)rdValueForKeyOrIndex:(id)keyOrIndex;

@end

@implementation NSObject (PrivateAPUtilityAdditions)

- (id)rdValueForKeyOrIndex:(id)keyOrIndex
{
    return nil;
}

@end


@implementation NSArray (PrivateRDUtilityAdditions)

- (id)rdValueForKeyOrIndex:(id)keyOrIndex
{
    id toReturn = nil;
    NSUInteger index = NSUIntegerMax;
    if ([keyOrIndex respondsToSelector:@selector(unsignedIntegerValue)]) {
        index = [keyOrIndex unsignedIntegerValue];
    }
    if (index < [self count]) {
        toReturn = self[index];
    }
    
    return toReturn;
}

@end

@implementation NSDictionary (PrivateRDUtilityAdditions)

- (id)rdValueForKeyOrIndex:(id)keyOrIndex
{
    id toReturn = nil;
    if (keyOrIndex) {
        toReturn = self[keyOrIndex];
    }
    return toReturn;
}

@end

@implementation APJSONUtility

+(NSDictionary *)collectionFromJSONData:(NSData *)jsonData
{
    NSError *jsonParsingError = nil;
    
    if (jsonData) {
        
        id jsonAsCollection = [NSJSONSerialization JSONObjectWithData:jsonData options:(NSJSONReadingMutableContainers|NSJSONReadingAllowFragments) error:&jsonParsingError];
        
        // Return if the parse was successful. Otherwise give up and return nil.
        if (jsonParsingError == nil) {
            return jsonAsCollection;
        }
        else {
            return nil;
        }
    }
    else {
        return nil;
    }
}

+(id) objectFromNestedJSON:(id)JSONObject usingCascadedKeys:(id)firstArg,...
{
    JSONObject = [self collectionFromJSONData:JSONObject];
    NSMutableArray *mutableKeysAndIndexes = [[NSMutableArray alloc] init];
    id subObject = nil;
    
    va_list args;
    va_start(args, firstArg);
    
    // Iterate through the list of arguments.
    for (id arg = firstArg; arg != nil; arg = va_arg(args, id))
    {
        [mutableKeysAndIndexes addObject:arg];
    }
    
    subObject = JSONObject;
    
    for (id indexOrKey in mutableKeysAndIndexes) {
        subObject = [subObject rdValueForKeyOrIndex:indexOrKey];
    }
    
    return subObject;
}

@end