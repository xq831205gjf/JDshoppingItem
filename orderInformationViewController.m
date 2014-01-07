//
//  orderInformationViewController.m
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import "orderInformationViewController.h"

@interface orderInformationViewController ()

@end

@implementation orderInformationViewController

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
    [self viewLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.payView.layer.borderWidth=1.0;
    self.goodsViews.layer.borderWidth=1.0;
    self.consigneeView.layer.borderWidth=1.0;
    self.distributionView.layer.borderWidth=1.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewLoad{

    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setBackgroundColor:[UIColor redColor]];
    [lButton setTitle:@"提交订单" forState:UIControlStateNormal];
    lButton.frame=CGRectMake(220, 5, 100, 50);
    [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.payView addSubview:lButton];

}
#pragma mark - Button
-(void)lButton:(UIButton *)sender{
    NSLog(@"提交订单");

}
@end
