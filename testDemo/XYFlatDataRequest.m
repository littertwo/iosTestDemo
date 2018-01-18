//
//  XYFlatDataRequest.m
//  XiongDaJinFu
//
//  Created by XYCoder on 2017/3/15.
//  Copyright © 2017年 digirun. All rights reserved.
//

#import "XYFlatDataRequest.h"
#import "ESNetworkAgent.h"

@implementation XYFlatDataRequest

-(void)getFlatListWithParameter:(NSDictionary *)dic success:(FinishedBlock)success failure:(FailedBlock)fail{
    [[ESNetworkAgent sharedAgent] postDataFromUrl:@"apartment/get" requestBody:dic whileFinished:^(id jsonData) {
        success(jsonData);
    } whileFailed:^(NSString *error) {
        fail(error);
    }];
    
//    [[ESNetworkAgent sharedAgent] postJsonDataFromUrl:@"apartment/get" requestBody:dic whileFinished:^(id jsonData) {
//        success(jsonData);
//    } whileFailed:^(NSString *error) {
//        fail(error);
//    }];
    
}

- (void)getHourseListWithParameter:(NSDictionary *)dic success:(FinishedBlock)success failure:(FailedBlock)fail{
    [[ESNetworkAgent sharedAgent] postDataFromUrl:@"house/get" requestBody:dic whileFinished:^(id jsonData) {
        success(jsonData);
    } whileFailed:^(NSString *error) {
        fail(error);
    }];
}

@end
