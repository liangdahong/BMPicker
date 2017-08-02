//
//  BMPicker.h
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved. 
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 自定义的时间选择控件类型
 
 - BMDatePickerViewModeYear: 年
 - BMDatePickerViewModeYearMonth: 年月
 - BMDatePickerViewModeYearMonthDay: 年月日
 - BMDatePickerViewModeYearMonthDayHour: 年月日时
 - BMDatePickerViewModeYearMonthDayHourMinute: 年月日时分
 - BMDatePickerViewModeYearMonthDayHourMinuteSecond: 年月日时分秒
 */
typedef NS_ENUM(NSInteger, BMDatePickerMode) {
    BMDatePickerViewModeYear = 0,
    BMDatePickerViewModeYearMonth,
    BMDatePickerViewModeYearMonthDay,
    BMDatePickerViewModeYearMonthDayHour,
    BMDatePickerViewModeYearMonthDayHourMinute,
    BMDatePickerViewModeYearMonthDayHourMinuteSecond,
};

/**
 确定按钮点击时的block

 @param date 选择的时间
 @return 是否内部自动隐藏（如果返回YES:内部自动隐藏视图 NO:一般是选择的时间不满足条件,如果想隐藏，需要外面调用 dismiss）
 */
typedef BOOL(^BMDatePickerConfirmBlock)(NSDate *date);

/**
 实时交付block

 @param date 选择的时间
 */
typedef void(^BMDatePickerChangeBlock) (NSDate *date);

/**
 BMPicker
 */
@interface BMPicker : NSObject

#pragma mark - 配置 配置目前只对自适应类型有效

+ (void)setDefaultTextFont:(UIFont *)textfont;                                ///< 配置字体 默认：[UIFont systemFontOfSize:15]
+ (void)setDefaultTextColor:(UIColor *)textColor;;                            ///< 配置字体颜色 默认：[UIColor blackColor];
+ (void)setDefaultTextAlignment:(NSTextAlignment)textAlignment;;              ///< 配置字体对对齐方式 默认：NSTextAlignmentCenter
+ (void)setDefaultAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;; ///< 是否由宽度自适应字体 默认：YES
+ (void)setDefaultMinimumScaleFactor:(CGFloat)minimumScaleFactor;;            ///< 最小字号 默认：0.0f

+ (void)setDefaultYearModifierString   :(NSString *)string;; ///< 配置现 默认：@" 年"
+ (void)setDefaultMonthModifierString  :(NSString *)string;; ///< 配置字体 默认：@" 月"
+ (void)setDefaultDayModifierString    :(NSString *)string;; ///< 配置字体 默认：@" 日"
+ (void)setDefaultHourModifierString   :(NSString *)string;; ///< 配置字体 默认：@" 时"
+ (void)setDefaultMinutesModifierString:(NSString *)string;  ///< 配置字体 默认：@" 分"
+ (void)setDefaultSecondsModifierString:(NSString *)string;  ///< 配置字体 默认：@" 秒"

+ (void)setDefaultYearShorthand :(BOOL)shorthand; ///< 年是否不显示前两位 2017->17  默认：NO
+ (void)setDefaultMonthFillZero :(BOOL)fillZero;  ///<  月是否补0  01 默认：NO
+ (void)setDefaultDayFillZero   :(BOOL)fillZero;  ///<  日是否补0  03 默认：NO
+ (void)setDefaultHourFillZero  :(BOOL)fillZero;  ///<  时是否补0  06 默认：NO
+ (void)setDefaultMinutesFillZero:(BOOL)fillZero; ///< 分是否补0  09 默认：NO
+ (void)setDefaultSecondsFillZero:(BOOL)fillZero; ///< 秒是否补0  03 默认：YES

#pragma mark - 方法

#pragma mark - 时间选择控件

/**
 隐藏BMPicker
 */
+ (void)dismiss;

/**
 弹出有确定按钮的系统DatePick

 @param pickerMode 模式
 @param date 当前时间（nil 表示当前时间）
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param confirmBlock 点击block
 */
+ (void)showSystemDatePickWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                              date:(NSDate *)date
                                       minimumDate:(NSDate *)minimumDate
                                       maximumDate:(NSDate *)maximumDate
                                      confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

/**
 弹出无确定按钮的系统DatePick
 
 @param pickerMode 模式
 @param date 当前时间（nil 表示当前时间）
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param changeBlock 选中的时间变化block
 */
+ (void)showSystemDatePickWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                             date:(NSDate *)date
                                      minimumDate:(NSDate *)minimumDate
                                      maximumDate:(NSDate *)maximumDate
                                      changeBlock:(BMDatePickerChangeBlock)changeBlock;

/**
 弹出有确定按钮的自定义的DatePick
 
 @param pickerMode 模式
 @param date 当前时间（nil 表示当前时间）
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param confirmBlock 点击block
 */
+ (void)showCustomDatePickWithConfirmForPickerMode:(BMDatePickerMode)pickerMode
                                              date:(NSDate *)date
                                       minimumDate:(NSDate *)minimumDate
                                       maximumDate:(NSDate *)maximumDate
                                      confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

/**
 弹出无确定按钮的自定义DatePick
 
 @param pickerMode 模式
 @param date 当前时间（nil 表示当前时间）
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param changeBlock 选中的时间变化block
 */
+ (void)showCustomDatePickWithChangeForPickerMode:(BMDatePickerMode)pickerMode
                                             date:(NSDate *)date
                                      minimumDate:(NSDate *)minimumDate
                                      maximumDate:(NSDate *)maximumDate
                                      changeBlock:(BMDatePickerChangeBlock)changeBlock;

#pragma mark - 秒 分秒 时分秒 日时分秒 月日时分秒
#pragma mark - 非时间选择器

@end
