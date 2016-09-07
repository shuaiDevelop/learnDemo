//
//  Base15Controller.m
//  search
//
//  Created by 王帅 on 16/9/7.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base15Controller.h"
#import "CheckBox.h"
#import "RadioButton.h"
@interface Base15Controller ()<CheckBoxDelegate,RadioButtonDelegate>

@end

@implementation Base15Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createCheckBox];
    [self createRadioButton];
}
- (void)createCheckBox{

    CheckBox * check1 = [CheckBox new];
    check1.frame = CGRectMake(20, 20, 60, 30);
    check1.delegate = self;
    [check1 setTitle:@"多选1" forState:UIControlStateNormal];
    [check1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check1.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    check1.isSelect = YES;
    [self.view addSubview:check1];

    CheckBox * check2 = [CheckBox new];
    check2.frame = CGRectMake(20, 60, 60, 30);
    [check2 setTitle:@"多选2" forState:UIControlStateNormal];
    [check2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    check2.delegate = self;
    check2.isSelect = YES;
    [self.view addSubview:check2];

    CheckBox * check3 = [CheckBox new];
    check3.frame = CGRectMake(20, 100, 60, 30);
    [check3 setTitle:@"多选3" forState:UIControlStateNormal];
    [check3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    check3.delegate = self;
    [self.view addSubview:check3];

}
- (void)createRadioButton{

    RadioButton * radio1 = [[RadioButton alloc] initWithGroupId:@"groupId"];
    radio1.frame = CGRectMake(20,150, 80, 40);
    [radio1 setTitle:@"单选1" forState:UIControlStateNormal];
    [radio1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [radio1.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    radio1.isSelect = YES;
    radio1.delegate = self;
    [self.view addSubview:radio1];
    
    RadioButton * radio2 = [[RadioButton alloc] initWithGroupId:@"groupId"];
    radio2.frame = CGRectMake(20, 200, 80, 40);
    [radio2 setTitle:@"单选2" forState:UIControlStateNormal];
    [radio2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [radio2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    radio2.delegate = self;
    [self.view addSubview:radio2];

    
    RadioButton * radio3 = [[RadioButton alloc] initWithGroupId:@"groupId"];
    radio3.frame = CGRectMake(20, 250, 80, 40);
    [radio3 setTitle:@"单选3" forState:UIControlStateNormal];
    [radio3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [radio3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    radio3.delegate = self;
    [self.view addSubview:radio3];


}
- (void)didSelectedCheckBox:(CheckBox *)checkBox isSelect:(BOOL)select{

    NSLog(@"%@ %@",checkBox.currentTitle,select?@"YES":@"NO");

}
- (void)didSelectedRadioButton:(RadioButton *)radioButton groupId:(NSString *)groupId{


    NSLog(@"%@  %@",radioButton.currentTitle,groupId);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{

    NSLog(@"释放");
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
