//
//  XYCollectionBrawer.h
//  testDemo
//
//  Created by 威威孙 on 2017/5/25.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCollectionBrawer : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *imageViewCollection;

@property (nonatomic,strong) UIScrollView *titlesScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSArray *imagesArray;

@property (nonatomic,copy) void(^imageClickBlock)();

@end
