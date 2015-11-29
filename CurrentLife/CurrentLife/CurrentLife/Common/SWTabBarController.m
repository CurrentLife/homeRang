//
//  SWTabBarController.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWTabBarController.h"
#import "SWFactory.h"
#define KTabTOPViewHeight 44
@interface SWTabBarController ()
//top view
@property(nonatomic,strong)UIView *topView;
//bottom view(底部)
@property(nonatomic,strong)UIView * bottomView;

@end

@implementation SWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*影藏系统tabBar*/
    self.tabBar.hidden = YES;
    
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, KUIScreenHeight - kUITabBarHeight, KUIScreenWidth, kUITabBarHeight)];
    _bottomView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_bottomView];
    
    //添加button
    for (int i =0 ; i < 5; i++) {
        UIButton * btnItem = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置button的图片
        NSString * imgNormal = [NSString stringWithFormat:@"home_%d",i];
        [btnItem setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
        NSString * imgSeclected =[NSString stringWithFormat:@"home_%d_pressed",i];
        [btnItem setImage:[UIImage imageNamed:imgSeclected] forState:UIControlStateSelected];
        
        //设置frame（比例系数原则）
        
        btnItem.frame = CGRectMake(i * KUIScreenWidth/ 5.0, 0, KUIScreenWidth/5.0, kUITabBarHeight);
        btnItem.tag = i;
        [btnItem addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btnItem];
        
        //默认选中第一个
        if(i == 0){
            btnItem.selected = YES;
            
        }
        
        
    }
    
    
    //top  view 初始化
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, KUIScreenHeight - kUITabBarHeight- KTabTOPViewHeight, KUIScreenWidth, kUITabBarHeight)];
    _topView.backgroundColor =[UIColor yellowColor];
    _topView.hidden = YES;//默认隐藏
    [self.view addSubview:_topView];
    //给top view 添加背景图片
    UIImageView * bgTopImg = [[UIImageView alloc]initWithFrame:_topView.bounds];//frame添加图片有问题
    bgTopImg.image = [UIImage imageNamed:@"home_topbar"];
    [_topView addSubview:bgTopImg];
    
    //设置topview 上的 button（比例系数添加原则）
    UIButton * homePageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    homePageBtn.frame = CGRectMake(5, 0, KUIScreenWidth * (130.0/640.0),/*必须为Float类型*/ KTabTOPViewHeight);
    
    [homePageBtn addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [homePageBtn setTitle:@"联系商家" forState:UIControlStateNormal];
    homePageBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];

    [homePageBtn.titleLabel sizeToFit];
    homePageBtn.tag = 5;
    
    [_topView addSubview:homePageBtn];
    
   
    //摇一摇
    UIButton *shakeBtn = [SWFactory type:0 withFrame:CGRectMake(KUIScreenWidth * (160.0/640.0),0, KUIScreenWidth * (180.0/640.0), KTabTOPViewHeight) withtitle:@"摇一摇" withTarget:self withAction:@selector(changeVC:)];
    shakeBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    

     shakeBtn.tag = 6;
    
    [_topView addSubview:shakeBtn];
    
   
    //直播
    UIButton *onliveBtn = [SWFactory type:0 withFrame:CGRectMake(KUIScreenWidth * (350.0/640.0), 0, KUIScreenWidth * (108.0/640.0), KTabTOPViewHeight) withtitle:@"直播" withTarget:self withAction:@selector(changeVC:)];

    onliveBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
//
     onliveBtn.tag = 7;
    
    [_topView addSubview:onliveBtn];

    
    //关于
    UIButton *about = [SWFactory type:0 withFrame:CGRectMake(KUIScreenWidth * ((640-170)/640.0), 0, KUIScreenWidth * (150.0/640.0), KTabTOPViewHeight) withtitle:@"关于" withTarget:self withAction:@selector(changeVC:)];

    about.titleLabel.font = [UIFont systemFontOfSize:16.0];
    
    about.tag = 8;
    
    [_topView addSubview:about];
    
}




#pragma  --按钮 点击方法（改变对应的button图片的状态）
-(void)changeVC:(UIButton*)bt{
    _topView.hidden =YES;
    //取消所有选中
    [_bottomView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * hortybtn =obj;
           hortybtn.selected = NO;
    }];
    
    //当前选中
    bt.selected = YES;
    //前4个需要更改控制
    if (bt.tag < 4) {
        self.selectedIndex = bt.tag;
        
    }
    else if (bt.tag == 4){
        //第4个需要显示TopView
        
        _topView.hidden = NO;
    } else{
        //第五个及其以后的需要更改
        self.selectedIndex = bt.tag - 1;
    }
    
}

#pragma mark -- 隐藏或显示
-(void)showOrHiddenTabBarView:(BOOL)flag{
    if (flag) {
        _bottomView.hidden = YES;
        _topView.hidden = YES;
    }else{
        _bottomView.hidden = NO;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
