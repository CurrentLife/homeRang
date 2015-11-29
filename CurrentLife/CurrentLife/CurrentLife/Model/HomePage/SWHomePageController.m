//
//  SWHomePageController.m
//  CurrentLife
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWHomePageController.h"

@interface SWHomePageController ()

@end

@implementation SWHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLable.textColor = [UIColor whiteColor];
      self.titleLable.text = @"联系商家";

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
