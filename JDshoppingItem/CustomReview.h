//
//  CustomReview.h
//  JDshoppingItem
//
//  Created by 周钦 on 14-1-14.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomReview : UIView<UITableViewDataSource,UITableViewDelegate>{
    NSArray *lAllArray;
}

-(id)initWithFrame:(CGRect)frame andWithDictionary:(NSDictionary *)lDic;
@end
