#import "orderInformationViewController.h"
#import "newaddress.h"
#import "submitViewController.h"

@interface orderInformationViewController ()

@end

@implementation orderInformationViewController{
    
    NSMutableArray *dataarray;
    int _i;
    BOOL lbool;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setdata];
    [self viewLoad];
    _zongjine.text=[NSString stringWithFormat:@"总金额：%d",5];
    // Do any additional setup after loading the view from its nib.
    self.payView.layer.borderWidth=1.0;
    self.goodsViews.layer.borderWidth=1.0;
    //    self.consigneeView.layer.borderWidth=1.0;
    self.distributionView.layer.borderWidth=1.0;
    dataarray=[[NSMutableArray alloc]initWithObjects:@"添加新地址", nil];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setdata{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/getaddress.php",GoodsIP]];
    NSString *checkemail=[NSString stringWithFormat:@"customerid=%d",3];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[checkemail dataUsingEncoding:NSUTF8StringEncoding]];
//    NSOperationQueue *aa=[[NSOperationQueue alloc]init];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
//    NSDictionary *lDic1=[lDic objectForKey:@"msg"];
//    NSArray *arr=[lDic1 objectForKey:@"info"];
//    for (int i=0; i<arr.count; i++) {
//        NSDictionary *ldic=[arr objectAtIndex:i];
//        [dataarray addObject:ldic];
//}
//    NSLog(@"%@",dataarray);
}
-(void)viewLoad{
    
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setBackgroundColor:[UIColor redColor]];
    [lButton setTitle:@"提交订单" forState:UIControlStateNormal];
    lButton.frame=CGRectMake(220, 5, 100, 50);
    [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.payView addSubview:lButton];
    
    UITableView *consigneeTabView=[[UITableView alloc]initWithFrame:CGRectMake(10, 0, 320, 135)];
    consigneeTabView.delegate=self;
    consigneeTabView.dataSource=self;
    consigneeTabView.bounces=NO;
    [_consigneeView addSubview:consigneeTabView];
    
    //配送方式
    lbool=YES;
    NSArray *lArray=[NSArray arrayWithObjects:@"顺丰",@"圆通",@"ems",@"申通", nil];
    for (_i=0; _i<lArray.count; _i++) {
        UIButton *lBtuuon=[UIButton buttonWithType:UIButtonTypeCustom];
        lBtuuon.backgroundColor=[UIColor redColor];
        [lBtuuon setTag:_i];
        [lBtuuon setTitle:[lArray objectAtIndex:_i] forState:UIControlStateNormal];
        [lBtuuon setFrame:CGRectMake(10+_i*80, 0, 40, 40)];
        [lBtuuon addTarget:self action:@selector(lBtuuon:) forControlEvents:UIControlEventTouchUpInside];
        [_distributionView addSubview:lBtuuon];
      
    }
    
    for (_i=0; _i<lArray.count; _i++) {
        
    UIImageView *lImage=[[UIImageView alloc]initWithFrame:CGRectMake(20+_i*80, 40, 20, 20)];
        [lImage setTag:10+_i];
        lImage.image=[UIImage imageNamed:@"check.png"];
        [lImage setHidden:YES];
        [_distributionView addSubview:lImage];

    }
    [[self.view viewWithTag:10]setHidden:NO];
    
}
#pragma mark - Button
-(void)lButton:(UIButton *)sender{
    [self addoder];
    NSLog(@"提交订单");
    submitViewController *lSub=[[submitViewController alloc]init];
    [self.navigationController pushViewController:lSub animated:YES];
    
}
-(void)addoder{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/addorder.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%d&addressid=%d&cartids[0]=%@",3,3,dataarray];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *aa=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:lRequest queue:aa completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSString *aaa=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"adas:%@",aaa);
                        
        });
        
    }
     ];
}
-(void)lBtuuon:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [[self.view viewWithTag:10]setHidden:lbool];
            lbool=!lbool;
            break;
        case 1:
            [[self.view viewWithTag:11]setHidden:lbool];
            lbool=!lbool;
            break;
        case 2:
            [[self.view viewWithTag:12]setHidden:lbool];
            lbool=!lbool;
            break;
        case 3:
            [[self.view viewWithTag:13]setHidden:lbool];
            lbool=!lbool;
            break;
            
        default:
            break;
           
    }
}

#pragma mark - Table view delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *key=@"所有地址";
    return key;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
//    if ([indexPath row]==0) {
//        cell.textLabel.text=@"添加新地址";
//    }else{
    cell.textLabel.text=[dataarray objectAtIndex:[indexPath row]];
    
//    }
    
    return cell;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row]==0) {
        return NO;
    }else{
        return YES;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataarray removeObjectAtIndex:[indexPath row]];
        [self deleteaddress];
        //        [_MyTabeleView reloadData];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}
-(void)deleteaddress{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/deleteaddress.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"addressed=%d",3];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=[NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    newaddress *lNewaddress=[[newaddress alloc]init];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath row]==0) {
        lNewaddress.title=@"添加新地址";
        [self.navigationController pushViewController:lNewaddress animated:YES];
    }else{
    
    lNewaddress.title=@"修改地址";
    [self.navigationController pushViewController:lNewaddress animated:YES];
    
    }
    
    
    
}

@end
