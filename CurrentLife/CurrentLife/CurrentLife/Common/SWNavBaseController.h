//
//  SWNavBaseController.h
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWBaseViewController.h"
#import <UIKit/UIKit.h>
@interface SWNavBaseController : SWBaseViewController
@property(nonatomic, strong)UIView* navView;
@property(nonatomic, strong)UIButton * leftBtn;
@property(nonatomic, strong)UILabel * titleLable;
@property(nonatomic, strong)UIButton * rightBtn;

//接口
//-(void)backMethod;
//-(void)loginMethod;
@end
