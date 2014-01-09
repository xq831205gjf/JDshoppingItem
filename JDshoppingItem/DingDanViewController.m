//
//  DingDanViewController.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "DingDanViewController.h"
#import "DingdanCell.h"

@interface DingDanViewController ()

@end

@implementation DingDanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"我的订单";
        dataarray=[[NSMutableArray alloc]init];
        dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"201312250954193",@"ordercode",@"2013-12-25 09:54:19",@"date",@"19160.00",@"amount",@"0",@"state", nil];
        NSDictionary *dd=[[NSDictionary alloc]initWithObjectsAndKeys:@"201312250954194",@"ordercode",@"2013-12-25 09:54:19",@"date",@"19160.00",@"amount",@"1",@"state", nil];
        [dataarray addObject:dd];
        [dataarray addObject:dic];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
    //    if (oneCell.accessoryType == UITableViewCellAccessoryNone) {
    //        oneCell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    } else
    //        oneCell.accessoryType = UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
