//
//  KRViewController.m
//  VPNDemo
//
//  Created by 威威孙 on 2017/10/12.
//  Copyright © 2017年 Gin. All rights reserved.
//

#import "KRViewController.h"

@interface KRViewController ()<UIWebViewDelegate>

@end

@implementation KRViewController

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
//    [MBProgressHUD showIndicatorMessage:@"加载中" toView:self.view];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpNewNai:nil Title:self.titleStr];
    
    NSURLRequest  * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.blinroom.com/vr_video/napd_en.html"]];
    
    UIWebView  * web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
    web.delegate = self;
    [web loadRequest:request];
    [self.view addSubview:web];
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [MBProgressHUD hideHUDForView:self.view];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [MBProgressHUD hideHUDForView:self.view];
//    [MBProgressHUD showError:@"加载失败，请重试！"];
}

@end
