//
//  UserInfoViewController.m
//  ShopingAPP
//
//  Created by 219 on 14-1-6.
//  Copyright (c) 2014年 kai. All rights reserved.
//

#import "UserInfoViewController.h"
#import "addressInfoViewController.h"
#import "TabBarViewController.h"
#import "shoppingcart.h"
#import "DingDanViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"我的信息";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *bb=[[UIBarButtonItem alloc]initWithTitle:@"切换账号" style:UIBarButtonItemStyleBordered target:self action:@selector(qieHuanZhangHaoClick:)];
    self.navigationItem.rightBarButtonItem=bb;
    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    self.redView1.layer.cornerRadius=12.0;
    self.redView2.layer.cornerRadius=12.0;
    self.redView3.layer.cornerRadius=12.0;
// Do any additional setup after loading the view from its nib.
}
-(void)qieHuanZhangHaoClick:(UIBarButtonItem *) sender{
    NSLog(@"账号切换");
}

-(void)ClickLeftBarButton:(UIBarButtonItem *)sender{
    TabBarViewController *allgood=[[TabBarViewController alloc]init];
    [self presentViewController:allgood animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zhuXiao:(UIButton *)sender {
}

- (IBAction)myDingDan:(UIButton *)sender {
    DingDanViewController *ding=[[DingDanViewController alloc]init];
    [self.navigationController pushViewController:ding animated:YES];
}

- (IBAction)myAddress:(UIButton *)sender {
    addressInfoViewController *add=[[addressInfoViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}

- (IBAction)goGoodsCar:(UIButton *)sender {
    TabBarViewController *allgood=[[TabBarViewController alloc]init];
    //shoppingcart *lShopVC = [[shoppingcart alloc]init];
    [self presentViewController:allgood animated:YES completion:^{
        allgood.tabBarController.selectedIndex=1;
    }];
}
- (void)dealloc {
   
}
@end
