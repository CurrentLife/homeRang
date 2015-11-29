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
    //rgb设置随机颜色(arc4random())
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
    
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
//Tost框架(提示框方法)
-(void)showToast:(NSString *)message{
    [self.view  makeToast:message];
}
@end
