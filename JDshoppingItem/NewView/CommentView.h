//
//  CommentView.h
//  CustomView
//
//  Created by Mingle Chang on 14-1-13.
//  Copyright (c) 2014年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIView{
    NSArray *_array;
}
-(id)initWithHeight:(double)height AndStar:(double)star;
-(void)setStarValue:(double)star;
@end
