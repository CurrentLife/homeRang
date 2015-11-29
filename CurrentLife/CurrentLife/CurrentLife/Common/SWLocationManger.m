//
//  SWLocationmanager.m
//  CurrentLife
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 itcast. All rights reserved.
/*定位 CLLocationManager在 ios8之后需要设置授权
 
 1.
 是不是存在一个库函数可以直接知道 本程序的定位是否打开？本人想在定位打开的时候按钮显示暂停，未打开的时候按钮显示开始
 if([CLLocationManager locationServicesEnabled]){
 [btn setTitle:@"暂停" forState:UIControlStateNormal];
 
 }else{
 [btn setTitle:@"开始" forState:UIControlStateNormal];
 }
 */

#import "SWLocationManger.h"
@interface SWLocationManger()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager * manager;
@property(nonatomic,copy)successLocal  sLocal;
@property(nonatomic,copy)errorLocal  eLocal;

//添加标志位 --用于记录回调
@property (nonatomic,assign)BOOL  isLocation;
@end
@implementation SWLocationManger
-(id)init{
    if (self =[super init]) {
        _manager = [[CLLocationManager alloc]init];
        
        if ([_manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            //授权
            [_manager requestAlwaysAuthorization];
        }
        //设置代理
        _manager.delegate =self;
    }
    return  self;
}
//单例
+(id)shareInstance{
    static id manager = nil;//置空
    static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       manager =[[self alloc]init];
   });
    return manager;
    
}

#pragma  mark --CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [_manager stopUpdatingLocation];//停止更新
//    self.eLocal(error);
    SNSLog(@"%@",error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    SNSLog(@"%@",locations.lastObject);
    
    if (locations.count >0) {
        
        //获取到定位经纬度
        CLLocation * location = locations.lastObject;
        
        if (!_isLocation) {
            //定位成功，回调 coordinate 经纬度
            self.sLocal(location.coordinate);
            _isLocation = YES;
        }
        
    }
    //停止更新
    [_manager stopUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status == kCLAuthorizationStatusDenied) {
        [_manager stopUpdatingLocation];
    }
    
}

#pragma mark--定位接口
//回调方法
+(void)localSuccess:(successLocal)success withError:(errorLocal)error{
    [[self shareInstance]localSuccess:success withError:error];
}
//开始定位
-(void)localSuccess:(successLocal)success withError:(errorLocal)error{
    [_manager startUpdatingLocation];
    self.isLocation = NO;
    self.sLocal =success;
    
}
@end
