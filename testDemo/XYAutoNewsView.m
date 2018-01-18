//
//  XYAutoNewsView.m
//  testDemo
//
//  Created by 威威孙 on 2018/1/11.
//  Copyright © 2018年 威威孙. All rights reserved.
//

#import "XYAutoNewsView.h"

@implementation XYAutoNewsView
{
    UITableView *_tableView;
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [_tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
