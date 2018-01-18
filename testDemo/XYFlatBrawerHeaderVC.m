//
//  XYFlatBrawerHeaderVC.m
//  testDemo
//
//  Created by XYCoder on 2017/3/24.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "XYFlatBrawerHeaderVC.h"
#import "XYFlatBrawerHeader.h"
#import "XYBrawerHeaderImageView.h"
#import "XYCollectionBrawer.h"
#import "XYImageModel.h"
@interface XYFlatBrawerHeaderVC ()<FlatDrawerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)NSMutableArray *imagesArray;
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation XYFlatBrawerHeaderVC

-(NSMutableArray *)imagesArray{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",nil];
    }
    return _imagesArray;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENSIZE.width, SCREENSIZE.height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[ESWebService sharedWebService].flat getHourseListWithParameter:nil success:^(id jsonData) {
////        LxDBObjectAsJson(jsonData);
//    } failure:^(NSString *error) {
//        LxDBAnyVar(error);
//    }];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:self.tableView];
    
}

#pragma mark --tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 300;
    }else{
        return 300;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.row == 0) {
        
        XYFlatBrawerHeader *header = [[XYFlatBrawerHeader alloc]initWithFrame:CGRectMake(0 , 0, SCREENSIZE.width, 300)];
        header.delegate = self;
        [cell.contentView addSubview:header];
        [header reloadData];
    }else if (indexPath.row == 1){
        XYCollectionBrawer *header1 = [[XYCollectionBrawer alloc]initWithFrame:CGRectMake(0, 0, SCREENSIZE.width, 300)];
        NSMutableArray *array = [NSMutableArray array];
        [cell.contentView addSubview:header1];
        NSArray *titles = @[@"客厅",@"厨房+卧室",@"卫生间"];
        for (int i = 0; i<3; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            for (int j = 0; j<2; j++) {
                XYImageModel *model = [[XYImageModel alloc]init];
                model.url = self.imagesArray[i+j];
                model.des = titles[i];
                [arr addObject:model];
            }
            [array addObject:arr];
        }
        header1.imagesArray = array;
    }
    return cell;
}

//标题
-(NSArray *)titlesOfFlatBrawer:(XYFlatBrawerHeader *)flatBrawerHeader{
    return @[@"客厅",@"卫生间+厨房+阳台",@"书房",@"浴室",@"卧室",@"衣帽间"];
}

//组数
-(NSInteger)numOfSectionsInDrawer:(XYFlatBrawerHeader *)flatBrawerHeader{
//    NSArray *arr = @[@"0",@"1"];
    return 6;
}

//每组个数
-(NSInteger)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader numOfIntemsInSection:(NSInteger)sectionIndex{
    return 2;
}

-(UIImageView *)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader itemForHeaderAtIndex:(NSInteger)index{
    NSArray *arr = @[@"http://tse2.mm.bing.net/th?id=OIP.Sn6_jCLg5Bu2vEzIBAi9DgEsC7&pid=15.1",
                     @"http://tse2.mm.bing.net/th?id=OIP.Sn6_jCLg5Bu2vEzIBAi9DgEsC7&pid=15.1",
                     @"http://img2.3lian.com/2014/f6/60/d/51.jpg",
                     @"http://img2.3lian.com/2014/f6/60/d/51.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361798&di=648652ed171f43032a4858f2a87b7001&imgtype=0&src=http%3A%2F%2Fpic36.nipic.com%2F20131202%2F4210488_125116137134_2.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361798&di=648652ed171f43032a4858f2a87b7001&imgtype=0&src=http%3A%2F%2Fpic36.nipic.com%2F20131202%2F4210488_125116137134_2.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361800&di=c9cc4db8918da4bffcccea75c94aa1d6&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201507%2F23%2F20150723215302_sGnJC.thumb.700_0.jpeg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361800&di=c9cc4db8918da4bffcccea75c94aa1d6&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201507%2F23%2F20150723215302_sGnJC.thumb.700_0.jpeg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361799&di=41a4486efef2d139c3e306d8cae1f16e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2Ff3f0d9fc1e178a8281800e78f603738dab77e884.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361799&di=41a4486efef2d139c3e306d8cae1f16e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2Ff3f0d9fc1e178a8281800e78f603738dab77e884.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361795&di=06ff87230b69044d69fc202c6596a4f7&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fb21bb051f81986180f030a8049ed2e738bd4e66a.jpg",
                     @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490254361795&di=06ff87230b69044d69fc202c6596a4f7&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fb21bb051f81986180f030a8049ed2e738bd4e66a.jpg"];
    XYBrawerHeaderImageView *image = [[XYBrawerHeaderImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENSIZE.width, 300)];
    image.url = arr[index];
    image.index = index;
    image.backgroundColor = [UIColor colorWithRandomColor];
    if (index%2 == 0) {
        image.isPlayer = YES;
    }else{
        image.isPlayer = false;
    }
    return image;
}



-(void)tap:(UITapGestureRecognizer *)tap{
    NSLog(@"tap");
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
