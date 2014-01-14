//
//  singleShopcart.m
//  JDshoppingItem
//
//  Created by TY on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "singleShopcart.h"
static singleShopcart *setSingleSopCart=nil;
@implementation singleShopcart
+(singleShopcart *)setSingleSopCart{
    @synchronized(self){
        if (setSingleSopCart == nil) {
            setSingleSopCart =[[singleShopcart alloc]init];
        }
    
    }
    return setSingleSopCart;
}
- (id)init
{
    self=[super init];
    if (self) {
       
        _shareadress=[[NSArray alloc]init];
        _shareshopcart=[[NSDictionary alloc]init];
        
        
    }
    return self;
}

@end
