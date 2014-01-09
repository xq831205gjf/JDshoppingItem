//
//  addressInfoViewController.m
//  ShopingAPP
//
//  Created by 219 on 14-1-6.
//  Copyright (c) 2014年 kai. All rights reserved.
//

#import "addressInfoViewController.h"
#import "addressCell.h"

@interface addressInfoViewController ()

@end

@implementation addressInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"地址管理";
        dataarray=[[NSMutableArray alloc]init];
        dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"刘东",@"name",@"18523983105",@"telephone",@"519000",@"code",@"重庆 南岸 茶园——————————h;kllkhlkhl;kh;",@"address", nil];
        NSDictionary *dd=[[NSDictionary alloc]initWithObjectsAndKeys:@"潇湘",@"name",@"18523983105",@"telephone",@"519000",@"code",@"重庆 南岸 茶园——————————信臻哥，考本科",@"address", nil];
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
    UIBarButtonItem *barr=[[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target:self action:@selector(addressClick:)];
    self.navigationItem.rightBarButtonItem=barr;
    // Do any additional setup after loading the view from its nib.
}
-(void)addressClick:(UIBarButtonItem *)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *key=@"我的地址";
    return key;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 111.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    addressCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSDictionary *dic1=[dataarray objectAtIndex:[indexPath row]];
        cell = [[addressCell alloc]initWithDictionary:dic1];
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


- (void)dealloc {
  
}
@end
