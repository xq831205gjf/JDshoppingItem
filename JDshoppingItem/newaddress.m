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
    lPickerView.ldelegate=(id)self;
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
}
#pragma mark-UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 2:{
//             NSLog(@"b");
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            [self checkemail];
            break;
            }
        case 3:{
         
            [UIView animateWithDuration:0.5 animations:^{
                self.view.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-180);}];
            [self checketele];
            break;
        }
            
        default:
            break;
    }
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 2:{
            NSLog(@"a");
            [self checkemail];
            break;
        }
        case 3:{
            NSLog(@"b");
            [self checketele];
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
   NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/addaddress.php",GoodsIP]];
    
    NSString *checkemail=[NSString stringWithFormat:@"email=%@",_email.text];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"get"];
    [lRequest setHTTPBody:[checkemail dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *aa=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:aa completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",data);
//            if (data.length>0 && error==nil) {
//                
//                
//        
//            }
            
            });
        
    }
     ];

}
-(void)checketele{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/checketelephone.php",GoodsIP]];
    NSString *checketele=[NSString stringWithFormat:@"telephone=%@",_tele.text];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"get"];
    [lRequest setHTTPBody:[checketele dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *aa=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:aa completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
//            if (data.length>0 && error==nil) {
//                
            NSString *aaa=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"adas:%@",aaa);
//
//            }
            
        });
        
    }
     ];
    
}

-(void)saveaddress{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/addaddress.php",GoodsIP]];
    NSString *checketele=[NSString stringWithFormat:@"telephone=%@",_address.text];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[checketele dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *aa=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:aa completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            //            if (data.length>0 && error==nil) {
            NSString *aaa=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"adas:%@",aaa);
            //
            //
            //            }
            
        });
        
    }
     ];
    
}

@end
