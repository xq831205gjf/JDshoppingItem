//
//  submitViewController.m
//  JDshoppingItem
//
//  Created by TY on 14-1-13.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "submitViewController.h"
#import "DingDanViewController.h"
#import "singleShopcart.h"
@interface submitViewController ()

@end

@implementation submitViewController{

    NSDictionary *lData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"订单提交";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void)viewDidAppear:(BOOL)animated{

    lData=[[NSDictionary alloc]init];
    [self setdata];
    _MyView.layer.cornerRadius=10.0;
    UILabel *lLabel= [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 280, 60)];
    lLabel.numberOfLines=0;
    lLabel.backgroundColor=[UIColor clearColor];
    lLabel.text=@"感谢你在本店购物,物品已购买成功，请记住订单号";
    [_MyView addSubview:lLabel];
    UILabel *lLabel1= [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 280, 40)];
    lLabel1.numberOfLines=0;
    lLabel1.textAlignment=NSTextAlignmentCenter;
    lLabel1.textColor=[UIColor redColor];
    lLabel1.backgroundColor=[UIColor clearColor];
    NSDictionary *ldingdanhao1 =[lData objectForKey:@"msg"];
    NSArray *ldingdanhao2=[ldingdanhao1 objectForKey:@"info"];
    NSString *ldingdanhao=[[ldingdanhao2 lastObject]objectForKey:@"ordercode"];
    lLabel1.text=[NSString stringWithFormat:@"订单号：  %@",ldingdanhao];
    [_MyView addSubview:lLabel1];
    
    UILabel *lLabel2= [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    lLabel2.numberOfLines=0;
    lLabel2.textAlignment=NSTextAlignmentCenter;
    lLabel2.textColor=[UIColor redColor];
    lLabel2.backgroundColor=[UIColor clearColor];
    NSDictionary *ldRR=[[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"info"]lastObject];
    NSString *zongjie=[ldRR objectForKey:@"amount"];
    lLabel2.text=[NSString stringWithFormat:@"应付金额：  %@",zongjie];
    [_MyView addSubview:lLabel2];


}
#pragma mark - Button
- (IBAction)lButton:(UIButton *)sender {
    NSLog(@"查看订单");
    DingDanViewController *lDingDan=[[DingDanViewController alloc]init];
    [self.navigationController pushViewController:lDingDan animated:YES];
}

- (IBAction)payButton:(UIButton *)sender {
    NSLog(@"支付");
//    UIViewController *lView=[[UIViewController alloc]init];
//    UIView *lView=[[UIView alloc]init];
    

}
-(void)setdata{
    //同步
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/getorder.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%d",50];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    lData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
}
@end
