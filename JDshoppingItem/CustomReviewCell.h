//
//  CustomReviewCell.h
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-15.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentView.h"
@interface CustomReviewCell : UITableViewCell


@property(nonatomic ,retain)CommentView *lCommentView;
@property(nonatomic ,retain)UILabel *lInfoLabel;
@property(nonatomic ,retain)UILabel *lDataLabel;
@property(nonatomic ,retain)UILabel *lUserLabel;
@end
