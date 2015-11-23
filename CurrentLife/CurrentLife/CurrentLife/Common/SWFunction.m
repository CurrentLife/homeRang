//
//  SWFunction.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWFunction.h"

@implementation SWFunction
+(void)saveValue:(BOOL)value forKey:(NSString *)key{
    
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
