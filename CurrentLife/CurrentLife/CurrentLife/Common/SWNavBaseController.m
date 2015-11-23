//
//  SWNavBaseController.m
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWNavBaseController.h"
#define  KnavItemWidth  44
@interface SWBaseViewController()


@end
@implementation SWNavBaseController


- (void)viewDidLoad {
    [super viewDidLoad];
    _navView =[[UIView alloc]initWithFrame:CGRectMake(0, 0,KUIScreenWidth,KUIScreenHeight)];
    _navView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_navView];
    //左边按钮
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(0,kUIStatusBarHeight, KnavItemWidth, KnavItemWidth);
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(backMethod) forControlEvents:    UIControlEventTouchUpInside];
    [_navView addSubview:_leftBtn];
    //标题 --固定宽高
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(KnavItemWidth, kUIStatusBarHeight,KUIScreenWidth - 2 * KnavItemWidth, KnavItemWidth)];
    _titleLable.text = @"首页";
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.textColor =[UIColor blackColor];
    _titleLable.font =[UIFont systemFontOfSize:19.0];
//    [_titleLable sizeToFit];//不合适
    [_navView addSubview:_titleLable];
    //右边的登陆按钮
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightBtn addTarget:self action:@selector(loginMethod) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_rightBtn];
    
    //判断是否登陆
    if((NO)){
        
        _rightBtn.frame =CGRectMake(KUIScreenWidth -KnavItemWidth, kUIStatusBarHeight, KnavItemWidth, KnavItemWidth);
    [_rightBtn setImage:[UIImage imageNamed:@"nav_login"] forState:UIControlStateNormal];
    }else{
        _rightBtn.frame =CGRectMake(KUIScreenWidth - 2*KnavItemWidth, kUIStatusBarHeight,2* KnavItemWidth, KnavItemWidth);
        [_rightBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
    }

}
//隐藏系统的navBar 
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}
-(void)backMethod{
        
    }
-(void)loginMethod{
        
    }
@end

