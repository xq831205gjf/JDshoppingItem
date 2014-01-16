//
//  ParticularGoodsViewController.h
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomReview.h"
@interface ParticularGoodsViewController : UIViewController{
    UIColor *lightBlue;
    UIColor *lightOrange;
    UIColor *paleGreen;
    UIColor *hotPink;
    
    UIWebView *lWebView;
    
    CustomReview *lReview;
    
    UIScrollView *lMainScrollView;
    
    int a;
}
@property(nonatomic ,retain)NSString *Goodsid;
@end
