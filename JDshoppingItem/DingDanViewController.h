//
//  DingDanViewController.h
//  JDshoppingItem
//
//  Created by 219 on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingDanViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataarray;
    NSDictionary *dic;
}
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;

@end
