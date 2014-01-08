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
- (IBAction)zhuXiao:(UIButton *)sender;
- (IBAction)myDingDan:(UIButton *)sender;
- (IBAction)myAddress:(UIButton *)sender;

@end
