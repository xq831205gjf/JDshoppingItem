//
//  CustomReviewCell.m
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-15.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "CustomReviewCell.h"
#import "CommentView.h"
@implementation CustomReviewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label1= [[UILabel alloc]initWithFrame:CGRectMake(10, 6, 30, 10)];
        label1.font = [UIFont systemFontOfSize:11];
        [label1 setText:@"星级:"];
        [self addSubview:label1];
        
        _lCommentView = [[CommentView alloc]initWithHeight:12 AndStar:0];
        [_lCommentView setCenter:CGPointMake(90, 10)];
        [self addSubview:_lCommentView];
        
        _lInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 240,40 )];
        [self addSubview:_lInfoLabel];
        
        _lDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 240, 20)];
        _lDataLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_lDataLabel];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 72, 40, 10)];
        [label2 setText:@"评论人:"];
        label2.font = [UIFont systemFontOfSize:11];
        [self addSubview:label2];
        
        _lUserLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 60, 60, 30)];
         _lUserLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_lUserLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
