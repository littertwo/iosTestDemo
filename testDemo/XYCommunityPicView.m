//
//  XYCommunityPicView.m
//  XiongDaJinFu
//
//  Created by XYCoder on 2017/3/23.
//  Copyright © 2017年 digirun. All rights reserved.
//

#import "XYCommunityPicView.h"
#define widthInpics 15//图片间距
@implementation XYCommunityPicView
{
    CGFloat _picWidth;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = true;
        self.frame = CGRectMake(0, 64, frame.size.width, frame.size.width);
        _picWidth = (self.frame.size.width -(2*widthInpics))/3.0f;
    }
    return self;
}

-(void)layoutPics{
//    CGFloat picWidth = (self.frame.size.width -(2*widthInpics))/3.0f;
    NSInteger count = [self.delegete numberOfPicturesInView:self];
    for (int i = 0; i <count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i%3*(_picWidth +widthInpics), i/3*(_picWidth +widthInpics), _picWidth, _picWidth)];
        imageView.userInteractionEnabled = true;
        imageView.tag = 400 +i;
        NSString *url = [self.delegete urlOfImages][i];
        imageView.backgroundColor = [UIColor colorWithRandomColor];
        [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@""]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTap:)];
        [imageView addGestureRecognizer:tap];
        [self addSubview:imageView];
    }
    if (count <=3) {
        self.frame = CGRectMake(0, 64, (_picWidth +widthInpics)*(count - 1) +_picWidth, _picWidth);
    }else{
        self.frame = CGRectMake(0, 64, 3*_picWidth +2*widthInpics, (count/3 -1)*(_picWidth +widthInpics) +_picWidth);
    }
}

-(void)imageViewTap:(UITapGestureRecognizer *)tap{
    UIImageView *image = (UIImageView *)tap.view;
    [self.delegete picsView:self didSelectWithIndex:(image.tag - 400)];
}


@end
