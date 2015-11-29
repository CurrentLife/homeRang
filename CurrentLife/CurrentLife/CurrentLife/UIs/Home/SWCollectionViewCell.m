//
//  SWCollectionViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWCollectionViewCell.h"
#import  <UIImageView+WebCache.h>
@interface SWCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end

@implementation SWCollectionViewCell

-(void)setModel:(SWGroupModel *)model{
    _model = model;
    
    _titleLable.text =_model.title;
    
    [_imageView  sd_setImageWithURL:[NSURL URLWithString:_model.cover]];
}
@end
