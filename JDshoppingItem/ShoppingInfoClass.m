//
//  ShoppingInfoClass.m
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ShoppingInfoClass.h"
static  ShoppingInfoClass *sharCommonInfo = nil;
@implementation ShoppingInfoClass
+(ShoppingInfoClass *) SharCommonInfo{
    @synchronized(self){
        if (sharCommonInfo == nil) {
            sharCommonInfo = [[ShoppingInfoClass alloc]init];
        }
    }
    return sharCommonInfo;
}

@end
