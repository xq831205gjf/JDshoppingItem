//
//  CustomPickerView.m
//  JDshoppingItem
//
//  Created by TY on 14-1-9.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "CustomPickerView.h"

@implementation CustomPickerView{

    NSDictionary *lCityDic;
    NSArray *CityCount;
    NSArray *CityCount1;
    NSDictionary  *lDic;
    NSDictionary  *lDic2;
    NSMutableArray *cityarr;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate=self;
        self.dataSource=self;
        self.showsSelectionIndicator=YES;
        NSString *lPath=[[NSBundle mainBundle]pathForResource:@"city" ofType:@"json"];
        NSData *lData=[NSData dataWithContentsOfFile:lPath];
         NSDictionary *ldic=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@",lCityDic);
        CityCount=[[NSArray alloc]initWithArray:[ldic objectForKey:@"城市代码"]];
        cityarr=[[NSMutableArray alloc]init];
    
       
    }
    return self;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return CityCount.count;
    }else{
    
        return cityarr.count;
        NSLog(@"%d",cityarr.count);
        
    }
    
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    
    if (component == 0) {
        lDic=[[NSDictionary alloc]initWithDictionary:[CityCount objectAtIndex:row]];
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)] ;
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [lDic objectForKey:@"省"];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
        
    }
    else {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 110, 30)] ;
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.text =[cityarr objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     if (component == 0) {
         NSLog(@"%d",row);
         
         NSDictionary* Dic=[[NSDictionary alloc]initWithDictionary:[CityCount objectAtIndex:row]];
         CityCount1=[Dic objectForKey:@"市"];
         
//         lDic2=[CityCount1 objectAtIndex:row];
//         NSLog(@"%@",lDic2);
         if (cityarr.count != 0) {
             [cityarr removeAllObjects];
         }
         for (int i=0; i<CityCount1.count; i++) {
             NSDictionary *lDCC =[CityCount1 objectAtIndex:i];
             NSString *lString=[lDCC objectForKey:@"市名"];
             NSLog(@"%@",lString);
            [cityarr addObject:lString];
         }
        
         [self reloadAllComponents];
//         [cityarr removeAllObjects];
    }
    

}



@end
