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

@implementation LogonViewController{
    BOOL markForUser;
}

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
    
    UILabel *lGreetLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, 260, 40)];
    lGreetLabel.backgroundColor = [UIColor clearColor];
    lGreetLabel.text = @"欢迎您体验此款购物软件";
    lGreetLabel.textColor = [UIColor cyanColor];
    lGreetLabel.shadowColor = [UIColor redColor];
    lGreetLabel.shadowOffset = CGSizeMake(1, 1.5);
    lGreetLabel.font = [UIFont systemFontOfSize:20];
    lGreetLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lGreetLabel];
    
    UILabel *lUserLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 90, 200, 30)];
    lUserLabel.backgroundColor = [UIColor clearColor];
    lUserLabel.text = @"用户名";
    lUserLabel.font = [UIFont systemFontOfSize:15];
    lUserLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lUserLabel];
   
    _lUserTextFied = [[UITextField alloc]initWithFrame:CGRectMake(60, 120, 200, 40)];
    _lUserTextFied.rightViewMode = UITextFieldViewModeUnlessEditing;
//    lUserTextFied.rightView = 
    _lUserTextFied.placeholder = @"请输入用户名";
    _lUserTextFied.font = [UIFont systemFontOfSize:16];
    _lUserTextFied.borderStyle = UITextBorderStyleBezel;
    [_lUserTextFied addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_lUserTextFied];
    
    UILabel *lPassWordLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 160, 200, 30)];
    lPassWordLabel.backgroundColor = [UIColor clearColor];
    lPassWordLabel.text = @"密码";
    lPassWordLabel.font = [UIFont systemFontOfSize:15];
    lPassWordLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lPassWordLabel];
    
    _lPassWordTextFied = [[UITextField alloc]initWithFrame:CGRectMake(60, 190, 200, 40)];
    _lPassWordTextFied.rightViewMode = UITextFieldViewModeUnlessEditing;
    //    lUserTextFied.rightView =
    _lPassWordTextFied.placeholder = @"请输入密码";
    _lPassWordTextFied.font = [UIFont systemFontOfSize:16];
    _lPassWordTextFied.borderStyle = UITextBorderStyleBezel;
    [_lPassWordTextFied addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_lPassWordTextFied];
    
    UIButton *lMarkButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 249, 14, 14)];
//    lMarkButton.layer.borderColor = (__bridge CGColorRef)([UIColor blackColor]);
    lMarkButton.layer.borderWidth = 1;
    lMarkButton.layer.cornerRadius = 3;
    lMarkButton.tag = 101;
    [lMarkButton setTitle:@" " forState:UIControlStateNormal];
    [lMarkButton addTarget:self action:@selector(markButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lMarkButton];
    
    UILabel *lMarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 240, 85, 30)];
    lMarkLabel.text = @"自动登录";
    lMarkLabel.font = [UIFont systemFontOfSize:14];
    lMarkLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lMarkLabel];

    
    UIButton *lLogonButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 280, 200, 40)];
    lLogonButton.layer.cornerRadius = 5;
    lLogonButton.backgroundColor = [UIColor redColor];
    [lLogonButton addTarget:self action:@selector(logonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [lLogonButton setTitle:@"登  录" forState:UIControlStateNormal];
    [self.view addSubview:lLogonButton];

    UILabel *lRegisterLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 340, 200, 30)];
    lRegisterLabel.text = @"新用户？ 请先注册个人用户信息";
    lRegisterLabel.textColor = [UIColor blueColor];
    lRegisterLabel.font = [UIFont systemFontOfSize:14];
    lRegisterLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lRegisterLabel];
    
    UIButton *lRegisterButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 390, 200, 40)];
    lRegisterButton.layer.cornerRadius = 5;
    lRegisterButton.backgroundColor = [UIColor redColor];
    [lRegisterButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [lRegisterButton setTitle:@"注  册" forState:UIControlStateNormal];
    [self.view addSubview:lRegisterButton];
    
    UILabel *lUserRegisterLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 470, 200, 30)];
    lUserRegisterLabel.text = @"Personal Customer";
    lUserRegisterLabel.textColor = [UIColor blueColor];
    lUserRegisterLabel.font = [UIFont systemFontOfSize:14];
    lUserRegisterLabel.textAlignment = NSTextAlignmentCenter;
    lUserRegisterLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lUserRegisterLabel];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma Mark Click from Button
-(void)buttonClick:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)textClick{

}
-(void)markButtonClick:(UIButton *)sender{
    if (markForUser == false) {
        [sender setTitle:@"√" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        sender.titleLabel.font = [UIFont systemFontOfSize:14];
        sender.titleLabel.textAlignment = NSTextAlignmentCenter;
        markForUser = true;
        return;
    }
    if (markForUser == true) {
        [sender setTitle:@" " forState:UIControlStateNormal];
        markForUser = false;
        return;
    }
    
}
-(void)logonButtonClick:(UIButton *)sender{
    NSLog(@"hello");
    NSString *lstr = [NSString stringWithFormat:@"name=%@&password=%@",_lUserTextFied.text,_lPassWordTextFied.text];
    NSString *string = [NSString stringWithFormat:@"http://%@/shop/login.php",GoodsIP];
    NSURL *lurl = [NSURL URLWithString:string];
    NSMutableURLRequest *lmutableURLRequest = [NSMutableURLRequest requestWithURL:lurl];
    [lmutableURLRequest setHTTPMethod:@"post"];
    [lmutableURLRequest setHTTPBody:[lstr dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *lURLConnection = [NSURLConnection connectionWithRequest:lmutableURLRequest delegate:self];
    [lURLConnection start];
}
-(void)registerButtonClick:(UIButton *)sender{
    RegisterViewController *lRegistreVC = [[RegisterViewController alloc]init];
    [self presentViewController:lRegistreVC animated:YES completion:nil];
}

#pragma mark daili
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [ldata setLength:0];
    NSLog(@"delay");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [ldata appendData:data];
    NSLog(@"begin");
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *lstr = [[NSString alloc]initWithData:ldata encoding:NSUTF8StringEncoding];
    NSLog(@"%@",lstr);
    NSLog(@"finish");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
    // Dispose of any resources that can be recreated.
}

@end
