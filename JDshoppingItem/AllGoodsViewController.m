//
//  AllGoodsViewController.m
//  页面
//
//  Created by 周钦 on 14-1-6.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import "AllGoodsViewController.h"
#import "CustomImageView.h"
#import "SearchGoodsViewController.h"
#import "ParticularGoodsViewController.h"
#import "UserInfoViewController.h"
#import "LogonViewController.h"
@interface AllGoodsViewController ()

@end

@implementation AllGoodsViewController

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
    self.title = @"首页";
    lightBlue = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    lightOrange = [UIColor colorWithRed:255/255 green:140/255 blue:0 alpha:1];
    paleGreen = [UIColor colorWithRed:152/255 green:251/255 blue:152/255 alpha:1];
    hotPink = [UIColor colorWithRed:1 green:105/255 blue:180/255 alpha:1];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [lMainScrollView removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    lQueue=[[NSOperationQueue alloc]init];
    lMainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 464)];
    UIView *lMiddleView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 20)];
    [lMainTableView setBackgroundColor:lightOrange];
    lMiddleView.layer.cornerRadius = 3;
    [lMainScrollView addSubview:lMiddleView];
    
    [self CreatAllGoodsView];
    [self CreatHotGoodsView];
    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的信息" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    UIBarButtonItem *lRightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = lRightButtonItem;
    
    [self.view addSubview:lMainScrollView];
}
-(void)ClickLeftBarButton:(UIBarButtonItem *)sender{
//点击我的信息
    UserInfoViewController *lUserInfoVC = [[UserInfoViewController alloc]init];
    UINavigationController *lUserInfoNVC = [[UINavigationController alloc]initWithRootViewController:lUserInfoVC];
    [self presentViewController:lUserInfoNVC animated:YES completion:nil];
}
-(void)ClickRightBarButton:(UIBarButtonItem *)sender{
//点击登陆
    LogonViewController *lLogonInfoVC = [[LogonViewController alloc]init];
    [self presentViewController:lLogonInfoVC animated:YES completion:nil];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"所有商品";
}
-(void)CreatHotGoodsView{
    _lScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    _lScrollView.backgroundColor = [UIColor whiteColor];
    _lScrollView.contentSize = CGSizeMake(1600, 200);
    _lScrollView.delegate = self;
    
    _lScrollView.showsVerticalScrollIndicator = NO;
    _lScrollView.showsHorizontalScrollIndicator = NO;
    
    _lScrollView.scrollEnabled = YES;
    _lScrollView.pagingEnabled = YES;
    
    _lPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(240, 160, 60, 20)];
    _lPageControl.numberOfPages = 1;
    _lPageControl.currentPage = 0;
    [_lPageControl addTarget:self action:@selector(changPage:) forControlEvents:UIControlEventValueChanged];
    
    [lMainScrollView addSubview:_lScrollView];
    [lMainScrollView addSubview:_lPageControl];
    
    CustomImageView *lImageView = [[CustomImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    [lImageView SetBackGroundImage1:[UIImage imageNamed:@"u=2966281458,1284875278&fm=21&gp=0.jpg"]];
    [lImageView SetBackGroundImage2:[UIImage imageNamed:@"u=2966281458,1284875278&fm=21&gp=0.jpg"]];
    
    [_lScrollView addSubview:lImageView];
    [self RequestHotGoods];
}

-(void)CreatAllGoodsView{
    lMainTableView = [[UITableView alloc]init];
    lMainTableView.delegate = self;
    lMainTableView.dataSource = self;
    [lMainScrollView addSubview:lMainTableView];
    [self RequestAllGoods];
}

-(void)CreatAllGoodsViewArray:(NSArray *)lAllGoodsArray{
    lAllGoodsArray1 = [NSArray arrayWithArray:lAllGoodsArray];
    if (lAllGoodsArray.count == 0) {
        lMainScrollView.contentSize = CGSizeMake(320, 464);
        lMainTableView.frame = CGRectMake(0, 200, 320, 500);
    }else{
        lMainScrollView.contentSize = CGSizeMake(320, 220+100*lAllGoodsArray.count);
        lMainTableView.frame = CGRectMake(0, 220, 320, 100*lAllGoodsArray.count);
    }
    [lMainTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.00;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (lAllGoodsArray1.count == 0) {
        return 5;
    }else{
        return lAllGoodsArray1.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"cell";
    UITableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (lCell == nil) {
        lCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cell];
        NSInteger row = [indexPath row];
        NSDictionary *lDic = [lAllGoodsArray1 objectAtIndex:row];
        lCell.imageView.image = [UIImage imageNamed:@"u=2966281458,1284875278&fm=21&gp=0.jpg"];
        [self ShowTabelViewCellImage:lCell and:lDic];
        lCell.textLabel.text = [lDic objectForKey:@"name"];
        lCell.textLabel.font = [UIFont systemFontOfSize:13];
        NSString *lStr = [NSString stringWithFormat:@"¥:%@",[lDic objectForKey:@"price"]];
        lCell.detailTextLabel.text = lStr;
    }
    return lCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = [indexPath row];
    NSDictionary *lDic = [lAllGoodsArray1 objectAtIndex:row];
    NSString *lStr = [lDic objectForKey:@"goodsid"];
    ParticularGoodsViewController *lParticularGoodsViewController = [[ParticularGoodsViewController alloc]init];
    
    lParticularGoodsViewController.Goodsid = lStr;
    [self.navigationController pushViewController:lParticularGoodsViewController animated:YES];
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

-(void)ShowHotGoodsViewImage:(CustomImageView *)imageView and:(NSDictionary *)lDic1 and:(NSDictionary *)lDic2{
    NSString *lImageName1 = [lDic1 objectForKey:@"headerimage"];
    NSString *lImagePath1 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath1];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                [imageView SetBackGroundImage1:[UIImage imageWithData:lData]];
            }
        });
    });
    
    NSString *lImageName2 = [lDic2 objectForKey:@"headerimage"];
    NSString *lImagePath2 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName2];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath2];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                [imageView SetBackGroundImage2:[UIImage imageWithData:lData]];
            }
        });
    });
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = _lScrollView.contentOffset.x/320;
    _lPageControl.currentPage = page;
}

-(void)changPage:(id)sender{
    NSInteger page = _lPageControl.currentPage;
    [_lScrollView setContentOffset:CGPointMake(320*page, 0) animated:YES];
}

-(void)RequestHotGoods{
    NSString *lStr = [NSString stringWithFormat:@"order=0"];
    NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/hotgoods.php",GoodsIP];
    NSURL *lUrl = [NSURL URLWithString:lStr1];
    NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
    [lRequest setHTTPMethod:@"post"];//设置请求名称
    [lRequest setHTTPBody:[lStr dataUsingEncoding:NSUTF8StringEncoding]];//把设置的请求字符串转化为nsdata然后作为请求主体
    NSURLConnection *lConnection = [NSURLConnection connectionWithRequest:lRequest delegate:self];
    [lConnection start];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:lQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *lHotGoodsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *lArray = [lHotGoodsDic objectForKey:@"msg"];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self SetHotGoodsView:lArray];
        });
    }];
}

-(void)SetHotGoodsView:(NSArray *)lHotGoodsArray{
    for (int i = 0; i<5; i++) {
        int j = i * 2;
        int k = j + 1;
        NSDictionary *lDic1 = [lHotGoodsArray objectAtIndex:j];
        NSDictionary *lDic2 = [lHotGoodsArray objectAtIndex:k];
        CustomImageView *lBackGroundImageView = [[CustomImageView alloc]initWithFrame:CGRectMake(i*320, 0, 320, 200)];
        [_lScrollView addSubview:lBackGroundImageView];
        
        NSString *lPrice1 = [lDic1 objectForKey:@"price"];
        NSString *lName1 = [lDic1 objectForKey:@"name"];
        NSString *lPrice2 = [lDic2 objectForKey:@"price"];
        NSString *lName2 = [lDic2 objectForKey:@"name"];
        
        [lBackGroundImageView SetPriceLabel1:lPrice1];
        [lBackGroundImageView SetGoodsName1:lName1];
        
        [lBackGroundImageView SetPriceLabel2:lPrice2];
        [lBackGroundImageView SetGoodsName2:lName2];
        [self ShowHotGoodsViewImage:lBackGroundImageView and:lDic1 and:lDic2];
    }
}
-(void)RequestAllGoods{
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
                [self CreatAllGoodsViewArray:lArray];
            });
        }];
}

@end
