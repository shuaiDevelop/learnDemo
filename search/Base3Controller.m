//
//  Base3Controller.m
//  search
//
//  Created by 王帅 on 16/6/23.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base3Controller.h"
#import "WSearchBar.h"
#import "EMSearchDisplayController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface Base3Controller () <UISearchBarDelegate,UISearchDisplayDelegate>

@property(nonatomic,strong)WSearchBar * searchBar;
@property (nonatomic,strong) EMSearchDisplayController * searchController;
@end

@implementation Base3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"search";
    [self.view addSubview:self.searchBar];
//    self.searchBar rac_signalForSelector:<#(SEL)#> fromProtocol:<#(Protocol *)#>
    
}


- (WSearchBar *)searchBar{
//    UIDocumentInteractionController
    if (_searchBar == nil) {
        _searchBar = [[WSearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"输入搜索";
        _searchBar.backgroundColor = [UIColor colorWithRed:0.747 green:0.756 blue:0.751 alpha:1.000];
        [_searchBar setCancelButtonTitle:@"取消"];
        
    }


    return _searchBar;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    NSLog(@"%@",searchText);
    
//    [[[[[[RACObserve(self.searchBar, text) throttle:0.3] distinctUntilChanged] ignore:@""]map:^id(id value) {
//        
//        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            
//            [subscriber sendNext:@"Request --- ricky"];
//            
//            return nil;
//        }];
//        
//    }] switchToLatest]subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];

    

}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    [searchBar setShowsCancelButton:YES animated:YES];

    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
//    [[RealtimeSearchUtil currentUtil] realtimeSearchStop];
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (EMSearchDisplayController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[EMSearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
        _searchController.delegate = self;
        _searchController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _searchController.searchResultsTableView.tableFooterView = [[UIView alloc] init];
        
//        __weak ConversationListController *weakSelf = self;
//        [_searchController setCellForRowAtIndexPathCompletion:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
//        }];
        
//        [_searchController setHeightForRowAtIndexPathCompletion:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
//        }];
        
        [_searchController setDidSelectRowAtIndexPathCompletion:^(UITableView *tableView, NSIndexPath *indexPath) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        }];
    }
    
    return _searchController;
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
