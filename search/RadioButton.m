//
//  RadioButton.m
//  search
//
//  Created by 王帅 on 16/9/7.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "RadioButton.h"

#define RADIO_ICON_WH                     (16.0)
#define ICON_TITLE_MARGIN                 (5.0)


static NSMutableDictionary *_groupRadioDic = nil;

@interface RadioButton ()

@property(nonatomic, copy)NSString *groupId;
//@property(nonatomic, strong)NSMutableDictionary *groupRadioDic;

@end
@implementation RadioButton

- (instancetype)initWithGroupId:(NSString *)groupId
{
    self = [super init];
    if (self) {
        _groupId = groupId;
        self.exclusiveTouch = YES;
        [self addToGroup];
        [self setImage:[UIImage imageNamed:@"radio_unchecked.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"radio_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(radioBtnChecked) forControlEvents:UIControlEventTouchUpInside];

        
    }
    return self;
}
- (void)addToGroup {
    if(!_groupRadioDic){
        _groupRadioDic = [NSMutableDictionary dictionary];
    }
    
    NSMutableArray *_gRadios = [_groupRadioDic objectForKey:_groupId];
    if (!_gRadios) {
        _gRadios = [NSMutableArray array];
    }
    [_gRadios addObject:self];
    [_groupRadioDic setObject:_gRadios forKey:_groupId];
}
- (void)removeFromGroup {
    if (_groupRadioDic) {
        NSMutableArray *_gRadios = [_groupRadioDic objectForKey:_groupId];
        if (_gRadios) {
            [_gRadios removeObject:self];
            if (_gRadios.count == 0) {
                [_groupRadioDic removeObjectForKey:_groupId];
            }
        }
    }
}

- (void)uncheckOtherRadios {
    NSMutableArray *_gRadios = [_groupRadioDic objectForKey:_groupId];
    if (_gRadios.count > 0) {
        for (RadioButton *_radio in _gRadios) {
            if (_radio.isSelect && ![_radio isEqual:self]) {
                _radio.isSelect = NO;
            }
        }
    }
}

- (void)setIsSelect:(BOOL)isSelect {
    if (_isSelect == isSelect) {
        return;
    }
    
    _isSelect = isSelect;
    self.selected = isSelect;
    
    if (self.selected) {
        [self uncheckOtherRadios];
    }
}

- (void)radioBtnChecked {
    if (_isSelect) {
        return;
    }
    
    self.selected = !self.selected;
    _isSelect = self.selected;
    
    if (self.selected) {
        [self uncheckOtherRadios];
    }
    
    if (self.selected && _delegate && [_delegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)]) {
        [_delegate didSelectedRadioButton:self groupId:_groupId];
        
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, (CGRectGetHeight(contentRect) - RADIO_ICON_WH)/2.0, RADIO_ICON_WH, RADIO_ICON_WH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(RADIO_ICON_WH + ICON_TITLE_MARGIN, 0,
                      CGRectGetWidth(contentRect) - RADIO_ICON_WH - ICON_TITLE_MARGIN,
                      CGRectGetHeight(contentRect));
}

@end
