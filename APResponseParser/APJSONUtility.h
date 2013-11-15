//
//  APJSONUtility.h
//  APJSONUtilities
//
//  Created by Ashutosh Priyadarshy on 11/14/13.
//  Copyright (c) 2013 Ashutosh Priyadarshy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APJSONKey(x) x
#define APJSONIndex(x) @x

@interface APJSONUtility : NSObject

+ (id)objectFromNestedJSON:(id)JSONObject usingCascadedKeys:(id)firstArg,...;

@end