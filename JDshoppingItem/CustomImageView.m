//
//  CustomImageView.m
//  页面
//
//  Created by 周钦 on 14-1-6.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *lView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
        [lView setBackgroundColor:[UIColor blueColor]];
        lView.layer.cornerRadius = 3;
        [self addSubview:lView];
        
        UILabel *lLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(133, 0, 200, 20)];
        [lLabel2 setText:@"热销商品"];
        lLabel2.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        lLabel2.font = [UIFont systemFontOfSize:12];
        [lLabel2 setTextColor:[UIColor whiteColor]];
        [lView addSubview:lLabel2];
    }
    return self;
}

-(void)SetBackGroundImage1:(UIImage *)image{
    UIImageView *lImageView = [[UIImageView alloc]initWithImage:image];
    [lImageView setFrame:CGRectMake(0, 20, 160, 120)];
    [lImageView setClipsToBounds:YES];
    [lImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:lImageView];
}
-(void)SetBackGroundImage2:(UIImage *)image{
    UIImageView *lImageView = [[UIImageView alloc]initWithImage:image];
    [lImageView setFrame:CGRectMake(160, 20, 160, 120)];
    [lImageView setClipsToBounds:YES];
    [lImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:lImageView];
}

-(void)SetPriceLabel1:(NSString *)price{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 185, 100, 15)];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",price];
    [lLabel setText:lStr];
    [lLabel setTextColor:[UIColor redColor]];
    [self addSubview:lLabel];
}

-(void)SetPriceLabel2:(NSString *)price{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 185, 100, 15)];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",price];
    [lLabel setText:lStr];
    [lLabel setTextColor:[UIColor redColor]];
    [self addSubview:lLabel];
}

-(void)SetGoodsName1:(NSString *)goodsName{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 140, 150, 45)];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lLabel setText:goodsName];
    [self addSubview:lLabel];
}

-(void)SetGoodsName2:(NSString *)goodsName{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 140, 150, 45)];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lLabel setText:goodsName];
    [self addSubview:lLabel];
}
@end
