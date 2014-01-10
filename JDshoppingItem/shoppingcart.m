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

@interface shoppingcart ()

@end

@implementation shoppingcart{
    NSMutableArray *dataarray;
    UIView *lCustomView;
    
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
    [super viewDidLoad];
    self.MyTabeleView.dataSource=self;
    self.MyTabeleView.delegate=self;
    self.tabBarController.title=@"我的购物车";
    dataarray=[[NSMutableArray alloc]initWithObjects:@"信臻哥考本科",@"七月的尾巴你也是狮子座",@"八月份的前凑你是狮子座", nil];
    [self customViewLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - userInfo
-(void)userinfoView{
    
    
}
#pragma mark - customView
-(void)customViewLoad{
    lCustomView=[[UIView alloc]initWithFrame:CGRectMake(0, 90, 320,50)];
    [lCustomView setBackgroundColor:[UIColor whiteColor]];
    //    [lCustomView setAlpha:0.5];
    [self.view addSubview:lCustomView];
    //    UIImageView *lImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 50, 40)];
    //    lImageView.userInteractionEnabled=YES;
    //    [lImageView setImage:[UIImage imageNamed:@"title_back.png"]];
    //    UITapGestureRecognizer *lTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lTap:)];
    //    [lImageView addGestureRecognizer:lTap];
    //    [lCustomView addSubview:lImageView];
    _lnumlabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 2.5, 100, 20)];
    [lCustomView addSubview:_lnumlabel];
    _lnumlabel1=[[UILabel alloc]initWithFrame:CGRectMake(100, 22.5, 100, 20)];
    [lCustomView addSubview:_lnumlabel1];
    _lnumlabel.text=[NSString stringWithFormat:@"数量:%d",dataarray.count];
    [_lnumlabel setBackgroundColor:[UIColor clearColor]];
    _lnumlabel.textAlignment=NSTextAlignmentCenter;
    
    _lnumlabel1.text=[NSString stringWithFormat:@"总价:%d",5];
    [_lnumlabel1 setBackgroundColor:[UIColor clearColor]];
    _lnumlabel1.textAlignment=NSTextAlignmentCenter;
    
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setBackgroundColor:[UIColor redColor]];
    [lButton setTitle:@"去结算" forState:UIControlStateNormal];
    lButton.frame=CGRectMake(250, 5, 60, 40);
    [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
    [lCustomView addSubview:lButton];
    
}
#pragma mark - Button

-(void)lButton:(UIButton *)sender{
    
    NSLog(@"结算");
    orderInformationViewController *orderInfo=[[orderInformationViewController alloc]init];
    [self.navigationController pushViewController:orderInfo animated:YES];
    
    
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
    
    return dataarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    shoppingcartcustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[shoppingcartcustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //    cell.textLabel.text=[dataarray objectAtIndex:[indexPath row]];
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
        //        [_MyTabeleView reloadData];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
    //    if (oneCell.accessoryType == UITableViewCellAccessoryNone) {
    //
    //        oneCell.accessoryType = UITableViewCellAccessoryCheckmark;
    //
    //    } else{
    //
    //        oneCell.accessoryType = UITableViewCellAccessoryNone;
    //        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //        //        [dataarray removeObjectAtIndex:[indexPath row]];
    //        //        NSLog(@"%d",[indexPath row]);
    //        //        [_MyTabeleView reloadData];
    //        _lnumlabel.text=[NSString stringWithFormat:@"数量:%d",dataarray.count];
    //
    //        
    //    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end