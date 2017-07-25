//
//  BMPicker.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMPicker.h"
#import "BMSystemDatePickerView.h"
#import "BMCustomDatePickerView.h"
#import "UIView+BMLayoutConstraint.h"
#import <pop/POP.h>

#define kRepeatAddView UIWindow *window = [UIApplication sharedApplication].keyWindow;for (UIView *view in window.subviews) { if ([view isKindOfClass:BMCustomDatePickerView.class] || [view isKindOfClass:BMSystemDatePickerView.class]) { return; } }

@implementation BMPicker

+ (void)setDefaultTextFont:(UIFont *)textfont {
    [BMCustomDatePickerView setDefaultTextFont:textfont];
}

+ (void)setDefaultTextColor:(UIColor *)textColor {
    [BMCustomDatePickerView setDefaultTextColor:textColor];
}

+ (void)setDefaultTextAlignment:(NSTextAlignment )textAlignment {
    [BMCustomDatePickerView setDefaultTextAlignment:textAlignment];
}

+ (void)setDefaultAdjustsFontSizeToFitWidth:(BOOL )adjustsFontSizeToFitWidth {
    [BMCustomDatePickerView setDefaultAdjustsFontSizeToFitWidth:adjustsFontSizeToFitWidth];
}

+ (void)setDefaultMinimumScaleFactor:(CGFloat )minimumScaleFactor {
    [BMCustomDatePickerView setDefaultMinimumScaleFactor:minimumScaleFactor];
}


+ (void)setDefaultYearModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultYearModifierString:string];
}

+ (void)setDefaultMonthModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultMonthModifierString:string];
}

+ (void)setDefaultDayModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultDayModifierString:string];
}

+ (void)setDefaultHourModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultHourModifierString:string];
}

+ (void)setDefaultMinutesModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultMinutesModifierString:string];
}

+ (void)setDefaultSecondsModifierString:(NSString *)string {
    [BMCustomDatePickerView setDefaultSecondsModifierString:string];
}

+ (void)setDefaultYearShorthand:(BOOL)shorthand {
    [BMCustomDatePickerView setDefaultYearShorthand:shorthand];
}

+ (void)setDefaultMonthFillZero:(BOOL)fillZero {
    [BMCustomDatePickerView setDefaultMonthFillZero:fillZero];
}

+ (void)setDefaultDayFillZero:(BOOL)fillZero {
    [BMCustomDatePickerView setDefaultDayFillZero:fillZero];
}

+ (void)setDefaultHourFillZero:(BOOL)fillZero {
    [BMCustomDatePickerView setDefaultHourFillZero:fillZero];
}

+ (void)setDefaultMinutesFillZero:(BOOL)fillZero {
    [BMCustomDatePickerView setDefaultMinutesFillZero:fillZero];
}

+ (void)setDefaultSecondsFillZero:(BOOL)fillZero {
    [BMCustomDatePickerView setDefaultSecondsFillZero:fillZero];
}

+ (void)dismiss {
    for (UIView *view in [[UIApplication sharedApplication] keyWindow].subviews) {
        if ([view isKindOfClass:BMSystemDatePickerView.class] || [view isKindOfClass:BMCustomDatePickerView.class]) {
            [view removeFromSuperview];
            return;
        }
    }
}

+ (void)showSystemDatePickWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                              date:(NSDate *)date
                                       minimumDate:(NSDate *)minimumDate
                                       maximumDate:(NSDate *)maximumDate
                                      confirmBlock:(BMDatePickerConfirmBlock)confirmBlock {
    kRepeatAddView
    BMSystemDatePickerView *systemDatePickView = [BMSystemDatePickerView systemDatePickWithConfirmForPickerMode:pickerMode date:date minimumDate:minimumDate maximumDate:maximumDate confirmBlock:confirmBlock];
    [window addSubview:systemDatePickView];
    [systemDatePickView bm_addConstraintAround];
}

+ (void)showSystemDatePickWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                             date:(NSDate *)date
                                      minimumDate:(NSDate *)minimumDate
                                      maximumDate:(NSDate *)maximumDate
                                      changeBlock:(BMDatePickerChangeBlock)changeBlock {
    kRepeatAddView
    BMSystemDatePickerView *systemDatePickView = [BMSystemDatePickerView systemDatePickWithChangeForPickerMode:pickerMode date:date minimumDate:minimumDate maximumDate:maximumDate changeBlock:changeBlock];
    [window addSubview:systemDatePickView];
    [systemDatePickView bm_addConstraintAround];
}

+ (void)showCustomDatePickWithConfirmForPickerMode:(BMDatePickerMode)pickerMode
                                              date:(NSDate *)date
                                       minimumDate:(NSDate *)minimumDate
                                       maximumDate:(NSDate *)maximumDate
                                      confirmBlock:(BMDatePickerConfirmBlock)confirmBlock {
    kRepeatAddView
    BMCustomDatePickerView *customDatePickView = [BMCustomDatePickerView customDatePickWithConfirmForPickerMode:pickerMode date:date minimumDate:minimumDate maximumDate:maximumDate confirmBlock:confirmBlock];
    [window addSubview:customDatePickView];
    [customDatePickView bm_addConstraintAround];
}

+ (void)showCustomDatePickWithChangeForPickerMode:(BMDatePickerMode)pickerMode
                                             date:(NSDate *)date
                                      minimumDate:(NSDate *)minimumDate
                                      maximumDate:(NSDate *)maximumDate
                                      changeBlock:(BMDatePickerChangeBlock)changeBlock {
    kRepeatAddView
    BMCustomDatePickerView *customDatePickView = [BMCustomDatePickerView customDatePickWithChangeForPickerMode:pickerMode date:date minimumDate:minimumDate maximumDate:maximumDate changeBlock:changeBlock];
    [window addSubview:customDatePickView];
    [customDatePickView bm_addConstraintAround];
}

@end
