//
//  SWLocationManger.h
//  CurrentLife
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 itcast. All rights reserved.


/*
   单例 定位
 */

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
typedef void(^successLocal)(CLLocationCoordinate2D coordinate2D);
typedef void(^errorLocal) (NSError *error);
@interface SWLocationManger : NSObject
//创建单例
+ (id)shareInstance;

+ (void)localSuccess:(successLocal)success
           withError:(errorLocal)error;
@end
