//
//  UIImage+RoundImage.m
//  search
//
//  Created by 王帅 on 16/7/11.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "UIImage+RoundImage.h"

@implementation UIImage (RoundImage)
- (UIImage *)imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext
    ();
    UIGraphicsEndImageContext();
    return output;
}
@end
