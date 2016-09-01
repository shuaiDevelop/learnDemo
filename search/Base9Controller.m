//
//  Base9Controller.m
//  search
//
//  Created by 王帅 on 16/7/15.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base9Controller.h"
#import "VIewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ArrayDataSource.h"
#import "Base9Cell.h"
#import "TestModel.h"
#import <ReactiveCocoa/RACEXTScope.h>
static NSString * const cellID = @"hahahhah";
@interface Base9Controller ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) ArrayDataSource * data;
@end

@implementation Base9Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"轻量级VC";
    _dataSource = [NSMutableArray array];
    [self initViewModel];
}
- (void)initViewModel{

    VIewModel * viewModel = [[VIewModel alloc] init];
    [viewModel getData];
   @weakify(self);
    [viewModel.successObject subscribeNext:^(NSMutableArray * dataSource) {
        @strongify(self);
        _dataSource = [NSMutableArray arrayWithArray:dataSource];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self createUI];

            [self.tableView reloadData];
        });
       

    }];
    [viewModel.errorObject subscribeNext:^(NSError * error) {
       
        NSLog(@"%@",error.localizedDescription);
    }];

}
- (void)createUI{

    self.data = [[ArrayDataSource alloc] initCellWithDataSource:_dataSource cellIdentifier:cellID CellBlock:^(id cell, id item) {
        [cell configCellWithModel:item];
    }];
    self.tableView.dataSource = self.data;
    [self.tableView registerNib:[Base9Cell nib] forCellReuseIdentifier:cellID];

}
//- (NSInteger)createUI{
////
//
//    NSString * string = @"asj kdka b sdfghr sbcd";
//    NSString * subStr = @"abcjdado";
//    
//    NSInteger i = 0;
//    NSInteger j = 0;
//    
//    while (i < string.length && j < subStr.length) {
//        
//        if ([string characterAtIndex:i] == [subStr characterAtIndex:j]) {
//            /**
//             *  匹配成功
//             */
//            i++;
//            j++;
//        }else{
//        
//            j = j - i + 1;
//            i = 0;
//        
//        }
//    }
//    if (j == subStr.length) {
//        return j - i;
//    }
//    else{
//    
//        return -1;
//    }
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{




}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 79;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
