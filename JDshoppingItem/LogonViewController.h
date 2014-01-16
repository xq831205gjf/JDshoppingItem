//
//  LogonViewController.h
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
@interface LogonViewController : ViewController<NSURLConnectionDataDelegate,registerInfoDelegate>{
    NSMutableData *ldata;
}

@property(nonatomic,copy) UITextField *lUserTextFied;
@property(nonatomic,copy) UITextField *lPassWordTextFied;
@end
