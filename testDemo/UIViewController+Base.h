//
//  UIViewController+Base.h
//  testDemo
//
//  Created by XYCoder on 2017/5/4.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Base)

#pragma mark -- 获取当前页面
+ (UIViewController *)getCurrentViewController;
//结束进程--卡死
#pragma mark -- 硬件
//GPS
//二维码
//WiFi外设
//蓝牙
//摄像头（红外）
//手机温度
//内存
//电量
//陀螺仪（指南针，赛车类游戏，vr，ar）
//运动传感器\加速度传感器\加速计（摇一摇，计步器）
//湿度传感器
//磁力计
//距离传感器
//环境光传感器
//touch id

#pragma mark -- 操作耗时
typedef void (^durtionBlock)();
/**
 计算耗时操作时间

 @param fuction 耗时操作代码块
 @return 毫秒数
 */
-(CGFloat)functionUseTimesDurtionBlock:(durtionBlock)fuction;

#pragma mark -- 网络监测
//网络
/**
 自动网络监测 set
 */

@property (nonatomic,assign)BOOL isAutoNetWorkingMonitor;//
@property (nonatomic,copy) void(^netWorkingDidChangedBlick)(AFNetworkReachabilityStatus netWorkingStatus);
@end
