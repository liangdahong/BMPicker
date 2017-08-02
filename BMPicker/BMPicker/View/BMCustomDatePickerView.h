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

/**
 BMCustomDatePickerView
 */
@interface BMCustomDatePickerView : UIView

/**
 设置font

 @param textfont font
 */
+ (void)setDefaultTextFont:(UIFont *)textfont;

/**
 设置textColor

 @param textColor textColor
 */
+ (void)setDefaultTextColor:(UIColor *)textColor;

/**
 设置textAlignment

 @param textAlignment textAlignment
 */
+ (void)setDefaultTextAlignment:(NSTextAlignment )textAlignment;

/**
 设置adjustsFontSizeToFitWidth

 @param adjustsFontSizeToFitWidth adjustsFontSizeToFitWidth
 */
+ (void)setDefaultAdjustsFontSizeToFitWidth:(BOOL )adjustsFontSizeToFitWidth;

/**
 设置minimumScaleFactor

 @param minimumScaleFactor minimumScaleFactor
 */
+ (void)setDefaultMinimumScaleFactor:(CGFloat )minimumScaleFactor;

/**
 setDefaultYearModifierString

 @param string setDefaultYearModifierString
 */
+ (void)setDefaultYearModifierString:(NSString *)string;

/**
 setDefaultMonthModifierString

 @param string setDefaultMonthModifierString
 */
+ (void)setDefaultMonthModifierString:(NSString *)string;

/**
 setDefaultDayModifierString

 @param string setDefaultDayModifierString
 */
+ (void)setDefaultDayModifierString:(NSString *)string;

/**
 setDefaultHourModifierString

 @param string setDefaultHourModifierString
 */
+ (void)setDefaultHourModifierString:(NSString *)string;

/**
 setDefaultMinutesModifierString

 @param string setDefaultMinutesModifierString
 */
+ (void)setDefaultMinutesModifierString:(NSString *)string;

/**
 setDefaultSecondsModifierString

 @param string setDefaultSecondsModifierString
 */
+ (void)setDefaultSecondsModifierString:(NSString *)string;

/**
 setDefaultYearShorthand

 @param shorthand setDefaultYearShorthand
 */
+ (void)setDefaultYearShorthand:(BOOL)shorthand;

/**
 setDefaultMonthFillZero

 @param fillZero setDefaultMonthFillZero
 */
+ (void)setDefaultMonthFillZero:(BOOL)fillZero;

/**
 setDefaultDayFillZero

 @param fillZero setDefaultDayFillZero
 */
+ (void)setDefaultDayFillZero:(BOOL)fillZero;

/**
 setDefaultHourFillZero

 @param fillZero setDefaultHourFillZero
 */
+ (void)setDefaultHourFillZero:(BOOL)fillZero;

/**
 setDefaultMinutesFillZero

 @param fillZero setDefaultMinutesFillZero
 */
+ (void)setDefaultMinutesFillZero:(BOOL)fillZero;

/**
 setDefaultSecondsFillZero

 @param fillZero setDefaultSecondsFillZero
 */
+ (void)setDefaultSecondsFillZero:(BOOL)fillZero;

/**
 自定义pick

 @param pickerMode 类型
 @param date date
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param confirmBlock block
 @return pcik
 */
+ (instancetype)customDatePickWithConfirmForPickerMode:(BMDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

/**
 自定义pick

 @param pickerMode 类型
 @param date date
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param changeBlock block
 @return pcik
 */
+ (instancetype)customDatePickWithChangeForPickerMode:(BMDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock;

@end
