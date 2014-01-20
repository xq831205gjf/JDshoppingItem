//
//  newaddress.h
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomImageView.h"
@interface newaddress : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *shouhuoren;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *tele;
- (IBAction)defaultaddress:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;
- (IBAction)view:(UIControl *)sender;
//-(void)settext1:(NSString *)text1 ;
//-(void)settext2:(NSString *)text2 ;
@property(nonatomic ,retain)NSString *lString;
@property(nonatomic ,retain)NSString *lString1;
@property (weak, nonatomic) IBOutlet UITextField *youbian;
@property (weak, nonatomic) IBOutlet UILabel *gougou;
@property (weak, nonatomic) IBOutlet UILabel *gougou1;
@property (weak, nonatomic) IBOutlet UITextField *xiangxi;



@end
