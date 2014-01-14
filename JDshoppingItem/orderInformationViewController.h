//
//  orderInformationViewController.h
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrdViewDelegate;
@interface orderInformationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *userInfo;
@property (weak, nonatomic) IBOutlet UIView *consigneeView;
@property (weak, nonatomic) IBOutlet UIView *distributionView;
@property (weak, nonatomic) IBOutlet UIView *goodsViews;
@property (weak, nonatomic) IBOutlet UIView *payView;
@property (weak, nonatomic) IBOutlet UILabel *zongjine;
@property(nonatomic,assign)id<OrdViewDelegate> ldelegate;
@property (retain, nonatomic)UITableView *consigneeTabView;
@end
@protocol OrdViewDelegate        <NSObject>
-(void)send:(orderInformationViewController *)sender;
@end