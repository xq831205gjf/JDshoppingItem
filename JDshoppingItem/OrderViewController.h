//
//  OrderViewController.h
//  JDshoppingItem
//
//  Created by 219 on 14-1-17.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataarray;
}
@property (weak, nonatomic) IBOutlet UILabel *orderCode;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UITableView *Mytableview;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *state;

@end
