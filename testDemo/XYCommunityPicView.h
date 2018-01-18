//
//  XYCommunityPicView.h
//  XiongDaJinFu
//
//  Created by XYCoder on 2017/3/23.
//  Copyright © 2017年 digirun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYCommunityPicView;
@protocol CommentPicsViewDelegate<NSObject>;
-(NSInteger)numberOfPicturesInView:(XYCommunityPicView *)picsView;
-(NSArray *)urlOfImages;
-(void)picsView:(XYCommunityPicView *)picsView didSelectWithIndex:(NSInteger)index;
@end
@interface XYCommunityPicView : UIView
@property (nonatomic,weak)id<CommentPicsViewDelegate> delegete;
-(void)layoutPics;
@end
