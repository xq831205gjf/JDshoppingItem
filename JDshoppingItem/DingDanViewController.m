//
//  DingDanViewController.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "DingDanViewController.h"
#import "DingdanCell.h"
#import "ListOperateSingle.h"
#import "OrderViewController.h"

@interface DingDanViewController ()

@end

@implementation DingDanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"我的订单";
//        NSArray *arrr=[ListOperateSingle defauleListOperte].dingdan;
        
        dataarray=[[NSMutableArray alloc]initWithArray:[ListOperateSingle defauleListOperte].dingdan];
        NSLog(@"%@",dataarray);
//        dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"201312250954193",@"ordercode",@"2013-12-25 09:54:19",@"date",@"19160.00",@"amount",@"0",@"state", nil];
//        NSDictionary *dd=[[NSDictionary alloc]initWithObjectsAndKeys:@"201312250954194",@"ordercode",@"2013-12-25 09:54:19",@"date",@"19160.00",@"amount",@"1",@"state", nil];
        
        
        //[dataarray addObject:[ListOperateSingle defauleListOperte].dingdan];
        //[dataarray addObject:dic];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.MyTableView.dataSource=self;
    self.MyTableView.delegate=self;
    self.MyTableView.bounces=NO;
    self.MyTableView.backgroundColor=[UIColor lightGrayColor];
    // Do any additional setup after loading the view from its nib.
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *key=@"我的订单";
    return key;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    DingdanCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSDictionary *dic1=[dataarray objectAtIndex:[indexPath row]];
        cell = [[DingdanCell alloc]initWithDictionary:dic1];
    }
    cell.selectionStyle=NO;
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataarray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
  
    NSDictionary *dic1=[dataarray objectAtIndex:[indexPath row]];
    [ListOperateSingle defauleListOperte].goodsCart=[dic1 objectForKey:@"carts"];
    NSArray *arrrrrr=[ListOperateSingle defauleListOperte].goodsCart;
    NSLog(@"%@",arrrrrr);
    [ListOperateSingle defauleListOperte].state=[dic1 objectForKey:@"state"];
    [ListOperateSingle defauleListOperte].amount=[dic1 objectForKey:@"amount"];
    [ListOperateSingle defauleListOperte].ordercode=[dic1 objectForKey:@"ordercode"];
      OrderViewController *order=[[OrderViewController alloc]init];
    [self.navigationController pushViewController:order animated:YES];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
