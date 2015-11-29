//
//  UIImageView+SWSetImage.m
//  CurrentLife
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "UIImageView+SWSetImage.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (SWSetImage)
- (void)ds_setImageWithURL:(NSString *)url{
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder {
     [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:0 progress:nil completed:nil];
}
@end
