//
//  VIewModel.h
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSubject;
@interface VIewModel : NSObject

@property(strong,nonatomic) RACSubject * successObject;
@property(strong,nonatomic) RACSubject * errorObject;
@property(strong,nonatomic) NSMutableArray * dataSource;

- (void)getData;
@end
