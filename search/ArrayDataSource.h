//
//  ArrayDataSource.h
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellReturnBlock)(id cell, id item);
@interface ArrayDataSource : NSObject <UITableViewDataSource>

@property (nonatomic,copy)TableViewCellReturnBlock  block;


- (instancetype)initCellWithDataSource:(NSMutableArray *)dataSource
                        cellIdentifier:(NSString *)identifier
                             CellBlock:(TableViewCellReturnBlock)CellBlock;



- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@end
