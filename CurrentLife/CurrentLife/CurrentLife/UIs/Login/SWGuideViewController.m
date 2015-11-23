//
//  SWGuideViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWGuideViewController.h"
#import "SWFunction.h"
#import "AppDelegate.h"
@interface SWGuideViewController ()

@end

@implementation SWGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:KUIScreenBounds];
    scrollView.contentSize =CGSizeMake(3*KUIScreenWidth, 0);
    scrollView.pagingEnabled =YES;
    scrollView.showsHorizontalScrollIndicator =NO;
    scrollView.bounces =NO;
    [self.view addSubview:scrollView];
    
    //通过循环来添加子视图
    
    for (int i = 0 ; i < 3; i++) {
        UIImageView * image =[[UIImageView alloc]initWithFrame:CGRectMake(KUIScreenWidth*i, 0, KUIScreenWidth, KUIScreenHeight)];
        NSString *imgName = [NSString stringWithFormat:@"guide_%d",i];
        image.image = [UIImage imageNamed:imgName];
        [scrollView addSubview:image];
        
    //第三张图片，添加手势
        if(i == 2){
            UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(enter)];
            image.userInteractionEnabled = YES;
            [image addGestureRecognizer:tap];
        }
    }
    
}

#pragma mark --跳转主控制器
- (void)enter{
    //更改根控制器  bool
    //保存到偏好设置中 记录初次使用
    [SWFunction saveValue:YES forKey:kFirstLanuch];
    //2.不建议使用 -- 容易乱改
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    [app  enterMain];
    
    //通知
    [[NSNotificationCenter defaultCenter]postNotificationName:kNotificationGuideEnter object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
