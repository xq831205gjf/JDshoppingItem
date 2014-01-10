//
//  AllGoodsViewController.m
//  页面
//
//  Created by 周钦 on 14-1-6.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import "AllGoodsViewController.h"
#import "CustomImageView.h"
#import "CustomCell.h"
#import "ParticularGoodsViewController.h"
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
    lMainTableView = [[UITableView alloc]init];
    lMainTableView.delegate = self;
    lMainTableView.dataSource = self;
    [lMainScrollView addSubview:lMainTableView];
    
    [self RequestHotGoods];
    [self RequestAllGoods];
    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的信息" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    UIBarButtonItem *lRightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = lRightButtonItem;
    
    [self.view addSubview:lMainScrollView];
    self.tabBarController.navigationController.title = @"首页";
}
-(void)ClickLeftBarButton:(UIBarButtonItem *)sender{
//点击我的信息
}
-(void)ClickRightBarButton:(UIBarButtonItem *)sender{
//点击登陆
}
-(void)CreatAllGoodsViewArray:(NSArray *)lAllGoodsArray{
    lAllGoodsArray1 = [NSArray arrayWithArray:lAllGoodsArray];
    if (lAllGoodsArray.count == 0) {
        lMainScrollView.contentSize = CGSizeMake(320, 464);
    }else{
        lMainScrollView.contentSize = CGSizeMake(320, 200+100*lAllGoodsArray.count);
        lMainTableView.frame = CGRectMake(0, 200, 320, 100*lAllGoodsArray.count);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.00;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return lAllGoodsArray1.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"cell";
    UITableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (lCell == nil) {
        lCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cell];
        NSInteger row = [indexPath row];
        NSDictionary *lDic = [lAllGoodsArray1 objectAtIndex:row];
        lCell.imageView.image = [UIImage imageNamed:@"u=2966281458,1284875278&fm=21&gp=0.jpg"];
        [self LoadImageView:nil andDictionary:lDic andDictionary:nil andCell:lCell];
        lCell.textLabel.text = [lDic objectForKey:@"name"];
        lCell.textLabel.font = [UIFont systemFontOfSize:13];
        NSString *lStr = [NSString stringWithFormat:@"¥:%@",[lDic objectForKey:@"price"]];
        lCell.detailTextLabel.text = lStr;
    }
    return lCell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = [indexPath row];
    NSDictionary *lDic = [lAllGoodsArray1 objectAtIndex:row];
    NSString *lStr = [lDic objectForKey:@"goodsid"];
    ParticularGoodsViewController *lParticularGoodsViewController = [[ParticularGoodsViewController alloc]init];
    lParticularGoodsViewController.Goodsid = lStr;
    [self.navigationController pushViewController:lParticularGoodsViewController animated:YES];
}

-(void)LoadImageView:(CustomImageView *)imageView andDictionary:(NSDictionary *)dic1 andDictionary:(NSDictionary*)dic2 andCell:(UITableViewCell *)lCell{
    if (dic2 == nil) {
    NSString *lImageName1 = [dic1 objectForKey:@"headerimage"];
    NSString *lImagePath1 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath1];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                if (imageView == nil) {
                        lCell.imageView.image = [UIImage imageWithData:lData];
                     }else if(lCell == nil){
                         [imageView SetBackGroundImage1:[UIImage imageWithData:lData]];
                     }
            }
        });
    });
    }else{
        NSString *lImageName1 = [dic1 objectForKey:@"headerimage"];
        NSString *lImagePath1 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName1];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL *lURL = [NSURL URLWithString:lImagePath1];
            NSData *lData = [NSData dataWithContentsOfURL:lURL];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (lData == nil) {
                }else{
                    if (imageView == nil) {
                        lCell.imageView.image = [UIImage imageWithData:lData];
                    }else if(lCell == nil){
                        [imageView SetBackGroundImage1:[UIImage imageWithData:lData]];
                    }
                }
            });
        });
        
    NSString *lImageName2 = [dic2 objectForKey:@"headerimage"];
    NSString *lImagePath2 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName2];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath2];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                if (imageView == nil) {
                    lCell.imageView.image = [UIImage imageWithData:lData];
                }else if(lCell == nil){
                    [imageView SetBackGroundImage2:[UIImage imageWithData:lData]];
                }
            }
        });
    });
    }
}
-(void)CreatHotGoodsScrollViewArray:(NSArray *)lHotGoodsArray{
    _lScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    _lScrollView.backgroundColor = [UIColor whiteColor];
    _lScrollView.contentSize = CGSizeMake(1600, 200);
    _lScrollView.delegate = self;
    
    _lScrollView.showsVerticalScrollIndicator = NO;
    _lScrollView.showsHorizontalScrollIndicator = NO;
    
    _lScrollView.scrollEnabled = YES;
    _lScrollView.pagingEnabled = YES;
    
    _lPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(240, 160, 60, 20)];
    _lPageControl.numberOfPages = lHotGoodsArray.count;
    _lPageControl.currentPage = 0;
    [_lPageControl addTarget:self action:@selector(changPage:) forControlEvents:UIControlEventValueChanged];
    
    [lMainScrollView addSubview:_lScrollView];
    [lMainScrollView addSubview:_lPageControl];
    
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
        [self LoadImageView:lBackGroundImageView andDictionary:lDic1 andDictionary:lDic2 andCell:nil];
    }
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
        [self CreatHotGoodsScrollViewArray:lArray];
    }];
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
            [self CreatAllGoodsViewArray:lArray];
        }];
}
@end
