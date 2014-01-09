//
//  DingdanCell.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "DingdanCell.h"

@implementation DingdanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)sender{
    self=[super init];
    if (self) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(5, 0, 310, 90)];
        view.layer.cornerRadius=10.0;
        view.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:view];
        
        UILabel *ddh=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 250, 15)];
        ddh.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:14];
        ddh.textColor=[UIColor redColor];
        NSString *string=[sender objectForKey:@"ordercode"];
        ddh.text=[NSString stringWithFormat:@"订单号：%@",string];
        [view addSubview:ddh];
        
        UILabel *la=[[UILabel alloc]initWithFrame:CGRectMake(10, 26, 100, 15)];
        la.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:13];
        if ([[sender objectForKey:@"state"] isEqualToString:@"0"]) {
            la.textColor=[UIColor redColor];
            la.text=@"未支付";
        }else if([[sender objectForKey:@"state"]isEqualToString:@"1"]){
            la.textColor=[UIColor blueColor];
            la.text=@"已支付";
        }
        [view addSubview:la];
        
        
        UILabel *address=[[UILabel alloc]initWithFrame:CGRectMake(10, 45, 280, 15)];
        address.font=[UIFont fontWithName:@"American Typewriter" size:13];
        //address.numberOfLines=0;
        NSString *string3=[sender objectForKey:@"date"];
        address.text=[NSString stringWithFormat:@"下单时间：%@",string3];
        [view addSubview:address];
        
        
        UILabel *code=[[UILabel alloc]initWithFrame:CGRectMake(10,60, 280, 15)];
        NSString *string2=[sender objectForKey:@"amount"];
        code.font=[UIFont fontWithName:@"American Typewriter" size:13];
        code.text=[NSString stringWithFormat:@"付款金额：￥%@",string2];
        [view addSubview:code];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
