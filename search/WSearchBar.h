//
//  WSearchBar.h
//  search
//
//  Created by 王帅 on 16/6/24.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSearchBar : UISearchBar
/**
 *  自定义控件自带的取消按钮的文字（默认为“取消”/“Cancel”）
 *
 *  @param title 自定义文字
 */
- (void)setCancelButtonTitle:(NSString *)title;

@end
