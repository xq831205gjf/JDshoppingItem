//
//  customCell.h
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol shopCartDelegate;
@interface shoppingcartcustomCell : UITableViewCell
@property(retain,nonatomic)UILabel *goodsName;
@property(retain,nonatomic)UILabel *goodsPrice;
@property(retain,nonatomic)UILabel *goodsColor;
@property(retain,nonatomic)UILabel *goodsSzie;
//@property(retain,nonatomic)UIImageView *goodsChick;
@property(retain,nonatomic)UIImageView *goodsHeadImage;
@property(retain,nonatomic)UIView *lView;
@property(nonatomic,assign)id<shopCartDelegate> ldelegate;
@end
@protocol shopCartDelegate      <NSObject>
-(void)send;
@end