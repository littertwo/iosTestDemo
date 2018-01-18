//
//  NSDictionary+Extension.h
//  testDemo
//
//  Created by XYCoder on 2017/4/28.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 *  自动生成属性列表
 *
 *  @param dict JSON字典/模型字典
 */
+(void)printPropertyWithDict:(NSDictionary *)dict;
@end
