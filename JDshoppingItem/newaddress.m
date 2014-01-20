//
//  newaddress.m
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import "newaddress.h"
#import "CustomPickerView.h"

@interface newaddress ()

@end

@implementation newaddress{

//    NSString *lString;
//    NSString *lString1;
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
//    self.lString=@"1111";
    // Do any additional setup after loading the view from its nib.
    _shouhuoren.delegate=self;
    _address.delegate=self;
    _email.delegate=self;
    _youbian.delegate=self;
    self.tele.delegate=self;
    _xiangxi.delegate=self;
    _address.autocapitalizationType=UITextAutocorrectionTypeYes;
//    _email.autocapitalizationType=UITextAutocorrectionTypeYes;
    _shouhuoren.autocapitalizationType=UITextAutocorrectionTypeYes;
    _gougou.hidden=YES;
    _gougou1.hidden=YES;
    UIView *lView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 220)];
    
    CustomPickerView *lPickerView=[[CustomPickerView alloc]initWithFrame:CGRectMake(0, 40, 320, 200)];
    lPickerView.ldelegate=(id)self;
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lButton setFrame:CGRectMake(260, 0, 60, 40)];
    [lButton setTitle:@"完成" forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(lbutton:) forControlEvents:UIControlEventTouchUpInside];
    [lView addSubview:lButton];
    [lView addSubview:lPickerView];
    _address.inputView=lView;

    
}
-(void)viewDidAppear:(BOOL)animated{

    _gougou.hidden=YES;
    _gougou1.hidden=YES;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Button
-(void)lbutton:(UIButton *)sender{
    
    NSLog(@"完成");
    _address.text=[_lString1 stringByAppendingString:_lString];
//    NSLog(@"1%@",self.lString1);
      [_address resignFirstResponder];
}

- (IBAction)defaultaddress:(UIButton *)sender {
 NSLog(@"defaultaddress");
}

- (IBAction)save:(UIButton *)sender {
    NSLog(@"save");
    [self saveaddress];
}

- (IBAction)view:(UIControl *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        }];
    [_shouhuoren resignFirstResponder];
    [_tele resignFirstResponder];
    [_address resignFirstResponder];
    [_email resignFirstResponder];
    [_youbian resignFirstResponder];
    [_xiangxi resignFirstResponder];
}
#pragma mark-UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 2:{
//             NSLog(@"b");
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            break;
            }
        case 3:{
         
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            break;
        }
        case 4:{
            
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            break;
        }
        case 5:{
            
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            break;
        }

        default:
            break;
    }
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 2:{
//            NSLog(@"a");
            [self checkemail];
            break;
        }
        case 3:{
//            NSLog(@"b");
            [self checketele];
            break;
        }
        case 4:{
            //            NSLog(@"b");
//            [self checketele];
            break;
        }

            
        default:
            break;
    }


}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_youbian resignFirstResponder];
    [_shouhuoren resignFirstResponder];
    [_tele resignFirstResponder];
    [_address resignFirstResponder];
    [_email resignFirstResponder];
    [_xiangxi resignFirstResponder];
   
    [UIView animateWithDuration:0.5 animations:^{
        self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        
    }];
    return YES;
}

#pragma mark - CustomViewDelegate
-(void)customViewByDelete:(NSString *)customView{
    _lString1=customView;
    NSLog(@"_lString1:%@",_lString1);
}
-(void)customViewByString:(NSString *)customView{
    _lString=customView;
    NSLog(@"_lString%@",_lString);
}
#pragma mark -check
-(void)checkemail{
    NSString *checkemail=[NSString stringWithFormat:@"email=%@",_email.text];
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/checkemail.php?%@",GoodsIP,checkemail]];
    
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"get"];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    if ([[lDic objectForKey:@"msg"]intValue]) {
        _gougou.hidden=NO;
        _gougou1.text=@"√";
        _gougou.textColor=[UIColor blueColor];
    }else{
    _gougou.hidden=NO;
    _gougou.text=@"X";
    _gougou.textColor=[UIColor redColor];

    }

}
-(void)checketele{
    NSString *checketele=[NSString stringWithFormat:@"telephone=%@",_tele.text];
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/checktelephone.php?%@",GoodsIP,checketele]];
   
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"get"];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    if ([[lDic objectForKey:@"msg"]intValue]) {
        _gougou1.hidden=NO;
          _gougou1.text=@"√";
        _gougou1.textColor=[UIColor blueColor];
    }else{
        _gougou1.hidden=NO;
        _gougou1.text=@"X";
        _gougou1.textColor=[UIColor redColor];
        
    }

    
}


-(void)saveaddress{
    
    NSString *lString=_address.text;
    NSString *lString1=_xiangxi.text;
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/addaddress.php",GoodsIP]];
    NSString *userinfo=[NSString stringWithFormat:@"customerid=%@&name=%@&telephone=%@&code=%@&address=%@",@"50",_shouhuoren.text,_tele.text,_youbian.text,[lString stringByAppendingString:lString1]];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userinfo dataUsingEncoding:NSUTF8StringEncoding]];
       NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    if ([[lDic objectForKey:@"error"]intValue]==0) {
        UIAlertView *lAlet=[[UIAlertView alloc]initWithTitle:@"保存成功!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        lAlet.delegate=self;
        [lAlet show];
        
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==0) {
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
