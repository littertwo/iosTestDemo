//
//  MainViewController.m
//  testDemo
//
//  Created by 威威孙 on 2017/6/1.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "MainViewController.h"

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
@interface MainViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation MainViewController

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"XYFlatBrawerHeader",@"MHBugTableViewController",@"图片处理",@"GoogleVRViewTest",@"XYShowOnlineVC",@"一些小功能", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, SCREENSIZE.height -64) style:UITableViewStylePlain];
    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    [tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:tableVIew];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            XYFlatBrawerHeaderVC *vc = [[XYFlatBrawerHeaderVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            MHBugTableViewController *mh = [[MHBugTableViewController alloc]init];
            [self.navigationController pushViewController:mh animated:YES];
        }
            break;
        case 2:{
            ImageDetailViewController *image = [[ImageDetailViewController alloc]init];
            [self.navigationController pushViewController:image animated:true];
        }
            break;
        case 3:{
            GoogleVRViewTest *vr = [[GoogleVRViewTest alloc]init];
            [self.navigationController pushViewController:vr animated:true];
        }
            break;
        case 4:{
            XYShowOnLineTabBarVC *show = [XYShowOnLineTabBarVC new];
            [self.navigationController pushViewController:show animated:true];
        }
            break;
        case 5:{
            XYLittleFunctionTableVC *little = [XYLittleFunctionTableVC new];
            [self.navigationController pushViewController:little animated:true];
        }
            break;
        default:
            break;
    }
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
