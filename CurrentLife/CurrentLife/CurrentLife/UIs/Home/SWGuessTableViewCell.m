//
//  SWGuessTableViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWGuessTableViewCell.h"
#import <UIImageView+WebCache.h>
@interface SWGuessTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *guessImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *startusImage;
@property (weak, nonatomic) IBOutlet UILabel *describeLable;
@property (weak, nonatomic) IBOutlet UILabel *locationLable;

//@property (weak, nonatomic) IBOutlet UIImageView *locatioImage;

@end

@implementation SWGuessTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _locationLable.textColor = [UIColor orangeColor];
}
//重写 SWGuessModel 的 set方法
-(void)setModel:(SWGuessModel *)model{
    _model = model;
    [_guessImage sd_setImageWithURL:[NSURL URLWithString:_model.cover]];
    
    _titleLable.text = _model.title;
    int score = [_model.score intValue];
    NSString * scoreImage = [NSString stringWithFormat:@"star_%d",score];
    _startusImage.image =[UIImage imageNamed:scoreImage];
    
    [_describeLable sizeToFit];
    _describeLable.numberOfLines = 0;
    _describeLable.text =_model.intro;
    
    
    
}
////动态计算方法
//-(CGFloat)resultWithLableHeight
//{
//    CGRect rect = [_describeLable.text boundingRectWithSize:CGSizeMake(_describeLable.frame.size.width, _describeLable.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil];
//    
//// SNSLog(@"%@",NSStringFromCGRect(rect));
//    return rect.size.height + 100;
//    
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
