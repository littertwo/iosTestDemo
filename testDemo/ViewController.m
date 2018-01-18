//
//  ViewController.m
//  testDemo
//
//  Created by XYCoder on 2017/3/21.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "ViewController.h"
#import "XYFlatBrawerHeader.h"
#import "XYBrawerHeaderImageView.h"
#import "XYFlatBrawerHeaderVC.h"
#import "CommentPicsVC.h"
#import "MHBugTableViewController.h"
#import "ImageDetailViewController.h"
#import "GoogleVRViewTest.h"
#import "XYShowOnlineVC.h"
#import "XYShowOnLineTabBarVC.h"
#import "XYLittleFunctionTableVC.h"
#import "MainViewController.h"
@interface ViewController ()
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController
{
    UIImageView *_image;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
//    UITableView *tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, SCREENSIZE.height -64) style:UITableViewStylePlain];
//    tableVIew.delegate = self;
//    tableVIew.dataSource = self;
//    [tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
//    [self.view addSubview:tableVIew];
    
    [self addChildVC:[MainViewController new] imageName:@"tab_icon_home" selectedImageName:@"tab_icon_home_pr"];
    [self addChildVC:[MiddleViewController new] imageName:@"tab_icon_quanzi" selectedImageName:@"tab_icon_quanzi_pr"];
    [self addChildVC:[MineViewController new] imageName:@"tab_icon_person" selectedImageName:@"tab_icon_person_pr"];
}

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"XYFlatBrawerHeader",@"CommentPicsView",@"MHBugTableViewController",@"图片处理",@"GoogleVRViewTest",@"XYShowOnlineVC",@"一些小功能", nil];
    }
    return _dataArray;
}



- (void)addChildVC:(UIViewController *)childVc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    UIEdgeInsets   insets = UIEdgeInsetsMake(4, 0, -4, 0);
    childVc.tabBarItem.imageInsets = insets;
    
    
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHex:0x999999];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor clearColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加为tabbar控制器的子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
