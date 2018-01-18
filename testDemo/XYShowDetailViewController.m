//
//  XYShowDetailViewController.m
//  testDemo
//
//  Created by XYCoder on 2017/4/28.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYShowDetailViewController.h"
#import "XYShowOnlineVC.h"
@interface XYShowDetailViewController ()
@property (nonatomic,strong)IJKFFMoviePlayerController *player;
@end

@implementation XYShowDetailViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:self.model.stream_addr];
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
//    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://pili-media.1ying.com.cn/recordings/z1.dayingzhibo.daying649/1494817278_1494817385.m3u8"] withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    
    // 强引用，反正被销毁
    _player = playerVc;
    
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    playerVc.view.userInteractionEnabled = true;
    
    [self.view insertSubview:playerVc.view atIndex:1];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.frame = CGRectMake(SCREENSIZE.width -50, SCREENSIZE.height - 80, 50, 30);
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
}

-(void)back{
//    XYShowOnlineVC *show = [XYShowOnlineVC new];
//    [self.navigationController popToViewController:show animated:true];
    [self.navigationController popViewControllerAnimated:true];
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
