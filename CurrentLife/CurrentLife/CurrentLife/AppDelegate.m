//
//  AppDelegate.m
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "SWHomeViewController.h"
#import "SWCirleViewController.h"
#import "SWGuideViewController.h"
#import "SWHostViewController.h"
#import "SWToolsViewController.h"
#import "SWHomePageController.h"
#import "SWOnLiveController.h"
#import "SWUSViewController.h"
#import "SWShakeViewController.h"
#import "SWTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
          [self.window  makeKeyAndVisible];//显示
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterMain) name:kNotificationGuideEnter object:nil];
    
    //第一次运行
    BOOL flag =[[NSUserDefaults standardUserDefaults]boolForKey:kFirstLanuch];
    if (flag) {
        //进入到主视图
        [self enterMain];
    }
    else{
        //更改控制器
        self.window.rootViewController =[[SWGuideViewController alloc]init];
    }
    return YES;
}



//控制器接口
- (void)enterMain{
    //拿到Strotyboard
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //用于盛放tabbar的子控制器
    NSMutableArray *tabBarArray = [NSMutableArray array];
    
    NSArray *controllers = @[@"SWHomeViewController",@"SWHostViewController",@"SWCirleViewController",@"SWToolsViewController",@"SWHomePageController",@"SWShakeViewController",@"SWOnLiveController",@"SWUSViewController"];
    
    for (NSString *vcName in controllers) {
//        NSClassFromString()
        Class vc = [story instantiateViewControllerWithIdentifier:vcName];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [tabBarArray addObject:nav];
        
        
    }
    //实例化 TabBarController
    SWTabBarController *tab = [[SWTabBarController alloc]init];
    //设置tabbarController 所管理的所有控制器
    tab.viewControllers = tabBarArray;
    
    self.window.rootViewController = tab;

    
}
//删除通知
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
