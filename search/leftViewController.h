//
//  leftViewController.h
//  search
//
//  Created by 王帅 on 16/7/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^cellDidClicked)(NSIndexPath * selectedIndex,NSString * categoryName);
@interface leftViewController : UITableViewController

@property (nonatomic,copy) cellDidClicked cellClicked;
@end
