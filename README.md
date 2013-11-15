APJSONUtility
================

APJSONUtility lets you easily pull out deeply nested objects from JSON Response Data. 

Example 1: Dealing with JSON stored as NSData.

```objc

    // Create a dictionary.
    NSArray *subArray =  @[@"foo", @"bar"];
    NSDictionary *testDictionary = @{@"baz":subArray, @"foo":subArray};
    NSArray *testArray = @[testDictionary, testDictionary, @"Hello"];
    
    // Turn it into JSON.
    NSError *writeError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:testArray options:NSJSONWritingPrettyPrinted error:&writeError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"JSON Output: %@", jsonString);
    
    // Try parsing it.
    NSString *returnValue = [APJSONUtility objectFromNestedJSON:jsonData usingCascadedKeys:APJSONIndex(0), APJSONKey(@"foo"), APJSONIndex(1), nil];
                            
    NSLog(@"return Value =  %@", returnValue);

```

