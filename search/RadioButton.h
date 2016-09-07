//
//  RadioButton.h
//  search
//
//  Created by 王帅 on 16/9/7.
//  Copyright © 2016年 shuai. All rights reserved.


#import <UIKit/UIKit.h>
@class RadioButton;
@protocol RadioButtonDelegate <NSObject>

/**
 *  点击事件
 */
- (void)didSelectedRadioButton:(RadioButton *)radioButton groupId:(NSString *)groupId;

@end
@interface RadioButton : UIButton

@property (nonatomic, weak) id<RadioButtonDelegate> delegate;
/**
 *  初始化选中 以最后初始化选中的为准
 */
@property (nonatomic, assign)BOOL isSelect;
- (instancetype)initWithGroupId:(NSString *)groupId;
@end
