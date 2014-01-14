//
//  SearchGoodsViewController.m
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-10.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "SearchGoodsViewController.h"
#import "ParticularGoodsViewController.h"
@interface SearchGoodsViewController ()

@end

@implementation SearchGoodsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"搜索";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lightBlue = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    lightOrange = [UIColor colorWithRed:255/255 green:140/255 blue:0 alpha:1];
    paleGreen = [UIColor colorWithRed:152/255 green:251/255 blue:152/255 alpha:1];
    hotPink = [UIColor colorWithRed:1 green:105/255 blue:180/255 alpha:1];
    // Do any additional setup after loading the view from its nib.
    [self CreatTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    lInfoArray = [[NSArray alloc]init];
    UITableView *lTableView = (UITableView *)[self.view viewWithTag:112];
    [lTableView reloadData];
    [self CreatSearchBar];
}
-(void)viewDidDisappear:(BOOL)animated{
    UIView *lView = [self.view viewWithTag:110];
    [lView removeFromSuperview];
}
-(void)CreatSearchBar{
    UIView *lView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    lView.backgroundColor = lightBlue;
    lView.tag = 110;
    [self.view addSubview:lView];
    
    UITextField *lSearchText = [[UITextField alloc]initWithFrame:CGRectMake(2.5, 2.5, 180, 35)];
    lSearchText.tag = 111;
    lSearchText.layer.cornerRadius = 5;
    lSearchText.backgroundColor = [UIColor whiteColor];
    [lView addSubview:lSearchText];
    
    UIButton *lEnterButton = [[UIButton alloc]initWithFrame:CGRectMake(205, 2.5, 45, 35)];
    [lEnterButton setTitle:@"确定" forState:UIControlStateNormal];
    [lView addSubview:lEnterButton];
    lEnterButton.backgroundColor = hotPink;
    lEnterButton.layer.cornerRadius = 5;
    [lEnterButton addTarget:self action:@selector(ClickEnterButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lCancelButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 2.5, 45, 35)];
    [lCancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [lView addSubview:lCancelButton];
    lCancelButton.backgroundColor = hotPink;
    lCancelButton.layer.cornerRadius = 5;
    [lCancelButton addTarget:self action:@selector(ClickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)CreatTableView{
    UITableView *lTableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 60, 280, 384)];
    lTableView.layer.cornerRadius = 10;
    lTableView.delegate = self;
    lTableView.tag = 112;
    lTableView.dataSource = self;
    [self.view addSubview:lTableView];
}
-(void)ClickEnterButton:(UIButton *)sender{
    UITextField *lSearchText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
    [self SearchGoods:lSearchText];
    [lSearchText resignFirstResponder];
}

-(void)ClickCancelButton:(UIButton *)sender{
    UITextField *lSearchText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
    lSearchText.text = @"";
    [lSearchText resignFirstResponder];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"搜索结果";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (lInfoArray.count != 0) {
        return lInfoArray.count;
    }else{
    return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"cell";
    UITableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (lCell == nil) {
        lCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cell];
    }
    if (lInfoArray.count == 0) {
        lCell.textLabel.font = [UIFont systemFontOfSize:25];
        lCell.detailTextLabel.text = nil;
        lCell.imageView.image = nil;
        lCell.textLabel.text = @"未进行搜索";
    }else{
        NSInteger row = [indexPath row];
        NSDictionary *lDic = [lInfoArray objectAtIndex:row];
        lCell.imageView.image = [UIImage imageNamed:@"u=2966281458,1284875278&fm=21&gp=0.jpg"];
        [self ShowTabelViewCellImage:lCell and:lDic];
        lCell.textLabel.text = [lDic objectForKey:@"name"];
        lCell.textLabel.font = [UIFont systemFontOfSize:13];
        NSString *lStr = [NSString stringWithFormat:@"¥:%@",[lDic objectForKey:@"price"]];
        lCell.detailTextLabel.text = lStr;
    }
    return lCell;
}
-(void)ShowTabelViewCellImage:(UITableViewCell *)lCell and:(NSDictionary *)lDic{
    NSString *lImageName1 = [lDic objectForKey:@"headerimage"];
    NSString *lImagePath1 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath1];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                lCell.imageView.image = [UIImage imageWithData:lData];
            }
        });
    });
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = [indexPath row];
    if (lInfoArray.count == 0) {
        return;
    }
    NSDictionary *lDic = [lInfoArray objectAtIndex:row];
    NSString *lStr = [lDic objectForKey:@"goodsid"];
    ParticularGoodsViewController *lParticularGoodsViewController = [[ParticularGoodsViewController alloc]init];
    
    lParticularGoodsViewController.Goodsid = lStr;
    [self.navigationController pushViewController:lParticularGoodsViewController animated:YES];
}

-(void)SearchGoods:(UITextField *)searchBar{
    NSOperationQueue *lQueue = [[NSOperationQueue alloc]init];
    NSString *lStr = [NSString stringWithFormat:@"search=%@&type=0&order=0&owncount=0",searchBar.text];
    NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/searchgoods.php",GoodsIP];
    NSURL *lUrl = [NSURL URLWithString:lStr1];
    NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
    [lRequest setHTTPMethod:@"post"];//设置请求名称
    [lRequest setHTTPBody:[lStr dataUsingEncoding:NSUTF8StringEncoding]];//把设置的请求字符串转化为nsdata然后作为请求主体
    NSURLConnection *lConnection = [NSURLConnection connectionWithRequest:lRequest delegate:self];
    [lConnection start];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:lQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *lHotGoodsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_sync(dispatch_get_main_queue(), ^{
        NSDictionary *lDic = [lHotGoodsDic objectForKey:@"msg"];
        NSString *count = [lDic objectForKey:@"count"];
//        NSLog(@"%@",count);
        if ([count intValue] == 0) {
            return ;
        }else{
        lInfoArray = [lDic objectForKey:@"infos"];
        NSLog(@"%@11",lInfoArray);
            UITableView *lTableView = (UITableView *)[self.view viewWithTag:112];
            [lTableView reloadData];
        }
        });
    }];
}
@end

