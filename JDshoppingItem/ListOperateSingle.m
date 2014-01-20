//
//  ListOperateSingle.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-17.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ListOperateSingle.h"
static ListOperateSingle *listOperte=nil;
@implementation ListOperateSingle

+(ListOperateSingle *)defauleListOperte{
     @synchronized(self){
         if (listOperte==nil) {
             listOperte=[[ListOperateSingle alloc]init];
         }
     }
    return listOperte;
}

-(id)init{
    self=[super init];
    if (self) {
        _address=[[NSArray alloc]init];
        _dingdan=[[NSArray alloc]init];
        _goodsCart=[[NSArray alloc]init];
    }
    return self;
}

@end
