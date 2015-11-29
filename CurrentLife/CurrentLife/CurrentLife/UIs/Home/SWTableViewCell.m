//
//  SWTableViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWTableViewCell.h"
#import "SWCollectionViewCell.h"

@interface SWTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collentionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;

@end


static NSString * reuserIdnetifer = @"SWCollectionViewCell";
@implementation SWTableViewCell

- (void)awakeFromNib {
   
    //注册cell（xib添加方式）
    [_collentionView  registerNib:[UINib nibWithNibName:reuserIdnetifer bundle:nil]forCellWithReuseIdentifier:reuserIdnetifer];
   
    _collentionView.backgroundColor = [UIColor whiteColor];
    _collentionView.showsHorizontalScrollIndicator = NO;
    
    _collentionView.showsVerticalScrollIndicator = NO;
    _collentionView.scrollEnabled = NO;
    
    
}
//设置frame时调用
-(void)layoutSubviews{
    
    _flowlayout.itemSize = CGSizeMake(self.frame.size.width/4, self.frame.size.height/2);
    _flowlayout.minimumInteritemSpacing = 0;
    _flowlayout.minimumLineSpacing  = 0;
    _flowlayout.sectionInset = UIEdgeInsetsZero;//设定全局的区内边距
    
}

//重写模型 set方法,获取数据

-(void)setList:(SWGroupList *)list{
    
    _list = list;
    //刷新全部数据
    [_collentionView  reloadData];
}
//
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _list.list.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWCollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:reuserIdnetifer forIndexPath:indexPath];
    
    cell.model = _list.list[indexPath.row];
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.row);
    
//    [_delegate didItemSelected:indexPath.row];
    
}
@end
