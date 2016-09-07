//
//  Base14ViewModel.h
//  search
//
//  Created by 王帅 on 16/9/6.
//  Copyright © 2016年 shuai. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewModelClass.h"
@class Base14Model;
@interface Base14ViewModel : ViewModelClass
- (void) fetchDataFromSever;
- (void)pushDetail:(Base14Model *)model WithController:(UIViewController *)controller;
@end
