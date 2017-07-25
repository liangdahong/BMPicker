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

+ (instancetype)systemDatePickWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock;

+ (instancetype)systemDatePickWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock;
@end
