//
//  addressCell.h
//  JDshoppingItem
//
//  Created by 219 on 14-1-8.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addressCell : UITableViewCell
@property (nonatomic,retain)NSDictionary *addressInfo;
-(id)initWithDictionary:(NSDictionary *) sender;
@end
