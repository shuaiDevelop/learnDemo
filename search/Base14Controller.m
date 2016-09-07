//
//  Base14Controller.m
//  search
//
//  Created by 王帅 on 16/9/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base14Controller.h"
#import "Base14ViewModel.h"
#import "ArrayDataSource.h"
#import "Base9Cell.h"
@interface Base14Controller ()
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) ArrayDataSource * data;
@end

@implementation Base14Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVVMTest";
    [self initData];
}

- (void)initData{
    Base14ViewModel * viewModel = [[Base14ViewModel alloc] init];
    [viewModel fetchDataFromSever];
    __weak typeof (self) weakSelf = self;
    [viewModel setBlockWithReturnSuccessBlock:^(id successValue) {
        
//        NSLog(@"%@",successValue);
        weakSelf.dataSource = successValue;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf createUI];
            [weakSelf.tableView reloadData];
        });
        
    } ErrorBlock:^(id errorValue) {
        
        NSLog(@"%@",errorValue);
    }];


}
- (void)createUI{
self.data = [[ArrayDataSource alloc] initCellWithDataSource:self.dataSource cellIdentifier:@"CellID" CellBlock:^(id cell, id item) {
    [cell configCellWithModel:item];
    
}];
    self.tableView.dataSource = self.data;
    [self.tableView registerNib:[Base9Cell nib] forCellReuseIdentifier:@"CellID"];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Base14ViewModel * viewModel = [[Base14ViewModel alloc] init];
    [viewModel pushDetail:self.dataSource[indexPath.row] WithController:self];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 79;
}
- (NSMutableArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }

    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
