//
//  AllGoodsViewController.h
//  页面
//
//  Created by 周钦 on 14-1-6.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllGoodsViewController : UIViewController<UIScrollViewDelegate>{
    UIScrollView *lMainScrollView;
    NSMutableArray *lGoodsBrandArray;
    NSMutableData *lHotGoodsData;
    NSOperationQueue *lQueue;
}

@property(nonatomic,retain)UIScrollView *lScrollView;
@property(nonatomic,retain)UIPageControl *lPageControl;
@end
