//
//  Base2Controller.m
//  search
//
//  Created by 王帅 on 16/6/23.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base2Controller.h"
#import <AFNetworking.h>
#import "HYBNetworking.h"
@interface Base2Controller ()
{
    // 下载句柄
    NSURLSessionDownloadTask *_downloadTask;
}
@end

@implementation Base2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"AFN文件下载/未实现";

    [self downFileFromServer];
}
- (void)down{

    // 1、 设置请求
    //    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    // 2、初始化
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://files.cnblogs.com/zhuqil/UIWebViewDemo.zip"]];
    
    [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //这里要返回一个NSURL，其实就是文件的位置路径
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //使用建议的路径
        path = [path stringByAppendingPathComponent:response.suggestedFilename];
        NSLog(@"%@",path);
        return [NSURL fileURLWithPath:path];//转化为文件路径
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",response);
            
        }else{
            NSLog(@"%@",error.localizedDescription);
            
        }
    }];

}
- (void)down1{

    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //使用建议的路径
    path = [path stringByAppendingPathComponent:@"Demo.zip"];
    // Do any additional setup after loading the view.
    [HYBNetworking downloadWithUrl:@"http://files.cnblogs.com/zhuqil/UIWebViewDemo.zip" saveToPath:path progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        NSLog(@"%f",1.0 * bytesRead/totalBytesRead);
    } success:^(id response) {
        NSLog(@"%@",response);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        
    }];


}
- (void)down2{
    // 1、 设置请求
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://files.cnblogs.com/zhuqil/UIWebViewDemo.zip"]];
    // 2、初始化
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    // 3、开始下载
   [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//        progress(1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount,1.0 * downloadProgress.totalUnitCount,1.0 * downloadProgress.completedUnitCount);
        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //这里要返回一个NSURL，其实就是文件的位置路径
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //使用建议的路径
        path = [path stringByAppendingPathComponent:response.suggestedFilename];
        NSLog(@"%@",path);
        return [NSURL fileURLWithPath:path];//转化为文件路径
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //如果下载的是压缩包的话，可以在这里进行解压
        NSLog(@"----%@---%ld---%@",error.domain,error.code,error);
        //下载成功
        if (error == nil) {
            NSLog(@"下载完成%@",[filePath path]);
        }else{//下载失败的时候，只列举判断了两种错误状态码
            NSString * message = nil;
            if (error.code == - 1005) {
                message = @"网络异常";
            }else if (error.code == -1001){
                message = @"请求超时";
            }else{
                message = @"未知错误";
            }
//            completion(NO,message,nil);
        }
    }];
   


}
- (void)downFileFromServer{
    
    //远程地址
    NSURL *URL = [NSURL URLWithString:@"http://www.baidu.com/img/bdlogo.png"];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    //下载Task操作
    _downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // @property int64_t totalUnitCount;     需要下载文件的总大小
        // @property int64_t completedUnitCount; 当前已经下载的大小
        
        // 给Progress添加监听 KVO
        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        // 回到主队列刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置进度条的百分比
            NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
//            self.progressView.progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
        
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
        
        NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
        UIImage *img = [UIImage imageWithContentsOfFile:imgFilePath];
//        self.imageView.image = img;
        
    }];  
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
