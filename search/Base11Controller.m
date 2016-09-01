//
//  Base11Controller.m
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//78435-12042010
//00002Lo9h8L7t42TtAksgbnr7opqOE
//tkBLpKlt"FY7MD2RJP493zzr3L15Tj
//BuJsNBsE6hEpwjxpkH6tCHwDr0q5SA

#import "Base11Controller.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <CoreGraphics/CoreGraphics.h>
#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

@interface Base11Controller ()
{

    UIView * colorView ;
    CGPoint beginPoint;
    CGFloat maxMoveDistance;
    float distanceAndTimeRatio;
    float animationDuration;
}
@end

@implementation Base11Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationItem.title = @"CABasicAnimation";
    beginPoint = CGPointZero;
    maxMoveDistance = 0.0;
    distanceAndTimeRatio = 0.0;
//    [self initAnimation];
//    [self transForm3D];
//    [self colorView];
//    [self keyAnimation];
    [self otherAnimation];
}
/**
 *   多步动画  (密码输入错误时 输入框晃动)
 */
- (void)keyAnimation{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(110, 10, 100, 40)];
    view.center = CGPointMake(80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [view.layer addAnimation:animation forKey:@"shake"];
   
}
/**
 *  沿路径动画
 */
- (void)otherAnimation{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(160, 60, 100, 40)];
    view.center = CGPointMake(150, 150);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(160, 60, 100, 100)];
    view1.center = CGPointMake(150, 150);
    view1.clipsToBounds = YES;
    view1.layer.cornerRadius=50.0f;
    view1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view1];

       CGRect boundingRect = CGRectMake(-100, -100, 200, 200);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [view.layer addAnimation:orbit forKey:@"orbit"];

}
- (void)initAnimation{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    view.center = CGPointMake(80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
       NSValue * fromValue = [NSValue valueWithCGPoint:self.view.center];
    NSValue * toValue  = [NSValue valueWithCGPoint:CGPointMake(80, 80)];
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];

    animation.duration = 5; // 动画的持续时间
    animation.fromValue = fromValue; // 动画的初始值
    animation.toValue = toValue;     // 动画的结束值
    animation.removedOnCompletion = NO;  // 动画结束时是否自动移除
    animation.fillMode = kCAFillModeBoth; // 填充模式(removedOnCompletion 属性为NO时才生效)
    animation.beginTime = CACurrentMediaTime() + 1; // 动画的开始时间
//    animation.repeatCount = HUGE_VALF;   // 动画的重复次数
    [view.layer addAnimation:animation forKey:@"positionAnimation"];

}
- (void)colorView{
     colorView = [[UIView alloc] initWithFrame:CGRectMake(50, 400, 300, 60)];
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(startAnimation:)];
    [colorView addGestureRecognizer:pan];
    
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.duration = 6;
    animation.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    animation.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    colorView.layer.speed = 0;
    [colorView.layer addAnimation:animation forKey:@"backgroundColorAnimation"];
    
    
    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(10, 200, 80, 30);
//    button.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button];
//    
// RAC(button,backgroundColor) = [RACObserve(button, selected) map:^id(NSNumber * value) {
//     
//     return [value boolValue] ? [UIColor orangeColor]:[UIColor redColor];
//     
// }];
//    
//    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton * x) {
//        x.selected = !x.selected;
//        if (x.selected) {
//            [self pauseLayer:colorView.layer];
//        }else{
//        
//            [self resumeLayer:colorView.layer];
//        }
//        
//    }];
    
    
    
//    [self resumeLayer:colorView.layer];
}

- (void)transForm3D{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    view.center = CGPointMake(80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500;
    view.layer.transform = transform;
   
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation.duration = 3;
    animation.fromValue = 0;
    animation.toValue = [NSValue valueWithCATransform3D:transform];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:animation forKey:@"transformAnimation"];
    

}
- (void)startAnimation:(UIPanGestureRecognizer *)gesture{

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            beginPoint = [gesture locationInView:colorView];
            maxMoveDistance = CGRectGetWidth(colorView.frame) - beginPoint.x;
            distanceAndTimeRatio = 6/maxMoveDistance;
            colorView.layer.timeOffset = 0;
            break;
        case UIGestureRecognizerStateChanged:
        {
        
            CGPoint changePoint = [gesture locationInView:colorView];
            CGFloat currentTimeOff = (changePoint.x - beginPoint.x)*distanceAndTimeRatio;
            if (currentTimeOff >= 0) {
                colorView.layer.timeOffset = currentTimeOff;
            }
            
        
            break;
        }
            case UIGestureRecognizerStateEnded:
            
            case UIGestureRecognizerStateCancelled:
        {
        }
        default:
            break;
    }

}
- (void)pauseLayer:(CALayer *)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;


}
- (void)resumeLayer:(CALayer *)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;


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
