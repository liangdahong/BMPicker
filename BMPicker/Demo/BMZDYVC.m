//
//  BMZDYVC.m
//  BMPick
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMZDYVC.h"
#import "BMPicker.h"
#import "SVProgressHUD.h"

@interface BMZDYVC ()

@property (weak, nonatomic) IBOutlet UISwitch *onSwitch;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BMZDYVC

- (IBAction)buttonClick1 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYear];
}

- (IBAction)buttonClick2 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYearMonth];
}

- (IBAction)buttonClick3 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYearMonthDay];
}

- (IBAction)buttonClick4 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYearMonthDayHour];
}

- (IBAction)buttonClick5 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYearMonthDayHourMinute];
}

- (IBAction)buttonClick6 {
    [self showPickWithDatePickerMode:BMDatePickerViewModeYearMonthDayHourMinuteSecond];
}

- (IBAction)switchClick:(UISwitch *)sender {
    self.dateLabel.hidden = sender.on;
}

- (void)showPickWithDatePickerMode:(BMDatePickerMode)datePickerMode {
    if (!self.onSwitch.on) {
        [BMPicker showCustomDatePickWithChangeForPickerMode:datePickerMode date:nil minimumDate:nil maximumDate:nil changeBlock:^(NSDate *date) {
            self.dateLabel.text = date.description;
        }];
    } else {
        [BMPicker showCustomDatePickWithConfirmForPickerMode:datePickerMode date:nil minimumDate:nil maximumDate:nil confirmBlock:nil];
        
    }
}
@end
