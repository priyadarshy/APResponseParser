//
//  RDUtilities.h
//  APResponseParser
//
//  Created by Ashutosh Priyadarshy on 11/14/13.
//  Copyright (c) 2013 EEMe labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RDJSONKey(x) x
#define RDJSONIndex(x) @x

@interface RDUtilities : NSObject

+ (id)objectFromNestedJSON:(id)JSONObject usingCascadedKeys:(id)firstArg,...;

@end