//
//  AppDelegate.h
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTabBarController.h"
      //UIResponder 应答器
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)SWTabBarController * tab;
-(void)enterMain;
@end

