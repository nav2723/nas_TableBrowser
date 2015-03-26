//
//  SharedStore.m
//  TableBrowser
//
//  Created by V on 3/24/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "SharedStore.h"
#import "Webpage.h"


@implementation SharedStore

+ (instancetype)sharedStore
{
	static SharedStore *sharedStore = nil;
	// Do I need to create a sharedStore?
	if (!sharedStore)
	{
		sharedStore = [[self alloc] initPrivate];
	}
	return sharedStore;
}


// If a programmer calls [[BNRItemStore alloc] init], let him // know the error of his ways
- (instancetype)init
{
	@throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
	
	
	return nil;
}

// Here is the real (secret) initializer


- (instancetype)initPrivate
{
	self = [super init];
	
	//_data = [[NSMutableArray alloc] init];
    
    if (self){
        NSString *path = [self itemArchivePath];
        _data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!_data){
            _data = [[NSMutableArray alloc] init];
            
            Webpage *t1 = [[Webpage alloc] init];
            t1.name = [NSMutableString stringWithString:@"CNN"];
            t1.address = [NSMutableString stringWithString:@"http://www.cnn.com"];
            t1.order = 0;
            [_data addObject:t1];
            
            Webpage *t2  = [[Webpage alloc] init];
            t2.name = [NSMutableString stringWithString:@"Amazon"];
            t2.address = [NSMutableString stringWithString:@"http://www.amazon.com"];
            t2.order = 1;
            [_data addObject:t2];
            
            Webpage *t3  = [[Webpage alloc] init];
            t3.name = [NSMutableString stringWithString:@"Facebook"];
            t3.address = [NSMutableString stringWithString:@"http://www.facebook.com"];
            t3.order = 2;
            [_data addObject:t3];
            
            Webpage *t4  = [[Webpage alloc] init];
            t4.name = [NSMutableString stringWithString:@"Reddit"];
            t4.address = [NSMutableString stringWithString:@"http://www.m.reddit.com"];
            t4.order = 3;
            [_data addObject:t4];
            
            Webpage *t5  = [[Webpage alloc] init];
            t5.name = [NSMutableString stringWithString:@"Netflix"];
            t5.address = [NSMutableString stringWithString:@"http://www.netflix.com"];
            t5.order = 4;
            [_data addObject:t5];
        }
    }
	
	
	//...
    

    return self;    
}

-(NSString *)itemArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

-(BOOL)saveChanges{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:_data toFile:path];
}

@end
