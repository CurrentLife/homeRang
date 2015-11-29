//
//  constant.h
//  CurrentLife
//
//  Created by mac on 15/11/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

#ifndef constant_h
#define constant_h
#ifdef DEBUG
#define SNSLog(...) NSLog(__VA_ARGS__)
#else
#define SNSLog(...)
#endif

#pragma mark --给定值
#define KUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#define KUIScreenBounds [UIScreen mainScreen].bounds
#define KUInavBarHeight  64
#define kUIStatusBarHeight  20
#define kUITabBarHeight     49
#import "AppDelegate.h"
#import "MD5.h"
#import "SWAFHTTPClient.h"//网络请求

#import "SWFocus.h"
#define kFirstLanuch    @"KSWGuideVCFirstLanuch"
#pragma mark --通知

#define kNotificationGuideEnter @"kNotificationGuideEnter"

#pragma mark --接口调试相关

#define APP_ID          @"1001"
#define APP_IDENTIFER   @"5bV9JhaMn2GJ5MZe"


//#define kBaseURL        @"http://192.168.0.12"
#define kBaseURL        @"http://www.qd-life.com/"
#endif /* constant_h */
