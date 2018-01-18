//
//  GoogleVRViewTest.m
//  testDemo
//
//  Created by XYCoder on 2017/4/24.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "GoogleVRViewTest.h"
#import <GVRVideoView.h>
@interface GoogleVRViewTest ()<GVRWidgetViewDelegate>
@property (nonatomic,assign)BOOL isPlay;
@end

@implementation GoogleVRViewTest

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isPlay = false;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    GVRPanoramaView *vrView = [[GVRPanoramaView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, 200)];
    vrView.delegate = self;
    [vrView loadImage:[UIImage imageNamed:@"002.jpg"]];
    vrView.enableInfoButton = false;
    vrView.enableCardboardButton = false;
    vrView.enableFullscreenButton = false;
    vrView.enableTouchTracking = false;
    [self.view addSubview:vrView];
    
    
    GVRVideoView *videoView = [[GVRVideoView alloc]initWithFrame:CGRectMake(0, 270, SCREENSIZE.width, 200)];
    videoView.delegate = self;
    [videoView loadFromUrl:[NSURL URLWithString:@"http://oe7fx58st.bkt.clouddn.com/University/kaowenchui/kwc_CH_4K.mp4"] ofType:kGVRVideoTypeMono];
    videoView.enableInfoButton = false;
    videoView.tag = 100;
    videoView.enableCardboardButton = true;
    videoView.enableFullscreenButton = true;
    videoView.enableTouchTracking = true;
    [self.view addSubview:videoView];
}

- (void)widgetViewDidTap:(GVRWidgetView *)widgetView{
    GVRVideoView *video = (GVRVideoView *)[self.view viewWithTag:100];
    if (self.isPlay) {
        [video pause];
//        [video stop];
    }else{
        
        [video play];
    }
    self.isPlay = !self.isPlay;
}

- (void)widgetView:(GVRWidgetView *)widgetView
didChangeDisplayMode:(GVRWidgetDisplayMode)displayMode{
    LxDBAnyVar(@"改变了显示模式");
    if (displayMode == kGVRWidgetDisplayModeFullscreenVR) {
        widgetView.displayMode = kGVRWidgetDisplayModeFullscreenVR;
    }
    
}

- (void)widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content{
    LxDBAnyVar(@"完成内容加载");
}

- (void)widgetView:(GVRWidgetView *)widgetView
didFailToLoadContent:(id)content
  withErrorMessage:(NSString *)errorMessage{
    LxDBAnyVar(@"内容加载失败");
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
