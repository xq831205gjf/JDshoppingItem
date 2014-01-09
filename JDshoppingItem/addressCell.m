//
//  addressCell.m
//  JDshoppingItem
//
//  Created by 219 on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "addressCell.h"

@implementation addressCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.addressInfo=[[NSDictionary alloc]init];
        
        // Initialization code
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)sender{
    self=[super init];
    if (self) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(5, 0, 310, 109)];
        view.layer.cornerRadius=10.0;
        view.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:view];
        
        UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 250, 15)];
        name.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:14];
        name.textColor=[UIColor blueColor];
        NSString *string=[sender objectForKey:@"name"];
        name.text=[NSString stringWithFormat:@"收件人：%@",string];
        [view addSubview:name];
        
        
        UILabel *telephone=[[UILabel alloc]initWithFrame:CGRectMake(10, 85, 280, 15)];
        telephone.font=[UIFont fontWithName:@"American Typewriter" size:13];
        NSString *string1=[sender objectForKey:@"telephone"];
        NSString *string2=[sender objectForKey:@"code"];
        telephone.text=[NSString stringWithFormat:@"联系电话：%@",string1];
        [view addSubview:telephone];
        UILabel *code=[[UILabel alloc]initWithFrame:CGRectMake(10, 65, 280, 15)];
        code.font=[UIFont fontWithName:@"American Typewriter" size:13];
        code.text=[NSString stringWithFormat:@"邮编：%@",string2];
        [view addSubview:code];
        
        
        
        UILabel *address=[[UILabel alloc]initWithFrame:CGRectMake(10, 35, 280, 30)];
        address.font=[UIFont fontWithName:@"American Typewriter" size:13];
        address.numberOfLines=0;
        NSString *string3=[sender objectForKey:@"address"];
        address.text=[NSString stringWithFormat:@"详细收货地址：%@",string3];
        [view addSubview:address];
    }
    return  self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
