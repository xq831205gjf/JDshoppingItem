//
//  UserInfoViewController.h
//  ShopingAPP
//
//  Created by 219 on 14-1-6.
//  Copyright (c) 2014年 kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *userName;
@property (retain, nonatomic) IBOutlet UILabel *goodsCount;
@property (weak, nonatomic) IBOutlet UIView *redView1;
@property (weak, nonatomic) IBOutlet UIView *redView2;
@property (weak, nonatomic) IBOutlet UIView *redView3;
@property (weak, nonatomic) IBOutlet UILabel *dingDanCount;
@property (weak, nonatomic) IBOutlet UILabel *addressCount;

- (IBAction)zhuXiao:(UIButton *)sender;
- (IBAction)myDingDan:(UIButton *)sender;
- (IBAction)myAddress:(UIButton *)sender;
- (IBAction)goGoodsCar:(UIButton *)sender;

@end
