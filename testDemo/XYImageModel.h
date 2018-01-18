//
//  XYImageModel.h
//  testDemo
//
//  Created by 威威孙 on 2017/5/25.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYImageModel : NSObject
@property (nonatomic,strong) NSString *picId;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *des;
@property (nonatomic,assign) XYPhonesType isVideo;
@end
