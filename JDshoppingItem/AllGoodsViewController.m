//
//  AllGoodsViewController.m
//  页面
//
//  Created by 周钦 on 14-1-6.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import "AllGoodsViewController.h"
#import "CustomImageView.h"
#import "CustomSingleGoodsView.h"
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    lQueue=[[NSOperationQueue alloc]init];
    
    lGoodsBrandArray = [[NSMutableArray alloc]initWithObjects:@"三星",@"htc",@"华为",@"魅族",@"努比亚", nil];
    
    lMainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 464)];
    lMainScrollView.contentSize = CGSizeMake(320, 200+88*lGoodsBrandArray.count);
    
    [self RequestHotGoods];
    [self RequestSingleGoods];
    
    UIBarButtonItem *lLeftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的信息" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = lLeftButtonItem;
    
    UIBarButtonItem *lRightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = lRightButtonItem;
    
    [self.view addSubview:lMainScrollView];
    
}

-(void)CreatSingleGoodsViewArray:(NSArray *)lSingleGoodsArray{
    
}

-(void)CreatHotGoodsScrollViewArray:(NSArray *)lHotGoodsArray{
    _lScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    _lScrollView.backgroundColor = [UIColor redColor];
    _lScrollView.contentSize = CGSizeMake(3200, 200);
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
    
    for (int i = 0; i<10; i++) {
        NSDictionary *lDic = [lHotGoodsArray objectAtIndex:i];
        CustomImageView *lBackGroundImageView = [[CustomImageView alloc]initWithFrame:CGRectMake( i*320, 0, 320, 200)];
        [_lScrollView addSubview:lBackGroundImageView];
        NSString *lPrice = [lDic objectForKey:@"price"];
        NSString *lName = [lDic objectForKey:@"name"];
        [lBackGroundImageView SetPriceLabel:lPrice];
        [lBackGroundImageView SetGoodsName:lName];
        
        NSString *lImageName = [lDic objectForKey:@"headerimage"];
        NSString *lImagePath = [NSString stringWithFormat:@"http://192.168.1.136/shop/goodsimage/%@",lImageName];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL *lURL = [NSURL URLWithString:lImagePath];
            NSData *lData = [NSData dataWithContentsOfURL:lURL];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (lData == nil) {
                }else{
                    [lBackGroundImageView SetBackGroundImage:[UIImage imageWithData:lData]];
                }
            });
        });
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

-(void)CreatGoodsInfoScrollView{
    for (int i = 0; i < lGoodsBrandArray.count; i++) {
        UIScrollView *lGoodInfoScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(88*(i+1), 0, 88, 88)];
        [lMainScrollView addSubview:lGoodInfoScrollView];
    }
}

-(void)RequestHotGoods{
    NSString *lStr = [NSString stringWithFormat:@"order=0"];
    NSURL *lUrl = [NSURL URLWithString:@"http://192.168.1.136/shop/hotgoods.php "];
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
-(void)RequestSingleGoods{
    for (int i = 0; i<lGoodsBrandArray.count; i++) {
        NSString *lGoodsBrand = [lGoodsBrandArray objectAtIndex:i];
        NSString *lStr = [NSString stringWithFormat:@"search=%@&type=0&order=0&owncount=0",lGoodsBrand];
        NSURL *lUrl = [NSURL URLWithString:@"http://192.168.1.136/shop/searchgoods.php"];
        NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
        [lRequest setHTTPMethod:@"post"];//设置请求名称
        [lRequest setHTTPBody:[lStr dataUsingEncoding:NSUTF8StringEncoding]];//把设置的请求字符串转化为nsdata然后作为请求主体
        NSURLConnection *lConnection = [NSURLConnection connectionWithRequest:lRequest delegate:self];
        [lConnection start];
        [NSURLConnection sendAsynchronousRequest:lRequest queue:lQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSDictionary *lHotGoodsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *lArray = [lHotGoodsDic objectForKey:@"msg"];
            NSMutableArray *lAllSingleGoodsArray = [[NSMutableArray alloc]init];
            [lAllSingleGoodsArray addObject:lArray];
            NSLog(@"%@",lArray);
            [self CreatSingleGoodsViewArray:lAllSingleGoodsArray];
        }];
    }
}
@end
