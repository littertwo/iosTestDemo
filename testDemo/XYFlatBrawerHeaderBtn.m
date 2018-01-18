//
//  XYFlatBrawerHeaderBtn.m
//  testDemo
//
//  Created by XYCoder on 2017/3/23.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "XYFlatBrawerHeaderBtn.h"

@implementation XYFlatBrawerHeaderBtn

-(void)setIsSection:(BOOL)isSection{
    _isSection = isSection;
    if (_isSection) {
        [self setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    }else{
        [self setTitleColor:[UIColor colorWithHex:0x999999] forState:UIControlStateNormal];
    }
}

@end
