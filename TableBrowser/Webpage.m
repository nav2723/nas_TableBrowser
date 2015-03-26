//
//  Webpage.m
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/24/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "Webpage.h"

@implementation Webpage

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeInt:self.order forKey:@"order"];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    
    if (self){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _address = [aDecoder decodeObjectForKey:@"address"];
        _order = [aDecoder decodeIntForKey:@"order"];
    }
    return self;
    
}

@end
