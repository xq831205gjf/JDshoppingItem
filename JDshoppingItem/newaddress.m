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
    self.tele.delegate=self;
    _address.autocapitalizationType=UITextAutocorrectionTypeYes;
//    _email.autocapitalizationType=UITextAutocorrectionTypeYes;
    _shouhuoren.autocapitalizationType=UITextAutocorrectionTypeYes;
    
    UIView *lView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 220)];
    
    CustomPickerView *lPickerView=[[CustomPickerView alloc]initWithFrame:CGRectMake(0, 40, 320, 200)];
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lButton setFrame:CGRectMake(260, 0, 60, 40)];
    [lButton setTitle:@"完成" forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(lbutton:) forControlEvents:UIControlEventTouchUpInside];
    [lView addSubview:lButton];
    [lView addSubview:lPickerView];
    _address.inputView=lView;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Button
-(void)lbutton:(UIButton *)sender{
    
    NSLog(@"完成");
//    _address.text=;
    NSLog(@"1%@",self.lString);
      [_address resignFirstResponder];
}

- (IBAction)defaultaddress:(UIButton *)sender {
 NSLog(@"defaultaddress");
}

- (IBAction)save:(UIButton *)sender {
    NSLog(@"save");
}

- (IBAction)view:(UIControl *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        }];
    [_shouhuoren resignFirstResponder];
    [_tele resignFirstResponder];
    [_address resignFirstResponder];
    [_email resignFirstResponder];
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
            
        default:
            break;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_shouhuoren resignFirstResponder];
    [_tele resignFirstResponder];
    [_address resignFirstResponder];
    [_email resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        
    }];
    return YES;
}
-(void)settext2:(NSString *)text2{
    self.lString1 =[[NSString alloc]initWithString:text2];
//      NSLog(@"2%@",lString1);


}
-(void)settext1:(NSString *)text1{
//    NSString *lstingText = text1;
//    NSLog(@"%@",lstingText);
//    _address.text = @"hello";
     self.lString = @"hello";
    NSLog(@"11%@",self.lString);
    
}
@end
