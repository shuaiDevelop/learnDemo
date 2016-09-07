//
//  CheckBox.m
//  search
//
//  Created by 王帅 on 16/9/7.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "CheckBox.h"

#define CHECK_ICON_WH                    (15.0)
#define ICON_TITLE_MARGIN                (5.0)


@implementation CheckBox

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.exclusiveTouch = YES; // 响应整个Touch事件
        [self setImage:[UIImage imageNamed:@"checkbox1_unchecked.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"checkbox1_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(checkboxBtnChecked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setIsSelect:(BOOL)isSelect{
    if (_isSelect == isSelect) {
        return;
    }
    _isSelect = isSelect;
    self.selected = isSelect;

}
- (void)checkboxBtnChecked{
    self.selected = !self.selected;
    _isSelect = self.selected;
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedCheckBox:isSelect:)]) {
        [_delegate didSelectedCheckBox:self isSelect:self.selected];
    }


}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, (CGRectGetHeight(contentRect) - CHECK_ICON_WH)/2.0, CHECK_ICON_WH, CHECK_ICON_WH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(CHECK_ICON_WH + ICON_TITLE_MARGIN, 0,
                      CGRectGetWidth(contentRect) - CHECK_ICON_WH - ICON_TITLE_MARGIN,
                      CGRectGetHeight(contentRect));
}
@end
