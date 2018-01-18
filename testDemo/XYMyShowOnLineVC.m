//
//  XYMyShowOnLineVC.m
//  testDemo
//
//  Created by XYCoder on 2017/5/2.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYMyShowOnLineVC.h"
//#import <GPUImage.h>
//#import "GPUImageBeautifyFilter.h"

@interface XYMyShowOnLineVC ()<LFLiveSessionDelegate>
//@property (nonatomic,strong)GPUImageVideoCamera *videoCamera;
//@property (nonatomic,strong)GPUImageView *captureVideoPreview;
//@property (nonatomic,strong)GPUImageBilateralFilter *bilateralFilter;//磨皮滤镜
//@property (nonatomic,strong)GPUImageBrightnessFilter *brightnessFilter;//美白滤镜
@property (nonatomic,strong)LFLiveSession *session;
@property (nonatomic,strong)UIView *livingPreView;
@end

@implementation XYMyShowOnLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建视频源
    // SessionPreset:屏幕分辨率，AVCaptureSessionPresetHigh会自适应高分辨率
    // cameraPosition:摄像头方向
//    GPUImageVideoCamera *videoCamera = [[GPUImageVideoCamera alloc]initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
////    [videoCamera rotateCamera];
//    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
//    self.videoCamera = videoCamera;
//    
//    // 创建最终预览View
//    GPUImageView *captureVideoPreview = [[GPUImageView alloc]initWithFrame:self.view.bounds];
//    self.captureVideoPreview = captureVideoPreview;
//    [self.view insertSubview:captureVideoPreview atIndex:0];
//    
//    // 创建滤镜：磨皮，美白，组合滤镜
//    GPUImageFilterGroup *groupFilter = [[GPUImageFilterGroup alloc] init];
//    
//    // 磨皮滤镜
//    GPUImageBilateralFilter *bilateralFilter = [[GPUImageBilateralFilter alloc] init];
//    [groupFilter addTarget:bilateralFilter];
////    [bilateralFilter setDistanceNormalizationFactor:10 -self.mopiSlider.value];
//    _bilateralFilter = bilateralFilter;
//    
//    // 美白滤镜
//    GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
//    [groupFilter addTarget:brightnessFilter];
//    _brightnessFilter = brightnessFilter;
//    [brightnessFilter setBrightness:self.meibaiSlider.value];
//    
//    // 设置滤镜组链
//    [bilateralFilter addTarget:brightnessFilter];
//    [groupFilter setInitialFilters:@[bilateralFilter]];
//    groupFilter.terminalFilter = brightnessFilter;
//    
//    // 设置GPUImage响应链，从数据源 => 滤镜 => 最终界面效果
//    [videoCamera addTarget:groupFilter];
//    [groupFilter addTarget:captureVideoPreview];
//    
//    // 必须调用startCameraCapture，底层才会把采集到的视频源，渲染到GPUImageView中，就能显示了。
//    // 开始采集视频
//    [videoCamera startCameraCapture];
    
    //判断是否有摄像头
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
//        [self showInfo:@"您的设备没有摄像头或者相关的驱动, 不能进行直播"];
        [MBProgressHUD showError:@"您的设备没有摄像头或者相关的驱动, 不能进行直播"];
        return;
    }
    //判断是否有摄像头权限
    AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
//        [self showInfo:@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头"];
        [MBProgressHUD showError:@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头"];
        return ;
    }
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
            if (granted) {
                return YES;
            }
            else {
//                [self showInfo:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"];
                [MBProgressHUD showError:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"];
                return NO;
            }
        }];
    }
    
}

-(LFLiveSession *)session{
    if(!_session){
        /***   默认分辨率368 ＊ 640  音频：44.1 iphone6以上48  双声道  方向竖屏 ***/
        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfigurationForQuality:LFLiveVideoQuality_Medium2]];
        
        /**    自己定制高质量音频128K 分辨率设置为720*1280 方向竖屏 */
        /*
         LFLiveAudioConfiguration *audioConfiguration = [LFLiveAudioConfiguration new];
         audioConfiguration.numberOfChannels = 2;
         audioConfiguration.audioBitrate = LFLiveAudioBitRate_128Kbps;
         audioConfiguration.audioSampleRate = LFLiveAudioSampleRate_44100Hz;
         
         LFLiveVideoConfiguration *videoConfiguration = [LFLiveVideoConfiguration new];
         videoConfiguration.videoSize = CGSizeMake(720, 1280);
         videoConfiguration.videoBitRate = 800*1024;
         videoConfiguration.videoMaxBitRate = 1000*1024;
         videoConfiguration.videoMinBitRate = 500*1024;
         videoConfiguration.videoFrameRate = 15;
         videoConfiguration.videoMaxKeyframeInterval = 30;
         videoConfiguration.orientation = UIInterfaceOrientationPortrait;
         videoConfiguration.sessionPreset = LFCaptureSessionPreset720x1280;
         
         _session = [[LFLiveSession alloc] initWithAudioConfiguration:audioConfiguration videoConfiguration:videoConfiguration liveType:LFLiveRTMP];
         */
        
        // 设置代理
        _session.delegate = self;
        _session.running = YES;
        _session.preView = self.livingPreView;
    }
    return _session;
}

- (UIView *)livingPreView
{
    if (!_livingPreView) {
        UIView *livingPreView = [[UIView alloc] initWithFrame:self.view.bounds];
        livingPreView.backgroundColor = [UIColor clearColor];
        livingPreView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view insertSubview:livingPreView atIndex:0];
        _livingPreView = livingPreView;
    }
    return _livingPreView;
}

#pragma mark -- LFStreamingSessionDelegate
/** live status changed will callback */
- (void)liveSession:(nullable LFLiveSession *)session liveStateDidChange:(LFLiveState)state{
    NSString *tempStatus;
    switch (state) {
        case LFLiveReady:
            tempStatus = @"准备中";
            break;
        case LFLivePending:
            tempStatus = @"连接中";
            break;
        case LFLiveStart:
            tempStatus = @"已连接";
            break;
        case LFLiveStop:
            tempStatus = @"已断开";
            break;
        case LFLiveError:
            tempStatus = @"连接出错";
            break;
        case LFLiveRefresh://  正在刷新
             tempStatus = @"正在刷新";
        default:
            break;
    }
    
    LxDBAnyVar(tempStatus);
//    self.stateLable.text = [NSString stringWithFormat:@"状态: %@\nRTMP: %@", tempStatus, self.rtmpUrl];
}

/** live debug info callback */
- (void)liveSession:(nullable LFLiveSession *)session debugInfo:(nullable LFLiveDebug*)debugInfo{
    LxDBAnyVar(debugInfo);
}

/** callback socket errorcode */
- (void)liveSession:(nullable LFLiveSession*)session errorCode:(LFLiveSocketErrorCode)errorCode{
    LxDBAnyVar(errorCode);
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

- (IBAction)mopiSliderChangeValue:(UISlider *)sender {
    
    // 值越小，磨皮效果越好
//    CGFloat maxValue = 10;
//    [_bilateralFilter setDistanceNormalizationFactor:(maxValue - sender.value)];
    
    
}

- (IBAction)meibaiSliderValueChanged:(UISlider *)sender {
//    _brightnessFilter.brightness = sender.value;
//    LxDBAnyVar(sender.value);
}

- (IBAction)switchBtnChanged:(UISwitch *)sender {
//    // 切换美颜效果原理：移除之前所有处理链，重新设置处理链
//    if (sender.on) {
//        
//        // 移除之前所有处理链
//        [_videoCamera removeAllTargets];
//        
//        // 创建美颜滤镜
//        GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc] init];
////
////        // 设置GPUImage处理链，从数据源 => 滤镜 => 最终界面效果
//        [_videoCamera addTarget:beautifyFilter];
//        [beautifyFilter addTarget:_captureVideoPreview];
//        
//    } else {
//        
//        // 移除之前所有处理链
//        [_videoCamera removeAllTargets];
//        [_videoCamera addTarget:_captureVideoPreview];
//    }
    self.session.beautyFace = sender.on;
}

- (IBAction)onSwitchSwitch:(UISwitch *)sender {
    if (sender.on == false) {
        [self.session stopLive];
    }else{
        
        LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
        // 本地推流地址
        stream.url = @"rtmp://live.hkstv.hk.lxdns.com:1935/live/xiaoyao";
//        stream.url = @"rtmp://localhost:1935/rtmplive/room";
        //        self.rtmpUrl = stream.url;
        [self.session startLive:stream];
    }
}

- (IBAction)changePostionBtnClick:(id)sender {
//    [self.videoCamera rotateCamera];
    AVCaptureDevicePosition devicePositon = self.session.captureDevicePosition;
    self.session.captureDevicePosition = (devicePositon == AVCaptureDevicePositionBack) ? AVCaptureDevicePositionFront : AVCaptureDevicePositionBack;
}
@end
