//
//  SWGuessTableViewCell.h
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWHomeModel.h"
@interface SWGuessTableViewCell : UITableViewCell

//@property(nonatomic,strong) SWGuessModel * list;

@property(nonatomic,strong) SWGuessModel * model;


//自定义 动态计算 cell 高度方法
-(CGFloat)resultWithLableHeight;

@end
