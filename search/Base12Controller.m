//
//  Base12Controller.m
//  search
//
//  Created by 王帅 on 16/8/3.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base12Controller.h"
#import "NHKeyboard.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface Base12Controller ()
{
    UITextField * _text;
}

@end

@implementation Base12Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"自定义键盘";
    _text = ({
        UITextField *view = [UITextField new];
        view.frame = CGRectMake(100, 100, 130, 40);
        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.mas_equalTo(self.view);
//            make.top.mas_equalTo(100);
//            make.size.mas_equalTo(CGSizeMake(200, 50));
//        }];
        view.layer.borderWidth = 1.0f;
        view.borderStyle = UITextBorderStyleBezel;
        
        view;
    });
    NHKeyboard *kb = [NHKeyboard keyboardWithType:NHKBTypeASCIICapable];
    _text.inputView = kb;
    kb.inputSource = _text;
    
    //    [[_text rac_textSignal]subscribeNext:^(id x) {
    //        NSLog(@"%@🚗",x);
    ////        LxDBAnyVar(x);
    //        LxDBAnyVar([x class]);
    //    }];
    
    [[[[_text.rac_textSignal throttle:0.3]distinctUntilChanged]ignore:@""]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
  

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
