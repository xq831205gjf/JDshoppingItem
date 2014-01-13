//
//  CustomPickerView.h
//  JDshoppingItem
//
//  Created by TY on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate;
@interface CustomPickerView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,assign)id<CustomViewDelegate> ldelegate;
@property(nonatomic ,strong)NSString *lString;
@property(nonatomic ,strong)NSString *lString1;
@end

@protocol CustomViewDelegate        <NSObject>
-(void)customViewByDelete:(NSString *)customView;
-(void)customViewByString:(NSString *)customView;

@end
