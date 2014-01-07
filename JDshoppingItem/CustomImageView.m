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
    }
    return self;
}

-(void)SetBackGroundImage:(UIImage *)image{
    UIImageView *lImageView = [[UIImageView alloc]initWithImage:image];
    [lImageView setFrame:CGRectMake(50, 0, 320, 170)];
    [lImageView setClipsToBounds:YES];
    [lImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:lImageView];
}

-(void)SetPriceLabel:(NSString *)price{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 100, 100, 30)];
    NSString *lStr = [NSString stringWithFormat:@"¥:%@",price];
    [lLabel setText:lStr];
    [self addSubview:lLabel];
}
-(void)SetGoodsName:(NSString *)goodsName{
    UILabel *lLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 170, 280, 30)];
    lLabel.font = [UIFont systemFontOfSize:11];
    [lLabel setText:goodsName];
    [self addSubview:lLabel];
}
@end
