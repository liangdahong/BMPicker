//
//  BMExampleVC.m
//  BMPicker
//
//  Created by ___liangdahong on 2017/6/15.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMExampleVC.h"
#import "BMPicker.h"
#import "SVProgressHUD.h"

@interface BMExampleVC ()

@end

@implementation BMExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BMPicker";
}

- (IBAction)randomSettingClick:(id)sender {
    [BMPicker setDefaultTextFont:[UIFont boldSystemFontOfSize:arc4random_uniform(20) + 10]];
    [BMPicker setDefaultTextColor:[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]];
    [BMPicker setDefaultTextAlignment:arc4random_uniform(3)];
    [BMPicker setDefaultAdjustsFontSizeToFitWidth:arc4random_uniform(2)];
    [BMPicker setDefaultMinimumScaleFactor:arc4random_uniform(10)];
    [BMPicker setDefaultYearModifierString:arc4random_uniform(2) ? @"year" : @" 年"];
    [BMPicker setDefaultMonthModifierString:arc4random_uniform(2) ? @"month" : @" 月"];
    [BMPicker setDefaultDayModifierString:arc4random_uniform(2) ? @"day" : @" 日"];
    [BMPicker setDefaultHourModifierString:arc4random_uniform(2) ? @"hour" : @" 时"];
    [BMPicker setDefaultMinutesModifierString:arc4random_uniform(2) ? @"minunte" : @" 分"];
    [BMPicker setDefaultSecondsModifierString:arc4random_uniform(2) ? @"second" : @" 秒"];
    [BMPicker setDefaultYearShorthand:arc4random_uniform(2)];
    [BMPicker setDefaultMonthFillZero:arc4random_uniform(2)];
    [BMPicker setDefaultDayFillZero:arc4random_uniform(2)];
    [BMPicker setDefaultHourFillZero:arc4random_uniform(2)];
    [BMPicker setDefaultMinutesFillZero:arc4random_uniform(2)];
    [BMPicker setDefaultSecondsFillZero:arc4random_uniform(2)];
    [SVProgressHUD showSuccessWithStatus:@"已完成全局随机配置"];
}

- (IBAction)defaultClick:(UIBarButtonItem *)sender {
    [BMPicker setDefaultTextFont:[UIFont systemFontOfSize:15]];
    [BMPicker setDefaultTextColor:[UIColor blackColor]];
    [BMPicker setDefaultTextAlignment:1];
    [BMPicker setDefaultAdjustsFontSizeToFitWidth:YES];
    [BMPicker setDefaultMinimumScaleFactor:0];
    [BMPicker setDefaultYearModifierString:@" 年"];
    [BMPicker setDefaultMonthModifierString:@" 月"];
    [BMPicker setDefaultDayModifierString:@" 日"];
    [BMPicker setDefaultHourModifierString:@" 时"];
    [BMPicker setDefaultMinutesModifierString:@" 分"];
    [BMPicker setDefaultSecondsModifierString:@" 秒"];
    [BMPicker setDefaultYearShorthand:NO];
    [BMPicker setDefaultMonthFillZero:NO];
    [BMPicker setDefaultDayFillZero:NO];
    [BMPicker setDefaultHourFillZero:NO];
    [BMPicker setDefaultMinutesFillZero:NO];
    [BMPicker setDefaultSecondsFillZero:YES];
    [SVProgressHUD showSuccessWithStatus:@"已完成全局默认配置"];
}

- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
