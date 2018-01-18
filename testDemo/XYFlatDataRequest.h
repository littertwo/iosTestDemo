//
//  XYFlatDataRequest.h
//  XiongDaJinFu
//
//  Created by XYCoder on 2017/3/15.
//  Copyright © 2017年 digirun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESConst.h"
@interface XYFlatDataRequest : NSObject

/**
 *  获取公寓列表信息
 */
- (void)getFlatListWithParameter:(NSDictionary *)dic success:(FinishedBlock)success failure:(FailedBlock)fail;

/**
 *  获取住宅列表信息
 */
- (void)getHourseListWithParameter:(NSDictionary *)dic success:(FinishedBlock)success failure:(FailedBlock)fail;
@end
