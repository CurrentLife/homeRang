//
//  SWHomeModel.h
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "JSONModel.h"
#import  "SWFocusList.h"
@class SWFamousList;
@class SWGroupList;
@class SWGuessList;
//@class SWFocusList;



@protocol SWFamousModel;
@protocol SWGroupModel;
@protocol SWGuessModel;

#pragma mark --首页
@interface SWHomeModel : JSONModel
@property (nonatomic, strong) SWFamousList *famous;
@property (nonatomic, strong)  SWFocusList *focus;
@property (nonatomic, strong) SWGroupList *group;
@property (nonatomic, strong) SWGuessList  *guess;
@end



#pragma mark --名店推荐

@interface SWFamousList : JSONModel
//<DSFocusModel>指定存放类型
@property (nonatomic, copy) NSArray <SWFamousModel>* list;

@end

@interface SWFamousModel : JSONModel

///* id*/
//@property (nonatomic, assign) int id;
/* 封面字段*/
@property (nonatomic, copy) NSString *cover;
/*距离字段*/
//@property (nonatomic, assign) int distance;
/*简介*/
@property (nonatomic, copy) NSString *intro;
/*名称*/
@property (nonatomic, copy) NSString *name;
/*评分*/
@property (nonatomic, copy) NSString * score;


@end

#pragma mark --生活圈 分类

@interface SWGroupList : JSONModel

@property (nonatomic, copy) NSArray <SWGroupModel>*list;

@end

@interface SWGroupModel : JSONModel

/* 封面*/
@property (nonatomic, copy) NSString *cover;
/*id*/
@property (nonatomic, copy) NSString * id;
/*标题*/
@property (nonatomic, copy) NSString *title;

@end



#pragma mark --猜你喜欢

@interface SWGuessList : JSONModel
@property (nonatomic,copy) NSArray <SWGuessModel>*list;
@end

@interface SWGuessModel :JSONModel
/*封面*/
@property (nonatomic, copy) NSString *cover;
/**/
@property (nonatomic, copy)NSString * orginalprice;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, copy)NSString * name;
/*简介*/
@property (nonatomic, copy) NSString *intro;
/*价格*/
@property (nonatomic, assign) int price;
/*标题*/
@property (nonatomic, copy) NSString *title;

@end

