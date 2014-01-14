//
//  RegisterViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "RegisterViewController.h"
#import "TabBarViewController.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController{
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
    ldata = [[NSMutableData alloc]init];
    UILabel *lTishiText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    lTishiText.backgroundColor = [UIColor grayColor];
    lTishiText.text = @" 请填写您的个人信息";
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
    lGreetLabel.text = @"欢迎您注册此款购物软件";
    lGreetLabel.textColor = [UIColor blueColor];
    lGreetLabel.shadowColor = [UIColor redColor];
    lGreetLabel.shadowOffset = CGSizeMake(1, 1.5);
    lGreetLabel.font = [UIFont systemFontOfSize:20];
    lGreetLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lGreetLabel];
    
    UIButton *lMarkButton = [[UIButton alloc]initWithFrame:CGRectMake(35, 369, 14, 14)];
    lMarkButton.layer.borderWidth = 1;
    lMarkButton.layer.cornerRadius = 3;
    lMarkButton.tag = 102;
    [lMarkButton setTitle:@"√" forState:UIControlStateNormal];
    [lMarkButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    lMarkButton.titleLabel.font = [UIFont systemFontOfSize:14];
    lMarkButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [lMarkButton addTarget:self action:@selector(markButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lMarkButton];
    
    UILabel *lMarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 360, 260, 30)];
    lMarkLabel.text = @"我已阅读并同意《                           》";
    lMarkLabel.font = [UIFont systemFontOfSize:14];
    lMarkLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lMarkLabel];
    
    UIButton *lXieyiButton = [[UIButton alloc]initWithFrame:CGRectMake(156, 360, 120, 30)];
    lXieyiButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [lXieyiButton setTitle:@"LD用户注册协议" forState:UIControlStateNormal];
    [lXieyiButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [lXieyiButton addTarget:self action:@selector(xieyiButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lXieyiButton];

    UIButton *lRegisterButton = [[UIButton alloc]initWithFrame:CGRectMake(35, 420, 240, 40)];
    lRegisterButton.layer.cornerRadius = 5;
    lRegisterButton.backgroundColor = [UIColor redColor];
    [lRegisterButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [lRegisterButton setTitle:@"立  即  注  册" forState:UIControlStateNormal];
    [self.view addSubview:lRegisterButton];
    
    UILabel *lRegisterLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 470, 200, 30)];
    lRegisterLabel.text = @"Personal Customer";
    lRegisterLabel.textColor = [UIColor blueColor];
    lRegisterLabel.font = [UIFont systemFontOfSize:14];
    lRegisterLabel.textAlignment = NSTextAlignmentCenter;
    lRegisterLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lRegisterLabel];
        // Do any additional setup after loading the view from its nib.
}

#pragma Mark Click from Button
-(void)buttonClick:(UIButton *)sender{
//    TabBarViewController *lTabBarVC = [[TabBarViewController alloc]init];
//    [self presentViewController:lTabBarVC animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)markButtonClick:(UIButton *)sender{
    if (markForUser == true) {
        [sender setTitle:@"√" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        sender.titleLabel.font = [UIFont systemFontOfSize:14];
        sender.titleLabel.textAlignment = NSTextAlignmentCenter;
        markForUser = false;
        return;
    }
    if (markForUser == false) {
        [sender setTitle:@" " forState:UIControlStateNormal];
        markForUser = true;
        return;
    }
}
-(void)xieyiButtonClick:(UIButton *)sender{
    NSLog(@"hello");
}
-(void)registerButtonClick:(UIButton *)sender{
    NSLog(@"hello");
    NSString *lstr = [NSString stringWithFormat:@"name=%@&password=%@&email=%@&telephone=%@",_nameText.text,_passwordText.text,_emailText.text,_telephoneText.text];
    NSString *string = [NSString stringWithFormat:@"http://%@/shop/register.php",GoodsIP];
    NSURL *lurl = [NSURL URLWithString:string];
    NSMutableURLRequest *lmutableURLRequest = [NSMutableURLRequest requestWithURL:lurl];
    [lmutableURLRequest setHTTPMethod:@"post"];
    [lmutableURLRequest setHTTPBody:[lstr dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *lURLConnection = [NSURLConnection connectionWithRequest:lmutableURLRequest delegate:self];
    [lURLConnection start];

}

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

- (IBAction)Didandonexit:(UITextField *)sender {
    if (![_passwordText.text isEqualToString:_endPassWordText.text]) {
        UIAlertView *lAlertView = [[UIAlertView alloc]initWithTitle:@"对不起!" message:@"密码不一致" delegate:self cancelButtonTitle:@"退出" otherButtonTitles: nil];
        [lAlertView show];
        _endPassWordText.text = nil;
    }
}
@end
