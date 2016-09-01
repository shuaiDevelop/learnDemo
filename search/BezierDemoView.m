//
//  BezierDemoView.m
//  search
//
//  Created by 王帅 on 16/6/23.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "BezierDemoView.h"
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation BezierDemoView


- (void)drawRect:(CGRect)rect {
    
    UIColor *color = [UIColor redColor];
    [color set];  //设置线条颜色
    
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
//                                                         radius:75
//                                                     startAngle:0
//                                                       endAngle:DEGREES_TO_RADIANS(135)
//                                                      clockwise:YES];
//    
//    aPath.lineWidth = 5.0;
//    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
//    
//    [aPath stroke];
    
     // ########内切圆
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 50, 50)];
//     [path fill];
//    [path stroke];

    // ############ 普通连直线使用
//    UIBezierPath * path = [UIBezierPath bezierPath];
//    path.lineWidth = 1.0f;
//    path.lineCapStyle = kCGLineCapRound;  // 线条拐角
//    path.lineJoinStyle = kCGLineCapRound; // 终点处理
//
//    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(200.0, 40.0)];
//    [path addLineToPoint:CGPointMake(160, 140)];
//    [path addLineToPoint:CGPointMake(40.0, 140)];
//    [path addLineToPoint:CGPointMake(0.0, 40.0)];
//    [path closePath]; //第五条线通过调用closePath方法得到的
//    
//    [path fill]; //Draws line 根据坐标点连线
    
    /**
     *  多种曲线
     */

    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 1.0f;
    path.lineCapStyle = kCGLineCapRound;  // 线条拐角
    path.lineJoinStyle = kCGLineCapRound; // 终点处理
    [path moveToPoint:CGPointMake(30, 100)];
    /**
     *  二次曲线
     */
//    [path addQuadCurveToPoint:CGPointMake(130, 100) controlPoint:CGPointMake(60, 10)];
    /**
     *  三次曲线
     */
    [path addCurveToPoint:CGPointMake(130, 100) controlPoint1:CGPointMake(60, 10) controlPoint2:CGPointMake(60, 200)];
    [path stroke];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
