//
//  SWOnLiveController.m
//  CurrentLife
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWOnLiveController.h"

@interface SWOnLiveController ()

@end

@implementation SWOnLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
         self.titleLable.textColor = [UIColor whiteColor];
      self.titleLable.text = @"直播";


//    [SWAFHTTPClient getURL:@"http:www.qd-life.com /?anu=api/1/index/get_index_info" withParams:nil withSuccessBlock:^(id JSON) {
//        
//    } withFailedBlock:^(NSError *error) {
//        
//    }];
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
