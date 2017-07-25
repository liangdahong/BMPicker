//
//  BMDatePickerViewVC.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMDatePickerViewVC.h"
#import "BMPicker.h"
#import "SVProgressHUD.h"

@interface BMDatePickerViewVC ()

@property (weak, nonatomic) IBOutlet UISwitch *onSwitch;

@end

@implementation BMDatePickerViewVC

- (IBAction)buttonClick1:(id)sender {
    [self showPickWithDatePickerMode:UIDatePickerModeTime];
}

- (IBAction)buttonClick2:(id)sender {
    [self showPickWithDatePickerMode:UIDatePickerModeDate];
}

- (IBAction)buttonClick3:(id)sender {
    [self showPickWithDatePickerMode:UIDatePickerModeDateAndTime];
}

- (IBAction)buttonClick4:(id)sender {
    [self showPickWithDatePickerMode:UIDatePickerModeCountDownTimer];
}

- (void)showPickWithDatePickerMode:(UIDatePickerMode)datePickerMode {
    if (!self.onSwitch.on) {
        [BMPicker showSystemDatePickWithChangeForPickerMode:datePickerMode date:nil minimumDate:nil maximumDate:nil changeBlock:^(NSDate *date) {
            [SVProgressHUD showSuccessWithStatus:date.description];
        }];
    } else {
        [BMPicker showSystemDatePickWithConfirmForPickerMode:datePickerMode date:nil minimumDate:nil maximumDate:nil confirmBlock:^BOOL(NSDate *date) {
            [SVProgressHUD showSuccessWithStatus:date.description];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否满足条件？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alert addAction:[UIAlertAction actionWithTitle:@"不满足" style:0 handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"满足" style:0 handler:^(UIAlertAction * _Nonnull action) {
                [BMPicker dismiss];
            }]];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }];
    }
}

@end
