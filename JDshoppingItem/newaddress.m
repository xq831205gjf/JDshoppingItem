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

@implementation newaddress

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
    // Do any additional setup after loading the view from its nib.
    _shouhuoren.delegate=self;
    _address.delegate=self;
    _email.delegate=self;
    self.tele.delegate=self;
    _address.autocapitalizationType=UITextAutocorrectionTypeYes;
//    _email.autocapitalizationType=UITextAutocorrectionTypeYes;
    _shouhuoren.autocapitalizationType=UITextAutocorrectionTypeYes;
    CustomPickerView *lPickerView=[[CustomPickerView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    _address.inputView=lPickerView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Button
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
@end
