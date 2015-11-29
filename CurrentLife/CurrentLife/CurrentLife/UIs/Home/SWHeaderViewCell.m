//
//  SWHeaderViewCell.m
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWHeaderViewCell.h"
//icarousel 框架
#import "iCarousel.h"
#import <UIImageView+WebCache.h>

@interface SWHeaderViewCell()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UILabel *LableText;

@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (nonatomic, strong) NSTimer *timer;

@end
@implementation SWHeaderViewCell

//再 赋值
-(void)setModel:(SWHomeModel *)model
{
    _model= model;
    
    //设置页数
    _page.numberOfPages = _model.focus.list.count;
    [self.carousel reloadData];//重新加载
    
    
    //开始计时器
    [self startTimer];
}


- (void)awakeFromNib{
    //设置初始化数据
    [self setUp];
      //设置type
    self.carousel.type = iCarouselTypeLinear;
    [_carousel reloadData];
    self.carousel.bounceDistance = 0;
    self.carousel.autoscroll = 0;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //设置初始化数据
        [self setUp];
        
        //设置type
        self.carousel.type = iCarouselTypeLinear;
        
        
        
    }
    
    return self;
}

#pragma mark -- 滚动视图
- (void)setUp
{
    //set up data
    //能不能够循环
    self.wrap = YES;
    
}


- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    _carousel.delegate = nil;
    _carousel.dataSource = nil;
    
}

#pragma mark -
#pragma mark View lifecycle




- (BOOL)shouldAutorotateToInterfaceOrientation:(__unused UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}



#pragma mark -
#pragma mark UIActionSheet methods

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0)
    {
        //map button index to carousel type
        iCarouselType type = buttonIndex;
        
        //carousel can smoothly animate between types
        [UIView beginAnimations:nil context:nil];
        self.carousel.type = type;
        [UIView commitAnimations];
        
        
    }
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return (NSInteger)[_model.focus.list count];
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        
        //获取到 实例
        
        SWFocus *focus = _model.focus.list[index];
        
        //设置图片
        view = [[UIImageView alloc] initWithFrame:self.bounds];
        //        ((UIImageView *)view).image = [UIImage imageNamed:@"123.jpg"];
       
// 获取图片
        [((UIImageView *)view) sd_setImageWithURL:[NSURL URLWithString:focus.cover]];
        
        //设置标题
        _LableText.text = focus.title;
        
        //修改page的现实
        _page.currentPage = index;
        
        
        view.contentMode = UIViewContentModeScaleToFill;
        
    }
    else
    {
        //get a reference to the label in the recycled view
        //        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    //    label.text = [_model.focus.list[(NSUInteger)index] stringValue];
    
    //更改背景颜色
    view.backgroundColor = [UIColor redColor];
    
    return view;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        //获取到 实例
        
        SWFocus *focus = _model.focus.list[index];
        
        
        view = [[UIImageView alloc] initWithFrame:self.bounds];
           //展位图
        ((UIImageView *)view).image = [UIImage imageNamed:@"123.jpg"];
        
        [((UIImageView *)view) sd_setImageWithURL:[NSURL URLWithString:focus.cover]];
        
        view.contentMode = UIViewContentModeCenter;
        
        
        //设置标题
        _LableText.text = focus.title;
        
        //修改page的现实
        _page.currentPage = index;
        
        
    }
    else
    {
        //get a reference to the label in the recycled view
        //        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    //    label.text = (index == 0)? @"[": @"]";
    
    //更改背景颜色
    view.backgroundColor = [UIColor redColor];
    
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return self.wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.0f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (_model.focus.list)[(NSUInteger)index];
//    NSLog(@"Tapped view number: %@", item);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
//    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
    
    //
    SWFocus *focus = _model.focus.list[self.carousel.currentItemIndex];
    //设置标题
    _LableText.text = focus.title;
    _LableText.textColor = [UIColor whiteColor];
    
    //修改page的现实
    _page.currentPage = self.carousel.currentItemIndex;
}


- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel{
    
//    SNSLog(@"will");
    if (_model.focus.list.count > 0) {
        [self stopTimer];
    }
    
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    
//    SNSLog(@"end");
    if (_model.focus.list.count > 0) {
        [self startTimer];
    }
    
}



#pragma mark - 时钟方法
- (void)startTimer {
    if (self.timer) {
        return;
    }
    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(autoRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer{
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
    
}

- (void)autoRun{
    
    [self.carousel scrollToItemAtIndex:(self.carousel.currentItemIndex + 1 )%_model.focus.list.count animated:YES];
    
}

@end
