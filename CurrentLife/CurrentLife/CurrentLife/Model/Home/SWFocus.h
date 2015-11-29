//
//  SWFocus.h
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface SWFocus : JSONModel
#pragma mark  -- 广告Model
//焦点图标题
@property (nonatomic,strong)NSString *title;
//图片链接
@property (nonatomic,strong)NSString *cover;
//所要跳转的基础连接
@property (nonatomic,strong)NSString *link;
//跳转到指定的模块
@property (nonatomic,strong)NSString *res_name;
//指定模块下的详情ID
@property (nonatomic,strong)NSString *res_id;
//焦点图ID
@property (nonatomic,assign)int id;



@end
