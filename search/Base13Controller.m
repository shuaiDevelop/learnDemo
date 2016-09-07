//
//  Base13Controller.m
//  search
//
//  Created by 王帅 on 16/8/3.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base13Controller.h"
//#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>
#import "Person.h"
#import "Person+category.h"
#import "NSObject+JSONCategory.h"
@interface Base13Controller ()

@end

@implementation Base13Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runtime";
   
    [self setDicModel];
}
- (void)setDicModel{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];

    Person * person = [Person objectWithDictionary:dic];
    
}



- (void)exchangeMethod{


    NSLog(@"--------------------交换前");
    [Person run];
    [Person study];
    
    Method  m1 = class_getClassMethod([Person class], @selector(run));
    Method  m2 = class_getClassMethod([Person class], @selector(study));
    method_exchangeImplementations(m1, m2);
    NSLog(@"交换后--------------------");
    
    [Person run];
    [Person study];




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
