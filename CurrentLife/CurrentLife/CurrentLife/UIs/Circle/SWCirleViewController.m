//
//  SWCirleViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWCirleViewController.h"

@interface SWCirleViewController ()

@end

@implementation SWCirleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLable.text =@"圈子";
    self.titleLable.textColor = [UIColor greenColor];
    
    //加载
    [self showLoadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
