//
//  StarView.h
//  CustomView
//
//  Created by Mingle Chang on 14-1-13.
//  Copyright (c) 2014年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
-(id)initWithFrame:(CGRect)frame AndStar:(double)star;
-(void)setStarValue:(double)star;
@end
