//
//  UIImageView+SWSetImage.h
//  CurrentLife
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SWSetImage)
- (void)ds_setImageWithURL:(NSString *)url;

- (void)sd_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder ;
@end
