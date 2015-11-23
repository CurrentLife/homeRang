//
//  SWFactory.h
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SWFactory : NSObject
+(UIButton*)type:(int)type
       withFrame:(CGRect)frame
       withtitle:(NSString*)text
      withTarget:(id)target
      withAction:(SEL)action;
@end
