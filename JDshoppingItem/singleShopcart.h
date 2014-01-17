//
//  singleShopcart.h
//  JDshoppingItem
//
//  Created by TY on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleShopcart : NSObject
+(singleShopcart *)setSingleSopCart;
@property(nonatomic,retain)NSDictionary *shareshopcart;
@property(nonatomic,retain)NSDictionary *shareadress;
@property(retain,nonatomic)UIImageView *goodsChick;
@property(assign,nonatomic)bool Chick;
@end
