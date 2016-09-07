//
//  CheckBox.h
//  search
//
//  Created by 王帅 on 16/9/7.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CheckBox;
@protocol CheckBoxDelegate <NSObject>

@optional
/**
 *  点击事件
 */
- (void)didSelectedCheckBox:(CheckBox *)checkBox isSelect:(BOOL)select;

@end
@interface CheckBox : UIButton

/**
 *  初始化时是否选中
 */
@property (nonatomic, assign) BOOL isSelect;

@property (nonatomic, weak) id<CheckBoxDelegate> delegate;
@end
