//
//  TabBarViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "TabBarViewController.h"
#import "AllGoodsViewController.h"
#import "shoppingcart.h"
#import "SearchGoodsViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AllGoodsViewController *lAllGoodsVC = [[AllGoodsViewController alloc]init];
    UINavigationController *lAllGoodsNVC = [[UINavigationController alloc]initWithRootViewController:lAllGoodsVC];
    
    shoppingcart *lShopVC = [[shoppingcart alloc]init];
    UINavigationController *lShopNVC = [[UINavigationController alloc]initWithRootViewController:lShopVC];
    
    SearchGoodsViewController *lSearchGoodsView = [[SearchGoodsViewController alloc]init];
    UINavigationController *lSearchGoodsNVC = [[UINavigationController alloc]initWithRootViewController:lSearchGoodsView];
    
    NSArray *Items = @[lAllGoodsNVC,lSearchGoodsNVC,lShopNVC,];
    [self setViewControllers:Items animated:YES];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
