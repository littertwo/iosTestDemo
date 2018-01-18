//
//  XYMyShowOnLineVC.h
//  testDemo
//
//  Created by XYCoder on 2017/5/2.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYMyShowOnLineVC : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *mopiSlider;
@property (weak, nonatomic) IBOutlet UISlider *meibaiSlider;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (weak, nonatomic) IBOutlet UISwitch *onSwitch;
@property (weak, nonatomic) IBOutlet UIButton *changePostionBtn;
- (IBAction)mopiSliderChangeValue:(UISlider *)sender;
- (IBAction)meibaiSliderValueChanged:(UISlider *)sender;
- (IBAction)switchBtnChanged:(UISwitch *)sender;
- (IBAction)onSwitchSwitch:(UISwitch *)sender;
- (IBAction)changePostionBtnClick:(UIButton *)sender;
@end
