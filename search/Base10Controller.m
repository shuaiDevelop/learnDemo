//
//  Base10Controller.m
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base10Controller.h"
#import "RecordHUD.h"

@interface Base10Controller ()
@property (strong, nonatomic)  D3RecordButton *btn;
@property (strong, nonatomic)  D3RecordButton *centerBtn;
@property (nonatomic,strong)D3RecordButton *btnqqqq;

@end

@implementation Base10Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _btn = [D3RecordButton buttonWithType:UIButtonTypeCustom];
    [_btn setBackgroundColor:[UIColor orangeColor]];
    [_btn setTitle:@"开始录音" forState:UIControlStateNormal];
    _btn.frame = CGRectMake(30, 500, 300, 30);
    [self.view addSubview:_btn];
    
    _centerBtn = [D3RecordButton buttonWithType:UIButtonTypeCustom];
    [_centerBtn setBackgroundColor:[UIColor orangeColor]];
    [_centerBtn setTitle:@"录音" forState:UIControlStateNormal];
    _centerBtn.frame = CGRectMake(30, 100, 100, 100);
    [self.view addSubview:_centerBtn];
    [_btn initRecord:self maxtime:10 title:@"上滑取消录音"];
    [_centerBtn initRecord:self maxtime:5];
}
-(void)endRecord:(NSData *)voiceData{
    NSError *error;
    play = [[AVAudioPlayer alloc]initWithData:voiceData error:&error];
    NSLog(@"%@",error);
    play.volume = 1.0f;
    [play play];
    NSLog(@"yesssssssssss..........%f",play.duration);
    [_btn setTitle:@"按住录音" forState:UIControlStateNormal];
}

//不改btn的话这些就不要了
-(void)dragExit{
    [_btn setTitle:@"按住录音" forState:UIControlStateNormal];
}


-(void)dragEnter{
    [_btn setTitle:@"松开发送" forState:UIControlStateNormal];
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
