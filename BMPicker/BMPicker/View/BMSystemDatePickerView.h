//
//  BMSystemDatePickerView.h
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMPicker.h"

@interface BMSystemDatePickerView : UIView

/**
 系统pick
 
 @param pickerMode 类型
 @param date date
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param confirmBlock block
 @return pick
 */
+ (instancetype)systemDatePickWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

/**
 系统pick

 @param pickerMode 类型
 @param date date
 @param minimumDate 最小时间
 @param maximumDate 最大时间
 @param changeBlock block
 @return pick
 */
+ (instancetype)systemDatePickWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock;
@end
