//
//  customCell.h
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingcart.h"

@interface shoppingcartcustomCell : UITableViewCell<shopCartDelegate>
@property(retain,nonatomic)UILabel *goodsName;
@property(retain,nonatomic)UILabel *goodsPrice;
@property(retain,nonatomic)UILabel *goodsColor;
@property(retain,nonatomic)UILabel *goodsSzie;
@property(retain,nonatomic)UIImageView *goodsChick;
@property(retain,nonatomic)UIImageView *goodsHeadImage;


@end
