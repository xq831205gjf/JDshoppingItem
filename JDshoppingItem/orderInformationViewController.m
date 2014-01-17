#import "orderInformationViewController.h"
#import "newaddress.h"
#import "submitViewController.h"
#import "singleShopcart.h"
#import "goodsInfoView.h"

@interface orderInformationViewController ()

@end

@implementation orderInformationViewController{
    
    NSMutableArray *dataarray;
    int _i;
    BOOL lbool;
    NSArray *shopcar;
    NSString *adressID;
    
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
   
   
// Do any additional setup after loading the view from its nib.
    dataarray=[[NSMutableArray alloc]init];
   
}
-(void)viewDidAppear:(BOOL)animated{
//       NSLog(@"%@",[singleShopcart setSingleSopCart].shareshopcart);
    self.payView.layer.borderWidth=1.0;
    self.goodsViews.layer.borderWidth=1.0;
    //    self.consigneeView.layer.borderWidth=1.0;
    self.distributionView.layer.borderWidth=1.0;
    
    UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setBackgroundColor:[UIColor redColor]];
    [lButton setTitle:@"提交订单" forState:UIControlStateNormal];
    lButton.frame=CGRectMake(220, 5, 100, 50);
    [lButton addTarget:self action:@selector(lButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.payView addSubview:lButton];
    [self.view addSubview:_payView];
    
    [self peisong];
    
    if (![[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"count"] intValue] == 0) {
        NSDictionary *ldRR=[[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"info"]lastObject];
        NSString *zongjie=[ldRR objectForKey:@"amount"];
        _zongjine.text=[NSString stringWithFormat:@"总金额：%@",zongjie];
        shopcar=[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"info"];
        [self lscollview];
    }else{
    _zongjine.text=@"0";
    }
    
    [self setdata];
//    NSLog(@"%@",[singleShopcart setSingleSopCart].shareadress);
    if ([[[singleShopcart setSingleSopCart].shareadress objectForKey:@"count"] intValue] == 0) {
        NSLog(@"没有地址");
        [dataarray addObject:@[@"没有地址 请添加新地址"]];
        [self TABviewLoad];
    }else{
    [dataarray removeAllObjects];
        [self setdata];
        [self data];
        [self TABviewLoad];
        [_consigneeTabView reloadData];
      [_ldelegate send:self];
        NSLog(@"aaaaa");
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setdata{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/getaddress.php",GoodsIP]];
    NSString *checkemail=[NSString stringWithFormat:@"customerid=%d",50];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[checkemail dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    [singleShopcart setSingleSopCart].shareadress=[lDic objectForKey:@"msg"];
   
}
-(void)data{

    NSArray *arr=[ [singleShopcart setSingleSopCart].shareadress objectForKey:@"info"];
    for (int i=0; i<arr.count; i++) {
        NSDictionary *ldic=[arr objectAtIndex:i];
        [dataarray addObject:ldic];
    }
}
-(void)addoder{
//
    NSArray *arr=[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"info"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    for (NSDictionary *lDic in arr) {
        NSString *lString=[lDic objectForKey:@"cartid"];
        [array addObject:lString];
        }
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/addorder.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"customerid=%@&addressid=%@&cartids[0]=%i",@"50",adressID,3];
   NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
   [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
}
-(void)deleteaddress{
    NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/deleteaddress.php",GoodsIP]];
    NSString *userInfo=[NSString stringWithFormat:@"addressid=%@",adressID];
    NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lRequest setHTTPMethod:@"post"];
    [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
    NSData*data=  [NSURLConnection sendSynchronousRequest:lRequest returningResponse:nil error:nil];
    NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",lDic);
    
}

-(void)TABviewLoad{
    
    _consigneeTabView=[[UITableView alloc]initWithFrame:CGRectMake(10, 0, 320, 135)];
//    [consigneeTabView setTag:111];
    _consigneeTabView.delegate=self;
    _consigneeTabView.dataSource=self;
    _consigneeTabView.bounces=NO;
    [_consigneeView addSubview:_consigneeTabView];
    [self.view addSubview:_consigneeView];
    
    
}
-(void)peisong{
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
    
    [self.view addSubview:_distributionView];
}
-(void)lscollview{

    //    NSArray *lShopCar=[[singleShopcart setSingleSopCart].shareshopcart objectForKey:@"info"];
    UIScrollView *lScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 330, 111)];
    //    [lScrollView setBackgroundColor:[UIColor brownColor]];
    for (int i=0; i<shopcar.count; i++) {
        int x=i%3;
        int y=i/3;
        goodsInfoView *lGoodsInfo=[[goodsInfoView alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
        lGoodsInfo.center=CGPointMake(60+x*100, 30+y*65);
        NSURL *lURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/shop/goodsimage/%@",GoodsIP,[[shopcar objectAtIndex:i]objectForKey:@"headerimage"]]];
        NSString *userInfo=[NSString stringWithFormat:@"customerid=%d",50];
        NSMutableURLRequest *lRequest=[NSMutableURLRequest requestWithURL:lURL];
        [lRequest setHTTPMethod:@"post"];
        [lRequest setHTTPBody:[userInfo dataUsingEncoding:NSUTF8StringEncoding]];
        NSOperationQueue *asd=[[NSOperationQueue alloc]init];
        [NSURLConnection sendAsynchronousRequest:lRequest queue:asd completionHandler:^(NSURLResponse *response,NSData *data, NSError *error){
            dispatch_async(dispatch_get_main_queue(), ^{
                lGoodsInfo.goodsHeadImage.image=[UIImage imageWithData:data];
            });
            
        }
         ];
        //        [lGoodsInfo setBackgroundColor:[UIColor redColor]];
        lGoodsInfo.goodsName.text=[[shopcar objectAtIndex:i]objectForKey:@"name"];
        lGoodsInfo.goodsconut.text=[[shopcar objectAtIndex:i]objectForKey:@"goodscount"];
        lGoodsInfo.goodsPrice.text=[[shopcar objectAtIndex:i]objectForKey:@"price"];
        [lScrollView addSubview:lGoodsInfo];
        
    }
    lScrollView.contentSize=CGSizeMake(320, 32+shopcar.count/3*128);
    [_goodsViews addSubview:lScrollView];
}
#pragma mark - Button
-(void)lButton:(UIButton *)sender{
    
    NSLog(@"提交订单");
    [self addoder];
    submitViewController *lSub=[[submitViewController alloc]init];
    [self.navigationController pushViewController:lSub animated:YES];
    
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
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    NSString *key=@"所有地址";
//    return key;
//    
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }else{
    return dataarray.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];

    if ([indexPath section]==0) {
        cell.textLabel.text=@"添加新地址";
    }else{
    NSDictionary *lDic=[dataarray objectAtIndex:[indexPath row]];
    cell.textLabel.text=[lDic objectForKey:@"address"];

//    cell.accessoryType= UITableViewCellAccessoryCheckmark;
    
    }
    }
    return cell;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section]==0) {
        return NO;
    }else{
        return YES;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath section]==1) {
        NSDictionary *ldic= [dataarray objectAtIndex:[indexPath row]];
        adressID=[[NSString alloc]initWithString:[ldic objectForKey:@"addressid"]];
    }
   
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataarray removeObjectAtIndex:[indexPath row]];
        [self deleteaddress];
        [self setdata];
//       [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
        [_consigneeTabView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    newaddress *lNewaddress=[[newaddress alloc]init];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section]==0) {
        lNewaddress.title=@"添加新地址";
        [self.navigationController pushViewController:lNewaddress animated:YES];
    }else{
    
    lNewaddress.title=@"修改地址";
    [self.navigationController pushViewController:lNewaddress animated:YES];
    
    }

    UITableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
        if (oneCell.accessoryType == UITableViewCellAccessoryNone) {
   
        oneCell.accessoryType = UITableViewCellAccessoryCheckmark;
   
      } else{
   
           oneCell.accessoryType = UITableViewCellAccessoryNone;
      }
    
}

@end
