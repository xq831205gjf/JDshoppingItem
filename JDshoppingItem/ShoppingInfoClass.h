//
//  ShoppingInfoClass.h
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingInfoClass : NSObject
+(ShoppingInfoClass *) SharCommonInfo;
@property(nonatomic,retain) NSMutableDictionary *lDictionaryOfUserInfo;
@end
