//
//  CustomSingleGoodsView.m
//  页面
//
//  Created by 周钦 on 14-1-7.
//  Copyright (c) 2014年 周钦. All rights reserved.
//

#import "CustomSingleGoodsView.h"

@implementation CustomSingleGoodsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *lImageView = [[UIImageView alloc]initWithFrame:self.frame];
        lImageView.tag = 111;
        [self addSubview:lImageView];
    }
    return self;
}

-(void)SetImageViewImage:(UIImage *)image{
    UIImageView *lImageView = (UIImageView *)[self viewWithTag:111];
    [lImageView setImage:image];
}
@end
