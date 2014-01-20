//
//  ListOperateSingle.h
//  JDshoppingItem
//
//  Created by 219 on 14-1-17.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListOperateSingle : NSObject
+(ListOperateSingle *)defauleListOperte;
@property(nonatomic,retain)NSArray *address;
@property(nonatomic,retain)NSArray *dingdan;
@property(nonatomic,retain)NSArray *goodsCart;
@property(nonatomic,retain)NSString *ordercode;
@property(nonatomic,retain)NSString *state;
@property(nonatomic,retain)NSString *amount;

@end
