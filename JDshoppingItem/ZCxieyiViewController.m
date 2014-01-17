//
//  ZCxieyiViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-17.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ZCxieyiViewController.h"

@interface ZCxieyiViewController ()

@end

@implementation ZCxieyiViewController

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
	// Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    label.text = @"1．用户必须：自行配备上网的所需设备。2．用户在本网站上交易平台上不得发布下列违法信息：(1)反对宪法所确定的基本原则的；(2).危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；(3).损害国家荣誉和利益的；(4).煽动民族仇恨、民族歧视，破坏民族团结的；(5).破坏国家宗教政策，宣扬邪教和封建迷信的；(6).散布谣言，扰乱社会秩序，破坏社会稳定的；(7).散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；(8).侮辱或者诽谤他人，侵害他人合法权益的；(9).含有法律、行政法规禁止的其他内容的。3． 有关个人资料用户同意：(1) 提供及时、详尽及准确的个人资料。(2).同意接收来自本网站的信息。(3) 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。(4)本网站不公开用户的姓名、地址、电子邮箱和笔名，以下情况除外：（a）用户授权本网站透露这些信息。(b）相应的法律及程序要求本网站提供用户的个人资料。如果用户提供的资料包含有不正确的信息，本网站保留结束用户使用本网站信息服务资格的权利。4. 用户在注册时应当选择稳定性及安全性相对较好的电子邮箱，并且同意接受并阅读本网站发往用户的各类电子邮件。如用户未及时从自己的电子邮箱接受电子邮件或因用户电子邮箱或用户电子邮件接收及阅读程序本身的问题使电子邮件无法正常接收或阅读的，只要本网站成功发送了电子邮件，应当视为用户已经接收到相关的电子邮件。电子邮件在发信服务器上所记录的发出时间视为送达时间。";
    label.font = [UIFont systemFontOfSize:13];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    UILabel *lTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    lTitleLabel.text = @"《LD用户注册协议》";
    lTitleLabel.textColor =[UIColor redColor];
    lTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lTitleLabel];
    
    UIButton *jieshouButton = [[UIButton alloc]initWithFrame:CGRectMake( 210, 490, 60, 30)];
    [jieshouButton addTarget: self action:@selector(jieshouClick:) forControlEvents:UIControlEventTouchUpInside];
    [jieshouButton setTitle:@"我接受" forState:UIControlStateNormal];
    jieshouButton.layer.cornerRadius = 4;
    jieshouButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:jieshouButton];
    
    UIButton *fanduiButton = [[UIButton alloc]initWithFrame:CGRectMake( 50, 490, 60, 30)];
    [fanduiButton addTarget: self action:@selector(fanduiButton:) forControlEvents:UIControlEventTouchUpInside];
    [fanduiButton setTitle:@"我反对" forState:UIControlStateNormal];
    fanduiButton.layer.cornerRadius = 4;
    fanduiButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fanduiButton];
}

-(void)jieshouClick:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"post" object:@"1"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)fanduiButton:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"post" object:@"0"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
