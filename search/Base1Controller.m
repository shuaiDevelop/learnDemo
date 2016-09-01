//
//  Base1Controller.m
//  search
//
//  Created by 王帅 on 16/6/23.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base1Controller.h"
#import "BezierDemoView.h"
@interface Base1Controller ()

@end

@implementation Base1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"贝塞尔曲线";
    [self setUpView];
}
- (void)setUpView{

//    UIBezierPath * kPath = [[UIBezierPath alloc] init];
//    [kPath moveToPoint:CGPointMake(0, 50)];
//    [kPath addLineToPoint:CGPointMake(200.0, 40.0)];
//    [kPath addLineToPoint:CGPointMake(160, 140)];
//    [kPath addLineToPoint:CGPointMake(40.0, 140)];
//    [kPath addLineToPoint:CGPointMake(0.0, 40.0)];
//    [kPath closePath];
//    [kPath moveToPoint:CGPointMake(175, 100)];
//    [kPath addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    BezierDemoView * view = [[BezierDemoView alloc] initWithFrame:CGRectMake(0, 0, 500, 700)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

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
