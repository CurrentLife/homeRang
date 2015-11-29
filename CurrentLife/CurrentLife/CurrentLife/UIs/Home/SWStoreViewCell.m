//
//  SWStoreViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWStoreViewCell.h"
#import  "SWCollectionViewCell.h"

@interface SWStoreViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collentionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayoutStore;

@end

static  NSString * identifier = @"SWStoreCollectionViewCell";
@implementation SWStoreViewCell


//重写模型的set 方法
-(void)setList:(SWFamousList *)list{
    _list = list;
        if (_list.list <= 0) {
            return;
        }
    [_collentionView reloadData];
}
- (void)awakeFromNib {
    // Initialization code
    //注册 SWStoreCollectionViewCell
    [_collentionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
    
    //设置_collentionView的 属性
    _collentionView.backgroundColor  = [UIColor whiteColor];
    _collentionView.showsHorizontalScrollIndicator = NO;
    _collentionView.showsHorizontalScrollIndicator = NO;
    _collentionView.scrollEnabled = NO;
    
//    _collentionView.backgroundColor = [UIColor redColor];
    
}
//设置 _collentionView 的Flowlayout
-(void)layoutSubviews{
    [super layoutSubviews];
      //KUIScreenWidth /2.0
    _flowlayoutStore.itemSize = CGSizeMake(self.frame.size.width/2.0, self.frame.size.height/2.0);

    _flowlayoutStore.minimumInteritemSpacing = 0;
    _flowlayoutStore.minimumLineSpacing = 0;
    _flowlayoutStore.sectionInset = UIEdgeInsetsZero;
    
}



//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    SNSLog(@"%ld",_list.list.count);
    
    return _list.list.count;
 
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SWCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = _list.list[indexPath.row];
    return cell;
    
    
}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
   SNSLog(@"%ld",indexPath.row);
    
    
}
@end
