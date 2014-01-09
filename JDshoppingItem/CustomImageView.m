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
        lLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, 40, 130)];
        [lLabel1 setText:@"热门商品"];
        lLabel1.numberOfLines = 0;
        lLabel1.font = [UIFont systemFontOfSize:25];
        [self addSubview:lLabel1];
    }
    return self;
}

-(void)SetBackGroundImage1:(UIImage *)image{
    UIImageView *lImageView = [[UIImageView alloc]initWithImage:image];
    [lImageView setFrame:CGRectMake(0, 0, 160, 140)];
    [lImageView setClipsToBounds:YES];
    [lImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:lImageView];
    [self bringSubviewToFront:lLabel1];
}
-(void)SetBackGroundImage2:(UIImage *)image{
    UIImageView *lImageView = [[UIImageView alloc]initWithImage:image];
    [lImageView setFrame:CGRectMake(160, 0, 160, 140)];
    [lImageView setClipsToBounds:YES];
    [lImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:lImageView];
    [self bringSubviewToFront:lLabel1];
}

-(void)SetPriceLabel1:(NSString *)price{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 185, 100, 15)];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",price];
    [lLabel setText:lStr];
    [lLabel setTextColor:[UIColor redColor]];
    [self addSubview:lLabel];
    [self bringSubviewToFront:lLabel1];
}

-(void)SetPriceLabel2:(NSString *)price{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 185, 100, 15)];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",price];
    [lLabel setText:lStr];
    [lLabel setTextColor:[UIColor redColor]];
    [self addSubview:lLabel];
    [self bringSubviewToFront:lLabel1];
}

-(void)SetGoodsName1:(NSString *)goodsName{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 140, 150, 45)];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lLabel setText:goodsName];
    [self addSubview:lLabel];
    [self bringSubviewToFront:lLabel1];
}

-(void)SetGoodsName2:(NSString *)goodsName{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 140, 150, 45)];
    lLabel.font = [UIFont systemFontOfSize:11];
    lLabel.numberOfLines = 0;
    [lLabel setText:goodsName];
    [self addSubview:lLabel];
    [self bringSubviewToFront:lLabel1];
}
@end
