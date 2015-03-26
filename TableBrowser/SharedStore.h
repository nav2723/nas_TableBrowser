//
//  SharedStore.h
//  TableBrowser
//
//  Created by V on 3/24/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedStore : NSObject

@property (nonatomic, strong) NSMutableArray *data;

// Notice that this is a class method and prefixed with a + instead of a 
+ (instancetype)sharedStore;
+ (NSMutableArray*) getWebPage;
- (BOOL)saveChanges;

@end
