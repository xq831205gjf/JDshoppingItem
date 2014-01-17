//
//  shoppingcart.h
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingcartcustomCell.h"

@interface shoppingcart : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,shopCartDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MyTabeleView;
@property (weak, nonatomic) IBOutlet UIView *UserInfo;
@property(nonatomic,retain) UILabel *lnumlabel;
@property(nonatomic,retain) UILabel *lnumlabel1;

@end
