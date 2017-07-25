//
//  BMCustomDatePickerView.h
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMPicker.h"
#define __sc_w__        [UIScreen mainScreen].bounds.size.width
#define __sc_h__        [UIScreen mainScreen].bounds.size.height
#define __height__      216.0f
#define __start_year__  2001

@interface BMCustomDatePickerView : UIView

+ (void)setDefaultTextFont:(UIFont *)textfont;
+ (void)setDefaultTextColor:(UIColor *)textColor;
+ (void)setDefaultTextAlignment:(NSTextAlignment )textAlignment;
+ (void)setDefaultAdjustsFontSizeToFitWidth:(BOOL )adjustsFontSizeToFitWidth;
+ (void)setDefaultMinimumScaleFactor:(CGFloat )minimumScaleFactor;
    
+ (void)setDefaultYearModifierString:(NSString *)string;
+ (void)setDefaultMonthModifierString:(NSString *)string;
+ (void)setDefaultDayModifierString:(NSString *)string;
+ (void)setDefaultHourModifierString:(NSString *)string;
+ (void)setDefaultMinutesModifierString:(NSString *)string;
+ (void)setDefaultSecondsModifierString:(NSString *)string;

+ (void)setDefaultYearShorthand:(BOOL)shorthand;
+ (void)setDefaultMonthFillZero:(BOOL)fillZero;
+ (void)setDefaultDayFillZero:(BOOL)fillZero;
+ (void)setDefaultHourFillZero:(BOOL)fillZero;
+ (void)setDefaultMinutesFillZero:(BOOL)fillZero;
+ (void)setDefaultSecondsFillZero:(BOOL)fillZero;

+ (instancetype)customDatePickWithConfirmForPickerMode:(BMDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

+ (instancetype)customDatePickWithChangeForPickerMode:(BMDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock;

@end
