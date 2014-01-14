//
//  SearchGoodsViewController.h
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-10.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchGoodsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    UIColor *lightBlue;
    UIColor *lightOrange;
    UIColor *paleGreen;
    UIColor *hotPink;
    
    NSArray *lInfoArray;
}

@end
