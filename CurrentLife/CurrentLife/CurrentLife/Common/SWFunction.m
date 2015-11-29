//
//  SWFunction.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.

/*
 //    nil
 //    NULL
 //    NSNull
 //    Nil
 */

#import "SWFunction.h"

@implementation SWFunction
+(void)saveValue:(BOOL)value forKey:(NSString *)key{
    
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(NSString*)getTime{
    return  [NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];
}


//MD5加密
+(NSString *)md5Str:(NSArray *)array{
    NSMutableString * signStr = [[NSMutableString alloc]init];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [signStr appendString:obj];
    }];
    return [MD5 MD5Encrypt:signStr];

}
@end
