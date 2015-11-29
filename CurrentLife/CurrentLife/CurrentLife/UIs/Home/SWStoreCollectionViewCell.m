
//
//  SWStoreCollectionViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWStoreCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface  SWStoreCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *straImage;
@property (weak, nonatomic) IBOutlet UILabel *describeLable;
@property (weak, nonatomic) IBOutlet UILabel *locationLable;

@end
@implementation SWStoreCollectionViewCell

//重写SWFamousModel 模型的set 放法
-(void)setModel:(SWFamousModel *)model{
    _model = model;
    _titleLable.font =[UIFont systemFontOfSize:14.0];
    [_titleLable sizeToFit];
    _titleLable.lineBreakMode =  NSLineBreakByWordWrapping;
    _titleLable.text = _model.name;
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.cover]];
    _describeLable.font = [UIFont systemFontOfSize:15.0];
//    [_describeLable sizeToFit];
      _describeLable.numberOfLines = 0;
//    _titleLable.lineBreakMode =  NSLineBreakByWordWrapping;
    //动态 计算高度
  
    _describeLable.text = _model.intro;

    int score = [_model.score intValue];//string 转int
    
    NSString * straimage =  [NSString stringWithFormat:@"star_%d",score];
    _straImage.image = [UIImage imageNamed:straimage];
    
    
    
    
    //distance 处理
//    if(_model.distance < 1000){
//        _disLabel.text = [NSString stringWithFormat:@"%d米",_model.distance];
//    }else if (_model.distance > 1000){
//        _disLabel.text = [NSString stringWithFormat:@"%2.f千米",_model.distance / 1000.0];
//    }
    
}
- (void)awakeFromNib {
    // Initialization code
    _locationLable.textColor = [UIColor orangeColor];
    
}

@end
