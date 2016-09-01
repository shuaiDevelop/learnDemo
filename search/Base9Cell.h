//
//  Base9Cell.h
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestModel;
@interface Base9Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *baseImage;
@property (weak, nonatomic) IBOutlet UILabel *baseName;
@property (weak, nonatomic) IBOutlet UILabel *baseAddress;
+(UINib *)nib;
- (void)configCellWithModel:(TestModel *)model;
@end
