//
//  Base8Controller.m
//  search
//
//  Created by 王帅 on 16/7/11.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base8Controller.h"

@interface Base8Controller ()

@end

@implementation Base8Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"UIStackView";

}
- (IBAction)addImage:(id)sender {
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header1.jpg"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageStackView addArrangedSubview:imageView];
    [UIView animateWithDuration:0.25 animations:^{
       
        [self.imageStackView layoutIfNeeded];
    }];
    
    
    
    
}
- (IBAction)deleteImage:(id)sender {
    
    UIImageView * imageView = [self.imageStackView.arrangedSubviews lastObject];
    if (imageView) {
        [self.imageStackView removeArrangedSubview:imageView];
        [imageView removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            [self.imageStackView layoutIfNeeded];
        }];
    }
    
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
