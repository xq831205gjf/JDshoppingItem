//
//  customCell.m
//  JDshoppingItem
//
//  Created by TY on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "shoppingcartcustomCell.h"
#import "shoppingcart.h"
#import "singleShopcart.h"
@implementation shoppingcartcustomCell{

    BOOL lBool;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        lBool=NO;
        [singleShopcart setSingleSopCart].Chick=lBool;
        _lView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 75, 50)];
//        [_lView setFrame:CGRectMake(0, 0, 75, 50)];
        _goodsChick=[[UIImageView alloc]initWithFrame:CGRectMake(5, 12, 20, 25)];
        _goodsChick.image=[UIImage imageNamed:@"check.png"];
        [_lView addSubview:_goodsChick];
        _goodsHeadImage=[[UIImageView alloc]initWithFrame:CGRectMake(25, 0, 50, 50)];
        _goodsHeadImage.image=[UIImage imageNamed:@"iphone.png"];
        [_lView addSubview:_goodsHeadImage];
        _goodsHeadImage.userInteractionEnabled=YES;
        _lView.backgroundColor=[UIColor clearColor];
        [self.contentView bringSubviewToFront:_lView];
        UITapGestureRecognizer *lTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lTap:)];
        [_lView addGestureRecognizer:lTap];
        [self.contentView addSubview:_lView];
       
//        [_goodsChick addGestureRecognizer:lTap];

        _goodsName =[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 80, 50)];
        _goodsName.text=@"商品名字";
        _goodsName.numberOfLines=0;
        _goodsName.font=[UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:_goodsName];
        _goodsPrice =[[UILabel alloc]initWithFrame:CGRectMake(165, 0, 45, 50)];
        _goodsPrice.font=[UIFont fontWithName:@"Arial" size:12];
        _goodsPrice.numberOfLines=0;
        _goodsPrice.text=@"价格";
        [self.contentView addSubview:_goodsPrice];
        _goodsColor =[[UILabel alloc]initWithFrame:CGRectMake(215, 0, 40, 50)];
        _goodsColor.text=@"颜色";
        _goodsColor.numberOfLines=0;
         _goodsColor.font=[UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:_goodsColor];
        _goodsSzie =[[UILabel alloc]initWithFrame:CGRectMake(260, 0, 50, 50)];
        _goodsSzie.text=@"型号";
        _goodsSzie.numberOfLines=0;
         _goodsSzie.font=[UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:_goodsSzie];
        
//        [singleShopcart setSingleSopCart].goodsChick=_goodsChick;
       
        
    }
    return self;
}
-(void)lTap:(UITapGestureRecognizer *)sender{
    [_goodsChick setHidden:![singleShopcart setSingleSopCart].Chick];
    [singleShopcart setSingleSopCart].Chick=![singleShopcart setSingleSopCart].Chick;
    [_ldelegate send];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
//    NSLog(@"a");
     
}

@end
