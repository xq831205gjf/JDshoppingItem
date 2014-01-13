//
//  RegisterViewController.h
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ViewController.h"

@interface RegisterViewController : ViewController<NSURLConnectionDataDelegate>{
    NSMutableData *ldata;
}
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *endPassWordText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *telephoneText;
- (IBAction)Didandonexit:(UITextField *)sender;

@end
