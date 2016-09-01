//
//  ArrayDataSource.m
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,copy) NSString * identifier;

@end
@implementation ArrayDataSource

- (instancetype)initCellWithDataSource:(NSMutableArray *)dataSource
                        cellIdentifier:(NSString *)identifier
                             CellBlock:(TableViewCellReturnBlock)CellBlock
{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.identifier = identifier;
        self.block = [CellBlock copy];
    }
    return self;
}

/**
 *  对应cell 数据源中的Model
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath{

    return self.dataSource[indexPath.row];
}

#pragma mark ---- TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id model = [self itemAtIndexPath:indexPath];
    self.block(cell,model);
    
    return cell;

}

@end
