//
//  Base9Cell.m
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base9Cell.h"
#import "TestModel.h"
#import <UIImageView+AFNetworking.h>

@implementation Base9Cell

- (void)awakeFromNib {
    // Initialization code
}
+(UINib *)nib{


    return [UINib nibWithNibName:@"Base9Cell" bundle:nil];
}
- (void)configCellWithModel:(TestModel *)model{
    
    [self.baseImage setImageWithURL:[NSURL URLWithString:model.baseImg]];
    self.baseName.text = model.baseName;
    self.baseAddress.text = model.baseAddress;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
