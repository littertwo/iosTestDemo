//
//  XYShowOnlineVC.m
//  testDemo
//
//  Created by XYCoder on 2017/4/27.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYShowOnlineVC.h"
#import "XYShowListModel.h"
#import "XYShowListTableViewCell.h"
#import "XYShowDetailViewController.h"
#import "XYNewIntroduceView.h"

@interface XYShowOnlineVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation XYShowOnlineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"直播";
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:self.tableView];
    [self.tableView.mj_header beginRefreshing];
//    LxDBAnyVar(NSStringFromClass([self class]));
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"zhuboid"] = @"649";
//    dict[@"appointment"] = @"1";
//    
//    [[XYNetRequestClient sharedNetWork]postDataFromUrl:@"/getMyVideo.htm" requestBody:dict whileFinished:^(id jsonData) {
//        LxDBAnyVar(jsonData);
//    } whileFailed:^(NSString *error) {
//        LxDBAnyVar(error);
//    }];

}


-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, SCREENSIZE.height -64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XYShowListTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([XYShowListTableViewCell class])];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self requestData];
        }];
    }
    return _tableView;
}

-(void)requestData{
    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        [self.dataArray removeAllObjects];
        for (NSDictionary *dict in responseObject[@"lives"]) {
            XYShowListModel *model = [XYShowListModel yy_modelWithDictionary:dict];
            [self.dataArray addObject:model];
        }
//                NSDictionary *dict = responseObject[@"lives"][0];
//                [NSDictionary printPropertyWithDict:dict];
//                LxDBAnyVar(responseObject);
        XYShowListModel *model = [XYShowListModel new];
        model.stream_addr = @"rtmp://live.hkstv.hk.lxdns.com:1935/live/xiaoyao";
        XYShowerModel *shower = [XYShowerModel new];
        shower.portrait = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498629706445&di=810b6feccc6d7d6c27a4e69a369a3d4b&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201611%2F12%2F20161112123321_4MYvP.thumb.700_0.jpeg";
        model.creator = shower;
        [self.dataArray insertObject:model atIndex:0];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
        [[XYNewIntroduceView sharedIntroudence]hiddenIntroduce];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREENSIZE.width;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XYShowListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XYShowListTableViewCell class])];
    XYShowListModel *model = self.dataArray[indexPath.row];
    [cell.showerIamgeView sd_setImageWithURL:[NSURL URLWithString:model.creator.portrait]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XYShowListModel *model = self.dataArray[indexPath.row];
    XYShowDetailViewController *detail = [XYShowDetailViewController new];
    detail.model = model;
    [self.navigationController pushViewController:detail animated:true];
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
