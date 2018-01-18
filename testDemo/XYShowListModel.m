//
//  XYShowListModel.m
//  testDemo
//
//  Created by XYCoder on 2017/4/28.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYShowListModel.h"

@implementation XYShowListModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"showId" : @"id"
             };
}

//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{
//             @"creator" : [XYShowerModel class],
//             };
//}

@end

@implementation XYShowerModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"showerId" : @"id"
             };
}

@end
