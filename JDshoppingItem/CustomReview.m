//
//  CustomReview.m
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "CustomReview.h"
#import "CustomReviewCell.h"

@implementation CustomReview

- (id)initWithFrame:(CGRect)frame andWithDictionary:(NSDictionary *)lDic
{
    self = [super initWithFrame:frame];
    if (self) {
        lAllArray = [[NSArray alloc]init];
        lAllArray = [lDic objectForKey:@"infos"];
        UITableView *lTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 220)];
        lTableView.delegate = self;
        lTableView.dataSource = self;
        [self addSubview:lTableView];
    }
    return self;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"用户评价";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return lAllArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"cell";
    CustomReviewCell *lCell = (CustomReviewCell *)[tableView dequeueReusableCellWithIdentifier:Cell];
    if (lCell == nil) {
        lCell = [[CustomReviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    NSDictionary *lDic = [lAllArray objectAtIndex:[indexPath row]];
    double i = [[lDic objectForKey:@"star"] doubleValue];
    [lCell.lCommentView setStarValue:i];
    [lCell.lInfoLabel setText:[lDic objectForKey:@"detail"]];
    [lCell.lDataLabel setText:[lDic objectForKey:@"date"]];
    [lCell.lUserLabel setText:[lDic objectForKey:@"name"]];
    
    return lCell;
}
@end
