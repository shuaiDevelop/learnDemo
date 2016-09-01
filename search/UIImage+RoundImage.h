//
//  UIImage+RoundImage.h
//  search
//
//  Created by 王帅 on 16/7/11.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundImage)
- (UIImage *)imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius;
@end
