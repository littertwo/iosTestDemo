//
//  XYShowOnLineTabBarVC.m
//  testDemo
//
//  Created by XYCoder on 2017/5/2.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYShowOnLineTabBarVC.h"
#import "XYShowOnlineVC.h"
#import "XYMyShowOnLineVC.h"
@interface XYShowOnLineTabBarVC ()

@end

@implementation XYShowOnLineTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[XYShowOnlineVC new] WithTitle:@"首页" imageName:@"tab_icon_home" selectedImageName:@"tab_icon_home_pr"];
    [self addChildViewController:[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XYMyShowOnLineVC class]) owner:nil options:nil][0] WithTitle:@"直播" imageName:@"tab_icon_person" selectedImageName:@"tab_icon_person_pr"];
    
    
    self.isAutoNetWorkingMonitor = true;
}

//-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = true;
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = false;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imgName selectedImageName:(NSString *)seletedImgName {
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:imgName];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:seletedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor grayColor];
    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *selectDic = [NSMutableDictionary dictionary];
    selectDic[NSForegroundColorAttributeName] = [UIColor colorWithHex:0x29a7e1];
    [viewController.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
    XYNavigationController *nav = [[XYNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
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
