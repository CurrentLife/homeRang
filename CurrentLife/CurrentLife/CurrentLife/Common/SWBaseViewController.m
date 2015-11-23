//
//  SWBaseViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWBaseViewController.h"
#import "MBProgressHUD.h"
#import "UIView+Toast.h"
@interface SWBaseViewController()
{
    MBProgressHUD * HUD;
    
}
@end

@implementation SWBaseViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //rgb设置随机颜色
    self.view.backgroundColor = [UIColor colorWithRed:rand() % 255 / 255.0 green:rand() % 255 / 255.0 blue:rand() % 255 / 255.0 alpha:1.0];
    
}
-(void)showLoadView{
    HUD =[[MBProgressHUD alloc]initWithView:self.view];
    [HUD show:YES];
    [self.view addSubview:HUD];
}  
-(void)dismissLoadView{
    
    if (HUD) {
        [HUD removeFromSuperview];
        [HUD hide:YES];
        HUD = nil;
    }
}
-(void)showToast:(NSString *)message{
    [self.view  makeToast:message];
}
@end
