//
//  shoppingcart.m
//  shopping cart
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 刘冬. All rights reserved.
//

#import "shoppingcart.h"
#import "orderInformationViewController.h"
#import "shoppingcartcustomCell.h"
#import "singleShopcart.h"
#import "ParticularGoodsViewController.h"
#import "TabBarViewController.h"
@interface shoppingcart ()

@end

@implementation shoppingcart{
    NSDictionary *dataDic1;
    NSMutableArray *dataarray;
    UIView *lCustomView;
    NSString *cartID;
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"我的购物车";
        //        UITabBarItem *lTabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的购物车" image:nil tag:0];
        //        [self setTabBarItem:lTabBarItem];
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    dataarray=[[NSMutableArray alloc]init];
    dataDic1=[[NSDictionary alloc]init];
    [self setdata];
    [self customViewLoad];
    self.MyTabeleView.dataSource=self;
    self.MyTabeleView.delegate=self;
    self.tabBarController.title=@"我的购物车";
        // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [dataarray removeAllObjects];
    animated=YES;
    [self setdata];
    [self customViewLoad];
    self.MyTabeleView.dataSource=self;
    self.MyTabeleView.delegate=self;

}
#pragma mark - userdata
-(void)setdata{
 //同步
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/getcart.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%d",20];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",lDic);
    NSDictionary *lDic1=[lDic objectForKey:@"msg"];
//单例
    [singleShopcart setSingleSopCart].shareshopcart=[lDic objectForKey:@"msg"];
//    if ([lDic1 objectForKey:@"info"]==nil) {
//        NSLog(<#NSString *format, ...#>)
//    }else{
    NSArray *arr=[lDic1 objectForKey:@"info"];
    for (int i=0; i<arr.count; i++) {
    NSDictionary *ldic=[arr objectAtIndex:i];
    [dataarray addObject:ldic];
      }

    dataDic1=[lDic1 objectForKey:@"count"];
//    }
}
#pragma mark - customView
-(void)customViewLoad{
    lCustomView=[[UIView alloc]initWithFrame:CGRectMake(0, 90, 320,50)];
    [lCustomView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:lCustomView];
        _lnumlabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 2.5, 100, 20)];
    [lCustomView addSubview:_lnumlabel];
    _lnumlabel1=[[UILabel alloc]initWithFrame:CGRectMake(50, 22.5, 200, 20)];
    [lCustomView addSubview:_lnumlabel1];
    _lnumlabel.text=[NSString stringWithFormat:@"数量:%d",dataarray.count];
    
    [_lnumlabel setBackgroundColor:[UIColor clearColor]];
    _lnumlabel.textAlignment=NSTextAlignmentCenter;
    _lnumlabel1.text=[NSString stringWithFormat:@"总价:%@",[[dataarray lastObject]objectForKey:@"amount"]];
   [_lnumlabel1 setBackgroundColor:[UIColor clearColor]];
    _lnumlabel1.textAlignment=NSTextAlignmentCenter;
    
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setTag:147];
    [[self.view viewWithTag:147] setBackgroundColor:[UIColor redColor]];
    [lButton setTitle:@"去结算" forState:UIControlStateNormal];
    lButton.frame=CGRectMake(250, 5, 60, 40);
    [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
    [lCustomView addSubview:lButton];
    
}
#pragma mark - Button

-(void)lButton:(UIButton *)sender{
    
    NSLog(@"结算");
//    if (dataarray==nil) {
//        UIAlertView *lAlertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"购物车没有商品" delegate:self cancelButtonTitle:@"返回商城继续购物" otherButtonTitles:nil, nil];
//        [lAlertView show];
//    }else{
    orderInformationViewController *orderInfo=[[orderInformationViewController alloc]init];
    orderInfo.title=@"核对订单";
    [self.navigationController pushViewController:orderInfo animated:YES];
//}
    
}
#pragma mark -  AlertViewdelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        TabBarViewController *ltabbar=[[TabBarViewController alloc]init];
        [self presentViewController:ltabbar animated:YES completion:nil];
    }
}
#pragma mark - Table view delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *key=@"商品";
    return key;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//     NSLog(@"aa:%d",dataarray.count);
//    if (dataarray==nil) {
//    return 1;
//    }else{
    return dataarray.count;
//    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    shoppingcartcustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[shoppingcartcustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (dataarray==nil) {
    cell.textLabel.text=@"购物车没有商品";
    }else{
    
    NSDictionary *lDic=[dataarray objectAtIndex:[indexPath row]];
//    NSLog(@"asdasd:%@",lDic);
    
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,[lDic objectForKey:@"headerimage"]]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%d",20];
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
}
    return cell;

}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (dataarray==nil) {
//        return NO;
//    }else{
    return YES;
//    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%D",[indexPath row]);
    NSDictionary *ldic= [dataarray objectAtIndex:[indexPath row]];
    cartID=[[NSString alloc]initWithString:[ldic objectForKey:@"cartid"]];
    NSLog(@"%@",cartID);
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataarray removeObjectAtIndex:[indexPath row]];
//        [_MyTabeleView reloadData];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self deletedata];
        [self setdata];
//        [self customViewLoad];
        _lnumlabel.text=[NSString stringWithFormat:@"数量:%d",dataarray.count];
        _lnumlabel1.text=[NSString stringWithFormat:@"总价:%@",[[dataarray lastObject]objectForKey:@"amount"]];
        [_MyTabeleView reloadData];
       
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}
-(void)deletedata{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/deletecart.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"cartid=%@&customerid=%@",cartID,@"20"];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    
    

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    [self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>]
}
@end