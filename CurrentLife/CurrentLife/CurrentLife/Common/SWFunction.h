//
//  SWFunction.h
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWFunction : NSObject
//
+(void)saveValue:(BOOL)value forKey:(NSString*)key;
//设置时间戳
+(NSString*)getTime;

+(NSString *)md5Str:(NSArray*)array;
@end
