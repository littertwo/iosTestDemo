//
//  XYShowListModel.h
//  testDemo
//
//  Created by XYCoder on 2017/4/28.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XYShowerModel;
@interface XYShowListModel : NSObject

@property (nonatomic, copy) NSString *showId;

@property (nonatomic, assign) NSInteger online_users;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) NSInteger rotate;

@property (nonatomic, strong) NSDictionary *extra;

@property (nonatomic, assign) NSInteger multi;

@property (nonatomic, assign) NSInteger link;

@property (nonatomic, copy) NSString *share_addr;

@property (nonatomic, assign) NSInteger slot;

@property (nonatomic, strong) XYShowerModel *creator;

@property (nonatomic, assign) NSInteger group;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *live_type;

@property (nonatomic, copy) NSString *stream_addr;

@property (nonatomic, assign) NSInteger optimal;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger landscape;
@end

@interface XYShowerModel : NSObject
@property (nonatomic,strong) NSString *showerId;
@property (nonatomic,strong) NSString *level;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSString *nick;
@property (nonatomic,strong) NSString *portrait;
@end
