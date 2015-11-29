//
//  SWUserCenterController.m
//  CurrentLife
//
//  Created by mac on 15/11/29.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWUserCenterController.h"
#import "SWLoginViewController.h"
@interface SWUserCenterController ()

@end

@implementation SWUserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLable.text =@"个人中心";
    self.titleLable.textColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

-(void)backMethod{
//    [self.navigationController popToRootViewControllerAnimated:YES
//     ];
    
    /*跳转到指定页面
     [self.navigationController popToViewController:vcHome animated:YES];
     这里需要填写的数据就不是UIViewController了，而是数组。所以需要转型。）*/
    for (UIViewController *vcHome in self.navigationController.viewControllers) {
        if ([vcHome isKindOfClass:[SWLoginViewController class]]) {
            [self.navigationController popToViewController:vcHome animated:YES];
        }
    }
    
//    [self.navigationController popToViewController:self animated:YES];
    AppDelegate * appDele = [UIApplication sharedApplication].delegate;
    [appDele.tab showOrHiddenTabBarView:NO];
    
    
    
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
