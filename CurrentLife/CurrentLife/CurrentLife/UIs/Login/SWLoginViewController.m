//
//  SWLoginViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWLoginViewController.h"
#import "SWUserCenterController.h"
@interface SWLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *rememberPassword;
//忘记密码
@property (weak, nonatomic) IBOutlet UIButton *forgetPassWord;
//登陆
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//注册
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation SWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.titleLable.text = @"登陆";
    self.titleLable.textColor = [UIColor  greenColor];
//     self.rightBtn.hidden = YES;
    
}
-(void)backMethod{
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self.navigationController popViewControllerAnimated:YES
//     ];

    AppDelegate * appDele = [UIApplication sharedApplication].delegate;
    [appDele.tab showOrHiddenTabBarView:NO];
    
    
    
}
//控制器跳转方法
-(void)loginMethod{
    SWUserCenterController * userCV =[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"SWUserCenterController"];
    AppDelegate * app =[UIApplication sharedApplication].delegate;
    [app.tab showOrHiddenTabBarView:NO];
    
    [self.navigationController pushViewController:userCV animated:YES];
}


- (IBAction)rememberBtn:(id)sender {
}

- (IBAction)forgetBtn:(id)sender {
    
}
- (IBAction)loginBtn:(id)sender {
    
}
- (IBAction)registerBtn:(id)sender {
    
}
- (IBAction)slenderBtn:(id)sender {
    
}
- (IBAction)incognitoBtn:(id)sender {
    
}
- (IBAction)QQBtn:(id)sender {
    
}
- (IBAction)cressBtn:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
