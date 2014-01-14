//
//  goodsInfoView.m
//  JDshoppingItem
//
//  Created by TY on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "goodsInfoView.h"
#import "ParticularGoodsViewController.h"
#import "orderInformationViewController.h"
@implementation goodsInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _goodsHeadImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 30, 30)];
        _goodsHeadImage.image=[UIImage imageNamed:@"iphone.png"];
        [self addSubview:_goodsHeadImage];
        _goodsName=[[UILabel alloc]initWithFrame:CGRectMake(35, 0, 50, 20)];
        _goodsName.font=[UIFont fontWithName:@"Arial" size:12];
        _goodsName.text=@"商品名字";
        _goodsName.backgroundColor=[UIColor clearColor];
        [self addSubview:_goodsName];
        _goodsconut=[[UILabel alloc]initWithFrame:CGRectMake(35, 20, 50, 10)];
        _goodsconut.text=@"2";
        _goodsconut.font=[UIFont fontWithName:@"Arial" size:12];
        _goodsconut.backgroundColor=[UIColor clearColor];
        [self addSubview:_goodsconut];
        _goodsPrice=[[UILabel alloc]initWithFrame:CGRectMake(35, 30, 50, 20)];
        _goodsPrice.font=[UIFont fontWithName:@"Arial" size:12];
        _goodsPrice.text=@"100";
        [self addSubview:_goodsPrice];
        UIButton *lButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [lButton setTag:111];
        [lButton setFrame:CGRectMake(0, 0, 20, 20)];
        [lButton setTitle:@"X" forState:UIControlStateNormal];
        lButton.hidden=YES;
        [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:lButton];
        UITapGestureRecognizer *lTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ltap:)];
        [self addGestureRecognizer:lTap];
        UILongPressGestureRecognizer *lPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(lpress:)];
        [self addGestureRecognizer:lPress];
        orderInformationViewController *aa=[[orderInformationViewController alloc]init];
        aa.ldelegate=(id)self;
        
        }
    return self;
}
-(void)ltap:(UITapGestureRecognizer *)sender{
       NSLog(@"b");
    ParticularGoodsViewController *lPar=[[ParticularGoodsViewController alloc]init];
    orderInformationViewController *aa=[[orderInformationViewController alloc]init];
    [aa.navigationController pushViewController:lPar animated:YES];
   
//    [aa presentViewController:lPar animated:YES completion:nil];
    [self viewWithTag:111].hidden=YES;

}
-(void)lpress:(UILongPressGestureRecognizer *)sender{

    [self viewWithTag:111].hidden=NO;
    NSLog(@"a");

}
-(void)lButton:(UIButton *)sender{


}
-(void)send:(orderInformationViewController *)sender{

    _orderVC=sender;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
