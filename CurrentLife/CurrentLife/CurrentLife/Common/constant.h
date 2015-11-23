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

#define kFirstLanuch    @"KSWGuideVCFirstLanuch"
#pragma mark --通知

#define kNotificationGuideEnter @"kNotificationGuideEnter"   
#endif /* constant_h */
