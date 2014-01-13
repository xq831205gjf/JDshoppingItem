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
//    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
//    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    UILabel *lTishiText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    lTishiText.backgroundColor = [UIColor grayColor];
    lTishiText.text = @" 您尚未登录";
    [lTishiText setFont:[UIFont systemFontOfSize:18]];
    lTishiText.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lTishiText];
    
    UIButton *lbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lbutton.frame = CGRectMake(280, 5, 30, 30);
    [lbutton setTitle:@"X" forState:UIControlStateNormal];
    [lbutton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lbutton];
    
    UILabel *lUserLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 90, 200, 30)];
    lUserLabel.backgroundColor = [UIColor clearColor];
    lUserLabel.text = @"用户名";
    lUserLabel.font = [UIFont systemFontOfSize:15];
    lUserLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lUserLabel];
   
    UITextField *lUserTextFied = [[UITextField alloc]initWithFrame:CGRectMake(60, 120, 200, 40)];
    lUserTextFied.placeholder = @"hello";
    lUserTextFied.font = [UIFont systemFontOfSize:18];
    lUserTextFied.borderStyle = UITextBorderStyleBezel;
    [lUserTextFied addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:lUserTextFied];


    // Do any additional setup after loading the view from its nib.
}
-(void)buttonClick:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)textClick{
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
