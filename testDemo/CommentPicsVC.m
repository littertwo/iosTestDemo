//
//  CommentPicsVC.m
//  testDemo
//
//  Created by XYCoder on 2017/3/24.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "CommentPicsVC.h"
#import "XYCommunityPicView.h"
@interface CommentPicsVC ()<CommentPicsViewDelegate>

@end

@implementation CommentPicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = true;
    self.view.backgroundColor = [UIColor whiteColor];
    XYCommunityPicView *view = [[XYCommunityPicView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, 20)];
    view.delegete = self;
    [self.view addSubview:view];
    [view layoutPics];
    
    UIButton *image = [UIButton buttonWithType:UIButtonTypeCustom];
    image.frame =CGRectMake(0, 200, 50, 50);
    image.backgroundColor = [UIColor colorWithRandomColor];
    
    image.layer.shadowRadius =5;
    image.layer.cornerRadius = 25;
    image.layer.shadowOffset = CGSizeMake(0, 0);
    image.layer.shadowColor = [UIColor colorWithRandomColor].CGColor;
    image.layer.shadowOpacity = 0.8;
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfPicturesInView:(XYCommunityPicView *)picsView{
    return 3;
}

-(NSArray *)urlOfImages{
    return @[@"http://tse2.mm.bing.net/th?id=OIP.Sn6_jCLg5Bu2vEzIBAi9DgEsC7&pid=15.1",
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
};

-(void)picsView:(XYCommunityPicView *)picsView didSelectWithIndex:(NSInteger)index{
    
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
