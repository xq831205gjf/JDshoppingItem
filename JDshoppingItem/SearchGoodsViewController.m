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
        lInfoArray = [[NSArray alloc]init];
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
    [self CreatSearchStyleButtonView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self RequestAllGoods];
    j = 0;
    k = 0;
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
    [lEnterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lView addSubview:lEnterButton];
    lEnterButton.backgroundColor = lightBlue;
    lEnterButton.layer.cornerRadius = 5;
    [lEnterButton addTarget:self action:@selector(ClickEnterButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lCancelButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 2.5, 45, 35)];
    [lCancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [lCancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lView addSubview:lCancelButton];
    lCancelButton.backgroundColor = lightBlue;
    lCancelButton.layer.cornerRadius = 5;
    [lCancelButton addTarget:self action:@selector(ClickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)CreatTableView{
    UITableView *lTableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 120, 280, 324)];
    lTableView.layer.cornerRadius = 10;
    lTableView.delegate = self;
    lTableView.tag = 112;
    lTableView.dataSource = self;
    [self.view addSubview:lTableView];
}
-(void)ClickEnterButton:(UIButton *)sender{
    lInfoArray = [[NSArray alloc]init];
    UITextField *lSearchText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
    [self SearchGoods:lSearchText];
    [lSearchText resignFirstResponder];
}

-(void)ClickCancelButton:(UIButton *)sender{
    lInfoArray = [[NSArray alloc]init];
    UITableView *lTableView = (UITableView *)[self.view viewWithTag:112];
    [lTableView reloadData];
    UITextField *lSearchText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
    lSearchText.text = @"";
    [self RequestAllGoods];
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
//        lCell.textLabel.font = [UIFont systemFontOfSize:25];
//        lCell.detailTextLabel.text = nil;
//        lCell.imageView.image = nil;
//        lCell.textLabel.text = @"未进行搜索";
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
    NSString *lStr = [NSString stringWithFormat:@"search=%@&type=%i&order=%i&owncount=0",searchBar.text,j,k];
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
        if ([count intValue] == 0) {
            NSArray *lAr = [[NSArray alloc]initWithObjects:@"没有数据", nil];
            lInfoArray = [NSArray arrayWithArray:lAr];
            return ;
        }else{
        lInfoArray = [lDic objectForKey:@"infos"];
            UITableView *lTableView = (UITableView *)[self.view viewWithTag:112];
            [lTableView reloadData];
        }
        });
    }];
}

-(void)RequestAllGoods{
    NSOperationQueue *lQueue = [[NSOperationQueue alloc]init];
    NSString *lStr = [NSString stringWithFormat:@"type=0&order=0&owncount=0"];
    NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/getgoods.php",GoodsIP];
    NSURL *lUrl = [NSURL URLWithString:lStr1];
    NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
    [lRequest setHTTPMethod:@"post"];//设置请求名称
    [lRequest setHTTPBody:[lStr dataUsingEncoding:NSUTF8StringEncoding]];//把设置的请求字符串转化为nsdata然后作为请求主体
    NSURLConnection *lConnection = [NSURLConnection connectionWithRequest:lRequest delegate:self];
    [lConnection start];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:lQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *lHotGoodsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *lDic = [lHotGoodsDic objectForKey:@"msg"];
        NSArray *lArray = [lDic objectForKey:@"infos"];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lInfoArray.count == 0) {
                lInfoArray = [NSArray arrayWithArray:lArray];
                UITableView *lTableView = (UITableView *)[self.view viewWithTag:112];
                [lTableView reloadData];
            }
        });
    }];
}

-(void)CreatSearchStyleButtonView{
    UIView *lWebViewButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 320, 75)];
    [lWebViewButtonView setBackgroundColor:[UIColor whiteColor]];
    lWebViewButtonView.tag = 200;
    [lWebViewButtonView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:lWebViewButtonView];
    
    UIView *lView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    [lView setBackgroundColor:hotPink];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 20)];
    [label setText:@"点击下面按钮切换搜索方式,默认以价格，升序搜索"];
    [label setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [label setFont:[UIFont systemFontOfSize:12]];
    [label setTextColor:[UIColor blackColor]];
    [lView addSubview:label];
    [lWebViewButtonView addSubview:lView];
    NSArray *lArray1= [[NSArray alloc]initWithObjects:@"价格搜索",@"销量搜索", nil];
    for (int l = 0; l<lArray1.count; l++) {
        UIView *lSearchView = [[UIView alloc]initWithFrame:CGRectMake(l*160, 20, 160, 55)];
        lSearchView.tag = 119+l;
        [lSearchView setBackgroundColor:[UIColor whiteColor]];
        lSearchView.layer.borderColor = [UIColor grayColor].CGColor;
        lSearchView.layer.borderWidth = 2;
        [lWebViewButtonView addSubview:lSearchView];
        UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(7, 10, 27, 32)];
        lLabel.numberOfLines = 0;
        lLabel.tag = 88+l;
        lLabel.layer.borderColor = [UIColor grayColor].CGColor;
        lLabel.layer.borderWidth = 1;
        lLabel.font = [UIFont systemFontOfSize:13];
        [lSearchView addSubview:lLabel];
        [lLabel setText:[lArray1 objectAtIndex:l]];
        UILabel *label = (UILabel *)[[lWebViewButtonView viewWithTag:119] viewWithTag:88];
        [label setBackgroundColor:[UIColor orangeColor]];
    }
    
    NSArray *lArray = [[NSArray alloc]initWithObjects:@"升序",@"降序", nil];
    for (int i = 0; i<lArray.count; i++) {
        UIButton *lButton = [[UIButton alloc]initWithFrame:CGRectMake(40+60*i, 7, 55, 40)];
        lButton.layer.cornerRadius = 10;
        lButton.tag = i+100;
        [lButton setBackgroundColor:[UIColor whiteColor]];
        [lButton setTitle:[lArray objectAtIndex:i] forState:UIControlStateNormal];
        lButton.titleLabel.font = [UIFont systemFontOfSize:13];
        lButton.layer.borderColor = [UIColor grayColor].CGColor;
        lButton.layer.borderWidth = 1;
        [lButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lButton addTarget:self action:@selector(ClickSearchStyleButton:) forControlEvents:UIControlEventTouchUpInside];
        UIView *lSearchView1 = [lWebViewButtonView viewWithTag:119];
        [lSearchView1 addSubview:lButton];
        if (lButton.tag == 100) {
            [lButton setBackgroundColor:[UIColor orangeColor]];
        }
    }
    NSArray *lArray2 = [[NSArray alloc]initWithObjects:@"升序",@"降序", nil];
    for (int i = 0; i<lArray2.count; i++) {
        UIButton *lButton = [[UIButton alloc]initWithFrame:CGRectMake(40+60*i, 7, 55, 40)];
        lButton.layer.cornerRadius = 10;
        lButton.tag = i+130;
        [lButton setBackgroundColor:[UIColor whiteColor]];
        [lButton setTitle:[lArray objectAtIndex:i] forState:UIControlStateNormal];
        lButton.titleLabel.font = [UIFont systemFontOfSize:13];
        lButton.layer.borderColor = [UIColor grayColor].CGColor;
        lButton.layer.borderWidth = 1;
        [lButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lButton addTarget:self action:@selector(ClickSearchStyleButton:) forControlEvents:UIControlEventTouchUpInside];
        UIView *lSearchView2 = [lWebViewButtonView viewWithTag:120];
        [lSearchView2 addSubview:lButton];
    }
}

-(void)ClickSearchStyleButton:(UIButton *)sender{
    UIButton *lButton1 = (UIButton *)[[[self.view viewWithTag:200] viewWithTag:119] viewWithTag:100];
    UIButton *lButton2 = (UIButton *)[[[self.view viewWithTag:200] viewWithTag:119] viewWithTag:101];
    UIButton *lButton3 = (UIButton *)[[[self.view viewWithTag:200] viewWithTag:120] viewWithTag:130];
    UIButton *lButton4 = (UIButton *)[[[self.view viewWithTag:200] viewWithTag:120] viewWithTag:131];
    UILabel *label1 = (UILabel *)[[[self.view viewWithTag:200] viewWithTag:119] viewWithTag:88];
    UILabel *label2 = (UILabel *)[[[self.view viewWithTag:200] viewWithTag:120] viewWithTag:89];
    switch (sender.tag) {
        case 100:{
            UITextField *lText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
            lInfoArray = [[NSArray alloc]init];
                j = 0;
                k = 0;
                [sender setBackgroundColor:[UIColor orangeColor]];
                [label1 setBackgroundColor:[UIColor orangeColor]];
                [label2 setBackgroundColor:[UIColor whiteColor]];
                [lButton2 setBackgroundColor:[UIColor whiteColor]];
                [lButton3 setBackgroundColor:[UIColor whiteColor]];
                [lButton4 setBackgroundColor:[UIColor whiteColor]];
            [self SearchGoods:lText];
        }
            break;
        case 101:{
            UITextField *lText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
            lInfoArray = [[NSArray alloc]init];
            j = 0;
            k = 1;
            [sender setBackgroundColor:[UIColor orangeColor]];
            [label1 setBackgroundColor:[UIColor orangeColor]];
            [label2 setBackgroundColor:[UIColor whiteColor]];
            [lButton1 setBackgroundColor:[UIColor whiteColor]];
            [lButton3 setBackgroundColor:[UIColor whiteColor]];
            [lButton4 setBackgroundColor:[UIColor whiteColor]];
            [self SearchGoods:lText];
        }
        break;
        case 130:{
            UITextField *lText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
            lInfoArray = [[NSArray alloc]init];
            j = 1;
            k = 0;
            [sender setBackgroundColor:[UIColor orangeColor]];
            [label1 setBackgroundColor:[UIColor whiteColor]];
            [label2 setBackgroundColor:[UIColor orangeColor]];
            [lButton1 setBackgroundColor:[UIColor whiteColor]];
            [lButton2 setBackgroundColor:[UIColor whiteColor]];
            [lButton4 setBackgroundColor:[UIColor whiteColor]];
            [self SearchGoods:lText];
        }
            break;
        case 131:{
            UITextField *lText = (UITextField *)[[self.view viewWithTag:110] viewWithTag:111];
            lInfoArray = [[NSArray alloc]init];
            j = 1;
            k = 1;
            [sender setBackgroundColor:[UIColor orangeColor]];
            [label1 setBackgroundColor:[UIColor whiteColor]];
            [label2 setBackgroundColor:[UIColor orangeColor]];
            [lButton1 setBackgroundColor:[UIColor whiteColor]];
            [lButton2 setBackgroundColor:[UIColor whiteColor]];
            [lButton3 setBackgroundColor:[UIColor whiteColor]];
            [self SearchGoods:lText];
        }
            break;
    }
}
@end

