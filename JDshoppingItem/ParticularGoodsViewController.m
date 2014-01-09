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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIBarButtonItem *lRightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"去购物车结算" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = lRightBarButtonItem;
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
        NSLog(@"%@",lHotGoodsDic);
        NSDictionary *lDic = [lHotGoodsDic objectForKey:@"msg"];
        [self CreatEvaluateLbael:lDic];
        [self CreatSellLabel:lDic];
        [self CreatSizeLabel:lDic];
        [self CreatDetailLabel:lDic];
        [self CreatPriceLabel:lDic];
        [self CreatGoodsImageView:lDic];
        [self CreatPurchaseView];
    }];
}
-(void)CreatGoodsImageView:(NSDictionary *)lDic{
    UIImageView *lImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 160)];
    lImageView.layer.borderColor = [UIColor blackColor].CGColor;
    lImageView.layer.borderWidth = 1;
    lImageView.layer.cornerRadius = 15;
    [self.view addSubview:lImageView];
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
    [self.view addSubview:lLabel];
}

-(void)CreatSizeLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 130, 50, 25)];
    [lLabel setTextColor:[UIColor blueColor]];
     NSString *lStr = [NSString stringWithFormat:@"型号:%@",[lDic objectForKey:@"size"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [self.view addSubview:lLabel];
}

-(void)CreatPriceLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 90, 50, 25)];
    [lLabel setTextColor:[UIColor orangeColor]];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",[lDic objectForKey:@"price"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [self.view addSubview:lLabel];
}

-(void)CreatSellLabel:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 90, 50, 25)];
    [lLabel setTextColor:[UIColor redColor]];
    NSString *lStr = [NSString stringWithFormat:@"已售:%@",[lDic objectForKey:@"sellcount"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [self.view addSubview:lLabel];
}
-(void)CreatEvaluateLbael:(NSDictionary *)lDic{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 130, 50, 25)];
    [lLabel setTextColor:[UIColor greenColor]];
    NSString *lStr = [NSString stringWithFormat:@"评论数量:%@",[lDic objectForKey:@"reviewcount"]];
    [lLabel setText:lStr];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [self.view addSubview:lLabel];
}
-(void)CreatPurchaseView{
    UIView *lPurchaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 160, 320, 100)];
    [lPurchaseView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:lPurchaseView];
    
    UILabel *lCountNumber = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 65, 50)];
    [lCountNumber setText:@"购买数量:"];
    [lPurchaseView addSubview:lCountNumber];
    
    UIButton *lSaleButton = [[UIButton alloc]initWithFrame:CGRectMake(80, 30, 55, 40)];
    [lSaleButton setTitle:@"-" forState:UIControlStateNormal];
    [lPurchaseView addSubview:lSaleButton];
    
    UILabel *lNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 37.5, 30, 25)];
    [lNumberLabel setText:@"0"];
    [lPurchaseView addSubview:lNumberLabel];
    
    UIButton *lPlusButton = [[UIButton alloc]initWithFrame:CGRectMake(175, 30, 55, 40)];
    [lPlusButton setTitle:@"+" forState:UIControlStateNormal];
    [lPurchaseView addSubview:lPlusButton];
    
    
}

@end
