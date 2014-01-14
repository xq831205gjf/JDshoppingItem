//
//  goodsInfoView.h
//  JDshoppingItem
//
//  Created by TY on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderInformationViewController.h"
@interface goodsInfoView : UIView<OrdViewDelegate>
@property(retain,nonatomic)UILabel *goodsName;
@property(retain,nonatomic)UILabel *goodsPrice;
@property(retain,nonatomic)UILabel *goodsconut;
@property(retain,nonatomic)UILabel *goodsSzie;
@property(retain,nonatomic)UIImageView *goodsHeadImage;
@property(retain,nonatomic)orderInformationViewController *orderVC;
@end
