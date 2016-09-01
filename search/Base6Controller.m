//
//  Base6Controller.m
//  search
//
//  Created by 王帅 on 16/7/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base6Controller.h"
#import "leftViewController.h"
#import "RightViewController.h"
@interface Base6Controller ()

@end

@implementation Base6Controller

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationItem.title = @"ChildController";
    
    leftViewController * leftVC = [[leftViewController alloc] init];
    RightViewController * rightVC = [[RightViewController alloc] init];
    [self addChildViewController:leftVC];
    [self addChildViewController:rightVC];
    
    leftVC.view.frame = CGRectMake(0, 0, 100, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:leftVC.view];
    rightVC.view.frame = CGRectMake(100, 0, [UIScreen mainScreen].bounds.size.width- 100, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:rightVC.view];
   
    __weak RightViewController * right = rightVC;
    leftVC.cellClicked = ^(NSIndexPath *selectIndex, NSString * categoryName ){
    
        right.cellText = categoryName;
        [right.tableView reloadData];
    
    };
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
