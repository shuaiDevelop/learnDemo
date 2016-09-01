//
//  Base4Controller.m
//  search
//
//  Created by 王帅 on 16/7/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base4Controller.h"
#import <WebKit/WebKit.h>
@interface Base4Controller () <WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong) WKWebView * webView;

@end

@implementation Base4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"WKWebView";
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];

}
- (WKWebView *)webView{

    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
    }


    return _webView;
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(void (^)())completionHandler{



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
