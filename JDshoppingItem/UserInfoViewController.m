//
//  UserInfoViewController.m
//  ShopingAPP
//
//  Created by 219 on 14-1-6.
//  Copyright (c) 2014年 kai. All rights reserved.
//

#import "UserInfoViewController.h"
#import "addressInfoViewController.h"

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
// Do any additional setup after loading the view from its nib.
}
-(void)qieHuanZhangHaoClick:(UIBarButtonItem *) sender{
    NSLog(@"账号切换");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zhuXiao:(UIButton *)sender {
}

- (IBAction)myDingDan:(UIButton *)sender {
}

- (IBAction)myAddress:(UIButton *)sender {
    addressInfoViewController *add=[[addressInfoViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}
- (void)dealloc {
   
}
@end
