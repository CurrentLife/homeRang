//
//  SWFocusList.h
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol SWFocus
@end
@interface SWFocusList :JSONModel
@property (nonatomic,strong)NSArray<SWFocus >*list;

@end
