//
//  addressInfoViewController.h
//  ShopingAPP
//
//  Created by 219 on 14-1-6.
//  Copyright (c) 2014年 kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addressInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataarray;
    NSDictionary *dic;
}
@property (retain, nonatomic) IBOutlet UITableView *MyTableView;

@end
