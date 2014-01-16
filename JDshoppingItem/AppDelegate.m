//
//  AppDelegate.m
//  JDshoppingItem
//
//  Created by TY on 14-1-7.
//  Copyright (c) 2014年 王臻. All rights reserved.
//

#import "AppDelegate.h"
//#import "AllGoodsViewController.h"
#import "ViewController.h"
#import "TabBarViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    AllGoodsViewController *lAllGoodsViewController = [[AllGoodsViewController alloc]init];
//    UINavigationController *lNavigationVC = [[UINavigationController alloc]initWithRootViewController:lAllGoodsViewController];
//    UITabBarController *lTabBarController = [[UITabBarController alloc]init];
//    [lTabBarController setViewControllers:@[lNavigationVC]];
    TabBarViewController *lTabbarVC = [[TabBarViewController alloc]init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = lTabbarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    if ([ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo == nil) {
        [ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo = [[NSMutableDictionary alloc]init];
    }
    NSArray *larray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *lstr = [larray lastObject];
    NSString *lpath = [lstr stringByAppendingPathComponent:@"ShoppingOfUserInfo.txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:lpath]) {
        NSDictionary *lDictionary = [NSDictionary dictionaryWithContentsOfFile:lpath];
        [[ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo setDictionary:lDictionary];
        NSString *lstr = [NSString stringWithFormat:@"name=%@&password=%@",[[ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo objectForKey:@"name"],[[ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo objectForKey:@"password"]];
        NSString *string = [NSString stringWithFormat:@"http://%@/shop/login.php",GoodsIP];
        NSURL *lurl = [NSURL URLWithString:string];
        NSMutableURLRequest *lmutableURLRequest = [NSMutableURLRequest requestWithURL:lurl];
        [lmutableURLRequest setHTTPMethod:@"post"];
        [lmutableURLRequest setHTTPBody:[lstr dataUsingEncoding:NSUTF8StringEncoding]];
        NSData *data = [NSURLConnection sendSynchronousRequest:lmutableURLRequest returningResponse:nil error:nil];
        NSDictionary *ldicionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"daying:%@",ldicionary);
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    [self writeToPath];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - writeToFile
-(void)writeToPath{
    NSArray *larray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *lstring = [larray lastObject];
    NSString *lPath = [lstring stringByAppendingPathComponent:@"ShoppingOfUserInfo.txt"];
    [[ShoppingInfoClass SharCommonInfo].lDictionaryOfUserInfo writeToFile:lPath atomically:YES];
    
}

@end
