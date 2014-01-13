//
//  ParticularGoodsViewController.m
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "ParticularGoodsViewController.h"
@interface ParticularGoodsViewController ()

@end

@implementation ParticularGoodsViewController

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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    lMainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 464)];
    lMainScrollView.contentSize = CGSizeMake(320, 784);
    [self.view addSubview:lMainScrollView];
    
    UIBarButtonItem *lRightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"去购物车结算" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = lRightBarButtonItem;
    [self CreatPurchaseView];
    [self CreatWebViewButtonView];
    [self CreatWebView];
    [self RequestSingleGoods];
    
}
-(void)ClickRightBarButton:(UIBarButtonItem *)sender{
//点击去购物车结算
}
-(void)RequestSingleGoods{
    NSOperationQueue *lQueue = [[NSOperationQueue alloc]init];
    NSString *lStr = [NSString stringWithFormat:@"goodsid=%@",_Goodsid];
    NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/getgoodsinfo.php",GoodsIP];
    NSURL *lUrl = [NSURL URLWithString:lStr1];
    NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
    [lRequest setHTTPMethod:@"post"];//设置请求名称
    [lRequest setHTTPBody:[lStr dataUsingEncoding:NSUTF8StringEncoding]];//把设置的请求字符串转化为nsdata然后作为请求主体
    NSURLConnection *lConnection = [NSURLConnection connectionWithRequest:lRequest delegate:self];
    [lConnection start];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:lQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *lHotGoodsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *lDic = [lHotGoodsDic objectForKey:@"msg"];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self CreatEvaluateLbael:lDic];
            [self CreatSellLabel:lDic];
            [self CreatSizeLabel:lDic];
            [self CreatDetailLabel:lDic];
            [self CreatPriceLabel:lDic];
            [self CreatGoodsImageView:lDic];
        });
    }];
}
-(void)CreatGoodsImageView:(NSDictionary *)lDic{
    UIImageView *lImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 160)];
    lImageView.layer.borderColor = [UIColor blackColor].CGColor;
    lImageView.layer.borderWidth = 1;
    lImageView.layer.cornerRadius = 15;
    [lMainScrollView addSubview:lImageView];
    [self loadImage:lDic andImageView:lImageView];
}

-(void)loadImage:(NSDictionary *)lDic andImageView:(UIImageView *)lImageView{
    NSString *lImageName1 = [lDic objectForKey:@"headerimage"];
    NSString *lImagePath1 = [NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,lImageName1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *lURL = [NSURL URLWithString:lImagePath1];
        NSData *lData = [NSData dataWithContentsOfURL:lURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (lData == nil) {
            }else{
                [lImageView setImage:[UIImage imageWithData:lData]];
            }
        });
    });
}
-(void)CreatDetailLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 10, 130, 75)];
    [lLabel setTextColor:[UIColor purpleColor]];
    NSString *lStr = [lDic objectForKey:@"detail"];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lMainScrollView addSubview:lLabel];
}

-(void)CreatSizeLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 130, 50, 25)];
    [lLabel setTextColor:[UIColor blueColor]];
     NSString *lStr = [NSString stringWithFormat:@"型号:%@",[lDic objectForKey:@"size"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lMainScrollView addSubview:lLabel];
}

-(void)CreatPriceLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 90, 50, 25)];
    [lLabel setTextColor:[UIColor orangeColor]];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",[lDic objectForKey:@"price"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lMainScrollView addSubview:lLabel];
}

-(void)CreatSellLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 90, 50, 25)];
    [lLabel setTextColor:[UIColor redColor]];
    NSString *lStr = [NSString stringWithFormat:@"已售:%@",[lDic objectForKey:@"sellcount"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lMainScrollView addSubview:lLabel];
}
-(void)CreatEvaluateLbael:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 130, 50, 25)];
    [lLabel setTextColor:[UIColor greenColor]];
    NSString *lStr = [NSString stringWithFormat:@"评论数量:%@",[lDic objectForKey:@"star"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lMainScrollView addSubview:lLabel];
}
-(void)CreatPurchaseView{
    
    UIView *lPurchaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 210, 320, 50)];
    [lPurchaseView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1]];
    [lMainScrollView addSubview:lPurchaseView];
    
    UILabel *lCountNumber = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 50)];
    [lCountNumber setText:@"购买数量:"];
    lCountNumber.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [lPurchaseView addSubview:lCountNumber];
    
    UIButton *lSaleButton = [[UIButton alloc]initWithFrame:CGRectMake(90, 15, 30, 20)];
    [lSaleButton setTitle:@"-" forState:UIControlStateNormal];
    [lSaleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lPurchaseView addSubview:lSaleButton];
    
    UILabel *lNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(125, 12.5, 30, 25)];
    [lNumberLabel setText:@"1"];
    lNumberLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [lPurchaseView addSubview:lNumberLabel];
    
    UIButton *lPlusButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 15, 30, 20)];
    [lPlusButton setTitle:@"+" forState:UIControlStateNormal];
    [lPlusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lPurchaseView addSubview:lPlusButton];
    
    UIButton *lShoppingCarButton = [[UIButton alloc]initWithFrame:CGRectMake(195, 5, 120, 40)];
    [lShoppingCarButton setTitle:@"添加到购物车" forState:UIControlStateNormal];
    [lShoppingCarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lShoppingCarButton addTarget:self action:@selector(ClickShoppingCarButton:) forControlEvents:UIControlEventTouchUpInside];
    [lPurchaseView addSubview:lShoppingCarButton];
}
-(void)ClickSaleButton:(UIButton *)sender{

}

-(void)ClickPlusButton:(UIButton *)sender{

}
-(void)ClickShoppingCarButton:(UIButton *)sender{
//点击添加到购物车
}
-(void)ClickCollectButton:(UIButton *)sender{
//点击添加到收藏夹
}
-(void)CreatWebViewButtonView{
    UIView *lWebViewButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 260, 320, 60)];
    [lWebViewButtonView setBackgroundColor:[UIColor whiteColor]];
    [lMainScrollView addSubview:lWebViewButtonView];
    
    NSArray *lArray = [[NSArray alloc]initWithObjects:@"商品介绍",@"详细参数",@"包装清单",@"售后服务", nil];
    for (int i = 0; i<lArray.count; i++) {
        UIButton *lButton = [[UIButton alloc]initWithFrame:CGRectMake(5+80*i, 5, 70, 50)];
        lButton.layer.cornerRadius = 10;
        lButton.tag = i+100;
        [lButton setBackgroundColor:lightOrange];
        [lButton setTitle:[lArray objectAtIndex:i] forState:UIControlStateNormal];
        lButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [lButton addTarget:self action:@selector(ClickWebViewButton:) forControlEvents:UIControlEventTouchUpInside];
        [lWebViewButtonView addSubview:lButton];
    }
}

-(void)CreatWebView{
    lWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 320, 320, 464)];
    NSString *lStr = [NSString stringWithFormat:@"http://%@/shop/html/%@/introduction.php",GoodsIP,_Goodsid];
    NSURL *lUrl = [[NSURL alloc]initWithString:lStr];
    [lWebView loadRequest:[NSURLRequest requestWithURL:lUrl]];
    [lMainScrollView addSubview:lWebView];
}

-(void)ClickWebViewButton:(UIButton *)sender{
    switch (sender.tag) {
        case 100:{
            NSString *lStr = @"introduction.php";
            NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/html/%@/%@",GoodsIP,_Goodsid,lStr];
            [lWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:lStr1]]];
        }break;
        case 101:{
            NSString *lStr = @"specifications.php";
            NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/html/%@/%@",GoodsIP,_Goodsid,lStr];
            [lWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:lStr1]]];
        }break;
        case 102:{
            NSString *lStr = @"packinglist.php";
            NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/html/%@/%@",GoodsIP,_Goodsid,lStr];
            [lWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:lStr1]]];
        }break;
        case 103:{
            NSString *lStr = @"service.php";
            NSString *lStr1 = [NSString stringWithFormat:@"http://%@/shop/html/%@/%@",GoodsIP,_Goodsid,lStr];
            [lWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:lStr1]]];
        }break;
        }
}
@end
