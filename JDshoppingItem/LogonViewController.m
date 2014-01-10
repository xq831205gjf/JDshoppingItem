//
//  LogonViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "LogonViewController.h"
#import "TabBarViewController.h"
#import "RegisterViewController.h"


@interface LogonViewController ()

@end

@implementation LogonViewController

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
    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    UILabel *lTishiText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    lTishiText.backgroundColor = [UIColor grayColor];
    lTishiText.alpha = 0.5;
    lTishiText.text = @"您尚未登录";
    lTishiText.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lTishiText];
    
    UIButton *lbutton = [[UIButton alloc]initWithFrame:CGRectMake(280, 5, 30, 30)];
    lbutton.backgroundColor = [UIColor blueColor];
    lbutton.alpha = 0.5;
    [lbutton setTitle:@"X" forState:UIControlStateNormal];
    [lbutton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lbutton];
    


    // Do any additional setup after loading the view from its nib.
}
-(void)buttonClick:(UIButton *)sender{
    NSLog(@"hello");
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

@end
