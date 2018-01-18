//
//  UIViewController+Base.m
//  testDemo
//
//  Created by XYCoder on 2017/5/4.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "UIViewController+Base.h"
#import <objc/runtime.h>

@implementation UIViewController (Base)

static char *autoNetWorkingMonitor = "autoNetWorkingMonitor";
static char *autoNetWorkingMonitorBlock = "autoNetWorkingMonitorBlock";


-(void)setIsAutoNetWorkingMonitor:(BOOL)isAutoNetWorkingMonitor{
    objc_setAssociatedObject(self, autoNetWorkingMonitor, [NSNumber numberWithBool:isAutoNetWorkingMonitor], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    if (isAutoNetWorkingMonitor) {
        // 2.设置网络状态改变后的处理
        [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            if (self.netWorkingDidChangedBlick) {
                self.netWorkingDidChangedBlick(status);
            }
            // 当网络状态改变了, 就会调用这个block
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: // 未知网络
                    [MBProgressHUD showError:@"当前网络：未知"];
                    break;
                case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                    [MBProgressHUD showMessage:@"网络已断开"];
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                    [MBProgressHUD showMessage:@"当前网络：移动数据"];
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                    [MBProgressHUD showMessage:@"当前网络：WiFi"];
                    break;
            }
        }];
        // 3.开始监控
        [mgr startMonitoring];
    }else{
        //3.
        [mgr stopMonitoring];
    }
}

-(BOOL)isAutoNetWorkingMonitor{
    return objc_getAssociatedObject(self, autoNetWorkingMonitor);
}

-(void)setNetWorkingDidChangedBlick:(void (^)(AFNetworkReachabilityStatus))netWorkingDidChangedBlick{
    objc_setAssociatedObject(self, autoNetWorkingMonitorBlock, netWorkingDidChangedBlick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(AFNetworkReachabilityStatus))netWorkingDidChangedBlick{
    return objc_getAssociatedObject(self, autoNetWorkingMonitorBlock);
}

#pragma mark -- 页面
+ (UIViewController *)getCurrentViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UIViewController *)findBestViewController:(UIViewController *)vc{
    if (vc.presentedViewController) {
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}


-(CGFloat)functionUseTimesDurtionBlock:(durtionBlock)fuction{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    fuction();
    CFAbsoluteTime useTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"操作耗时：%lf ms", useTime*1000.0);
    return useTime *1000;
}

@end
