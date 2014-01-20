//
//  OrderViewController.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-17.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "OrderViewController.h"
#import "ListOperateSingle.h"
#import "orderCell.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dataarray=[[NSMutableArray alloc]initWithArray:[ListOperateSingle defauleListOperte].goodsCart];

        //NSLog(@"%@",dataarray);
        self.title=@"订单详情";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Mytableview.delegate=self;
    self.Mytableview.dataSource=self;
    self.orderCode.text=[NSString stringWithFormat:@"订单号：%@",[ListOperateSingle defauleListOperte].ordercode];
    self.orderCode.textColor=[UIColor redColor];
    self.orderCode.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
    self.money.text=[NSString stringWithFormat:@"￥%@",[ListOperateSingle defauleListOperte].amount];
    if ([[ListOperateSingle defauleListOperte].state integerValue]==0) {
        self.state.textColor=[UIColor redColor];
        self.state.text=@"未支付";
    }else{
        self.state.textColor=[UIColor blueColor];
        self.state.text=@"已支付";
    }
    // Do any additional setup after loading the view from its nib.
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataarray.count;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    orderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //NSDictionary *dic1=[dataarray objectAtIndex:[indexPath row]];
        cell = [[orderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle=NO;
//    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
//    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    NSDictionary *lDic=[dataarray objectAtIndex:[indexPath row]];
    //    NSLog(@"asdasd:%@",lDic);
    
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,[lDic objectForKey:@"headerimage"]]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%d",3];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *asd=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:asd completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.goodsHeadImage.image=[UIImage imageWithData:data];
        });
        
    }
     ];
    
    cell.goodsName.text=[lDic objectForKey:@"name"];
    cell.goodsPrice.text=[lDic objectForKey:@"price"];
    cell.goodsSzie.text=[lDic objectForKey:@"size"];
    cell.goodsColor.text=[lDic objectForKey:@"color"];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
