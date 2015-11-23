//
//  SWHomeViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWHomeViewController.h"

@interface SWHomeViewController ()

@end

@implementation SWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoadView];
    [self performSelector:@selector(dismissLoadView) withObject:nil afterDelay:1.0];
    [self showToast:@"你输没输"];
    
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
