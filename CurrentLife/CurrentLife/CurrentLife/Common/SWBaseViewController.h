//
//  SWBaseViewController.h
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWBaseViewController : UIViewController
 //显示网络加载
-(void)showLoadView;
// 网路加载添加提示语
-(void)showLoadViewWithMessage:(NSString*)message;
//加载视图消失
-(void)dismissLoadView;
//用于显示提示信息
-(void)showToast:(NSString*)message;

@end
