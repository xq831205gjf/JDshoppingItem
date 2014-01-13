//
//  submitViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-13.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "submitViewController.h"
#import "DingDanViewController.h"
@interface submitViewController ()

@end

@implementation submitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"订单提交";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _MyView.layer.cornerRadius=10.0;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - Button
- (IBAction)lButton:(UIButton *)sender {
    NSLog(@"查看订单");
    DingDanViewController *lDingDan=[[DingDanViewController alloc]init];
    [self.navigationController pushViewController:lDingDan animated:YES];
}

- (IBAction)payButton:(UIButton *)sender {
    NSLog(@"支付");
}
@end
