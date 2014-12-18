//
//  AppDelegate.m
//  MyPro
//
//  Created by sk on 14/11/26.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "AppDelegate.h"
#import "MyProViewController.h"
#import "myCategoryPage.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window = window;
    self.window.backgroundColor = [UIColor purpleColor];
    
    UITabBarController*myProTabBar = [[UITabBarController alloc]init];
    //---------two tableview
    MyProViewController* myProFirstView = [[MyProViewController alloc]init];
    myCategoryPage* myProSecView = [[myCategoryPage alloc]init];

    //---------two navigationController
    UINavigationController * myProFirstNaviCon = [[UINavigationController alloc]initWithRootViewController:myProFirstView];
    UINavigationController* myProSecNaviCon = [[UINavigationController alloc]initWithRootViewController:myProSecView];
   
    //----------two TabBar
    UITabBarItem* myProFirstTabBar = [[UITabBarItem alloc]init];
    myProFirstTabBar.title = @"首页";
    myProFirstTabBar.image = [UIImage imageNamed:@"lala"];
    
    UITabBarItem* myProSecTabBar = [[UITabBarItem alloc]init];
    myProSecTabBar.title = @"分类";
    myProSecTabBar.image = [UIImage imageNamed:@"Players"];
    myProFirstNaviCon.tabBarItem = myProFirstTabBar;
    myProSecNaviCon.tabBarItem = myProSecTabBar;
    
    //myProSecNaviCon.tabBarController
    myProFirstView.navigationItem.title = @"Page首页";
    myProSecView.navigationItem.title = @"Page分类";
    NSArray* myProArray = [[NSArray alloc]initWithObjects:myProFirstNaviCon,myProSecNaviCon, nil];
    
    
    myProTabBar.viewControllers = myProArray;
    
    self.window.rootViewController = myProTabBar;
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
