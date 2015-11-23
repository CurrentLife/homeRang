//
//  SWFactory.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWFactory.h"

@implementation SWFactory
+(UIButton *)type:(int)type
        withFrame:(CGRect)frame
        withtitle:(NSString *)text
        withTarget:(id)target
       withAction:(SEL)action{
    
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
