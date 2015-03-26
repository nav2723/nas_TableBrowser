//
//  Webpage.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/24/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Webpage : NSObject <NSCoding>

@property NSMutableString *name;
@property NSMutableString *address;
@property int order;

-(void)encodeWithCoder:(NSCoder *)aCoder;
-(instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
