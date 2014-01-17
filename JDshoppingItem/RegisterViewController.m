//
//  RegisterViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "RegisterViewController.h"
#import "TabBarViewController.h"
#import "ZCxieyiViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController{
    BOOL markForUser ;//纪录是否接受注册协议的状态
    NSArray *lCheckArray;
    NSArray *lnameOfTextfield;
    BOOL IsCheckTextfield;//检查是否通过textfield发送的网络请求
    int remenmberTag;
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
    _nameText.delegate=self;
    _passwordText.delegate=self;
    _endPassWordText.delegate = self;
    _emailText.delegate=self;
    _telephoneText.delegate=self;
    lCheckArray = @[@"checkname",@"checkpassword",@"checkemail",@"checktelephone"];
    lnameOfTextfield = @[@"name",@"password",@"email",@"telephone"];
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
    ZCxieyiViewController *lzcVC = [[ZCxieyiViewController alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationOfButton:) name:@"post" object:nil];
    [self presentViewController:lzcVC animated:YES completion:nil];
}
-(void)notificationOfButton:(NSNotification *)sender{
    BOOL lBool=[[sender object]boolValue];
    UIButton *lbutton = (UIButton *)[self.view viewWithTag:102];
    if (lBool) {
        [lbutton setTitle:@"√" forState:UIControlStateNormal];
        [lbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        lbutton.titleLabel.font = [UIFont systemFontOfSize:14];
        lbutton.titleLabel.textAlignment = NSTextAlignmentCenter;
        markForUser = false;
    }else{
        [lbutton setTitle:@" " forState:UIControlStateNormal];
        markForUser = true;
    }
}
-(void)registerButtonClick:(UIButton *)sender{
    if (markForUser == true) {
        UIAlertView *lAlertView = [[UIAlertView alloc]initWithTitle:@"您好!" message:@"注册之前，希望您接受LD用户注册协议" delegate:self cancelButtonTitle:@"确 定" otherButtonTitles:nil];
        [lAlertView show];
        return;
    }

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
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [ldata appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary *ldicionary = [NSJSONSerialization JSONObjectWithData:ldata options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"54556%@",ldicionary);
    if (IsCheckTextfield) {
        if ([[ldicionary objectForKey:@"error"] intValue]) {
            IsCheckTextfield = NO;
            return;
        }
        if ([[ldicionary objectForKey:@"msg"] intValue]) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(295, 110+(remenmberTag-1001)*45, 20, 20)];
            label.text = @"√";
            label.textColor = [UIColor blueColor];
            [self.view addSubview:label];
        }else{
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(295, 110+(remenmberTag-1001)*45, 20, 20)];
            label.text = @"x";
            label.textColor = [UIColor redColor];
            [self.view addSubview:label];
        }
        IsCheckTextfield = false;
        return;
    }
    if (![[ldicionary objectForKey:@"error"] intValue]) {
        UIAlertView *lAlertView = [[UIAlertView alloc]initWithTitle:@"您好!" message:@"注册成功，欢迎登录使用" delegate:self cancelButtonTitle:@"返 回" otherButtonTitles:@"登 录",nil];
        [lAlertView show];
    }else{
        UIAlertView *lAlertView = [[UIAlertView alloc]initWithTitle:@"对不起!" message:@"注册失败，请仔细填写信息" delegate:self cancelButtonTitle:@"退 出" otherButtonTitles:nil];
        [lAlertView show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%i",buttonIndex);
    if (buttonIndex == 1) {
        [self.delegate registerInfoOfname:_nameText.text andPassword:_passwordText.text];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
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

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 1005) {
        if ([_passwordText.text isEqualToString:_endPassWordText.text]) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(295, 110+2*45, 20, 20)];
            label.text = @"√";
            label.textColor = [UIColor blueColor];
            [self.view addSubview:label];
        }else{
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(295, 110+2*45, 20, 20)];
            label.text = @"x";
            label.textColor = [UIColor redColor];
            [self.view addSubview:label];
        }
        return;
    }
    for (int i = 0; i<4; i++) {
        if (textField.tag == 1001+i) {
            if (i>1) {
                remenmberTag = textField.tag+1;
            }else{
            remenmberTag = textField.tag;            
            }
            IsCheckTextfield = true;
            NSString *lstr = [NSString stringWithFormat:@"%@=%@",[lnameOfTextfield objectAtIndex:i],textField.text];
            NSString *lString = [NSString stringWithFormat:@"http://%@/shop/%@.php?%@",GoodsIP,[lCheckArray objectAtIndex:i],lstr];
            NSURL *lURL = [NSURL URLWithString:lString];
            NSMutableURLRequest *lmutableURLRequest = [NSMutableURLRequest requestWithURL:lURL];
            [lmutableURLRequest setHTTPMethod:@"get"];
            NSURLConnection *lURLConnection = [NSURLConnection connectionWithRequest:lmutableURLRequest delegate:self];
            [lURLConnection start];
            return;
        }
    }
    
}
@end
