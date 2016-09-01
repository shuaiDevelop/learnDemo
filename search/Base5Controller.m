//
//  Base5Controller.m
//  search
//
//  Created by 王帅 on 16/7/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base5Controller.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIImage+RoundImage.h"

@interface Base5Controller ()<UITextFieldDelegate>

@property(nonatomic,strong) RACSignal * interSignal;
@end

@implementation Base5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
       
    
    self.navigationItem.title = @"RAC";
    [self createRoundImage];
    [self textfield];
    [self buttonSelectedBackgroundColor];
    [self label];
    [self testRAC];
    [self takeUntil];
    
}

- (void)createRoundImage{

    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.backgroundColor = [UIColor whiteColor];
    
    UIImage * image = [UIImage imageNamed:@"luzhishen.jpg"];
    
    [imageView setImage:[image imageWithRoundedCornersAndSize:CGSizeMake(100, 100) andCornerRadius:40.0f]];
    imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:imageView];
    
#warning mark ------------------  直接使用layer.cornerRadius  出现离屏渲染
    UIImageView * imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    imageView1.backgroundColor = [UIColor whiteColor];
    [imageView1 setImage:[UIImage imageNamed:@"luzhishen.jpg"]];
    imageView1.userInteractionEnabled = YES;

    imageView1.layer.cornerRadius = 50.0f;
    imageView1.clipsToBounds = YES;
    [self.view addSubview:imageView1];


}
- (void)textfield{
    
    UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    field.placeholder = @"search";
    field.delegate = self;
    field.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:field];
    
    
    [[[[[[[field rac_textSignal] throttle:0.3] distinctUntilChanged] ignore:@""]map:^id(id value) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@"Request --- ricky"];
            
            return nil;
        }];
        
    }] switchToLatest]subscribeNext:^(id x) {
        
        NSLog(@"x: %@",x);
    }];
    
    
    
}

- (void)buttonSelectedBackgroundColor{

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(30, 150, 100, 40)];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    
    RAC(btn,backgroundColor) = [RACObserve(btn, selected) map:^id(NSNumber * selected) {
        
        return [selected boolValue]?[UIColor yellowColor]:[UIColor redColor];
    }];

    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton * x) {
        x.selected = !x.selected;
        
    }];

}

- (void)label{

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 300, 30)];
    label.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:label];

    RAC(label,text) = [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] map:^id(NSDate * value) {
        return value.description;
    }];

}

- (void)testRAC{
RACSignal * signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [subscriber sendNext:@"signalA"];
        [subscriber sendCompleted];
    });
    
    
    return nil;
}];

    RACSignal * signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"signalB"];
            [subscriber sendCompleted];
        });
        
        
        return nil;
    }];

//    merge: 同时订阅2个信号
    // signalA 延迟2s signalB 延迟5s  相差了三秒 信号是同时发送的
    [[signalA merge:signalB] subscribeNext:^(id x) {
       
        NSLog(@"%@",x);
    }];

//    singalA完成后 才会订阅singalB 有点像串行队列 A失败了 B就不会被订阅
//    singalA延迟2秒,singalB延迟5秒,相差了5秒.说明A发送完,B才发送的.
//    [[signalA concat:signalB] subscribeNext:^(id x) {
//       
//        NSLog(@"%@",x);
//    }];
    
    // 每隔 1s 打印。。。。
    _interSignal =  [RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]];
    
        [_interSignal subscribeNext:^(id x) {
           
            NSLog(@"this -- %@",x);
        }];
   [_interSignal doCompleted:^{
      
       NSLog(@"结束了");
   }];
    
    
}
- (void)takeUntil{

    
    RACSignal * signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"3"];
            [subscriber sendNext:@"4"];
            [subscriber sendCompleted];
        });
        [subscriber sendCompleted];
        
        return nil;
        
    }] takeUntil:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"RAC"];
            [subscriber sendCompleted];
        });
        
        return nil;
    }]];
    
    [signal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    




}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    

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
