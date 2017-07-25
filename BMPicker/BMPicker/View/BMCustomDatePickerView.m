//
//  BMCustomDatePickerView.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMCustomDatePickerView.h"
#import "NSDate+BMDatePicker.h"
#import <pop/POP.h>

@interface BMCustomDatePickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *whitViewHeightCons;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (copy, nonatomic) BMDatePickerConfirmBlock datePickConfirmBlock;
@property (copy, nonatomic) BMDatePickerChangeBlock datePickChangeBlock;
@property (strong, nonatomic) NSDate *minimumPickDate;
@property (strong, nonatomic) NSDate *maximumPickDate;
@property (strong, nonatomic) NSDate *pickDate;
@property (assign, nonatomic) BMDatePickerMode pickerMode;
@property (weak, nonatomic) IBOutlet UIView *whitView;

@end

static UIFont *textFont;
static UIColor *textColor;
static NSTextAlignment textAlignment;
static BOOL adjustsFontSizeToFitWidth;
static CGFloat minimumScaleFactor;
static NSString *yearModifierString;
static NSString *monthModifierString;
static NSString *dayModifierString;
static NSString *hourModifierString;
static NSString *minutesModifierString;
static NSString *secondsModifierString;

static BOOL yearShorthand;

static BOOL monthFillZero;
static BOOL dayFillZero;
static BOOL hourFillZero;
static BOOL minutesFillZero;
static BOOL secondsFillZero;

@implementation BMCustomDatePickerView

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        textFont = [UIFont systemFontOfSize:15];
        textColor = [UIColor blackColor];
        textAlignment = NSTextAlignmentCenter;
        adjustsFontSizeToFitWidth = YES;
        minimumScaleFactor = 0;
        yearModifierString   = @" 年";
        monthModifierString  = @" 月";
        dayModifierString    = @" 日";
        hourModifierString   = @" 时";
        minutesModifierString = @" 分";
        secondsModifierString = @" 秒";
        yearShorthand = NO;
        monthFillZero = NO;
        dayFillZero = NO;
        hourFillZero = NO;
        minutesFillZero = NO;
        secondsFillZero = YES;
    });
}

+ (void)setDefaultTextFont:(UIFont *)font {
    textFont = font;
}

+ (void)setDefaultTextColor:(UIColor *)color {
    textColor = color;
}

+ (void)setDefaultTextAlignment:(NSTextAlignment )alignment {
    textAlignment = alignment;
}

+ (void)setDefaultAdjustsFontSizeToFitWidth:(BOOL )fontSizeToFitWidth {
    adjustsFontSizeToFitWidth = fontSizeToFitWidth;
}

+ (void)setDefaultMinimumScaleFactor:(CGFloat )scaleFactor {
    minimumScaleFactor = scaleFactor;
}

+ (void)setDefaultYearModifierString:(NSString *)string {
    yearModifierString = string;
}

+ (void)setDefaultMonthModifierString:(NSString *)string {
    monthModifierString = string;
}

+ (void)setDefaultDayModifierString:(NSString *)string {
    dayModifierString = string;
}

+ (void)setDefaultHourModifierString:(NSString *)string {
    hourModifierString = string;
}

+ (void)setDefaultMinutesModifierString:(NSString *)string {
    minutesModifierString = string;
}

+ (void)setDefaultSecondsModifierString:(NSString *)string {
    secondsModifierString = string;
}

+ (void)setDefaultYearShorthand:(BOOL)shorthand {
    yearShorthand = shorthand;
}

+ (void)setDefaultMonthFillZero:(BOOL)fillZero {
    monthFillZero = fillZero;
}

+ (void)setDefaultDayFillZero:(BOOL)fillZero {
    dayFillZero = fillZero;
}

+ (void)setDefaultHourFillZero:(BOOL)fillZero {
    hourFillZero = fillZero;
}

+ (void)setDefaultMinutesFillZero:(BOOL)fillZero {
    minutesFillZero = fillZero;
}

+ (void)setDefaultSecondsFillZero:(BOOL)fillZero {
    secondsFillZero = fillZero;
}

+ (instancetype)customDatePickWithConfirmForPickerMode:(BMDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock {
    BMCustomDatePickerView *customDatePickView = [[[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    customDatePickView.autoresizingMask = UIViewAutoresizingNone;
    customDatePickView.pickerMode = pickerMode;
    customDatePickView.pickDate = date ? date : [NSDate date];
    customDatePickView.minimumPickDate = minimumDate;
    customDatePickView.maximumPickDate = maximumDate;
    customDatePickView.datePickConfirmBlock = confirmBlock;
    customDatePickView.pickView.showsSelectionIndicator = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [customDatePickView layoutIfNeeded];
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        springAnimation.toValue             = @(__sc_h__ - (266*0.5));
        springAnimation.springBounciness    = 6;
        [customDatePickView.whitView.layer pop_addAnimation:springAnimation forKey:nil];
    });
    return customDatePickView;
}

+ (instancetype)customDatePickWithChangeForPickerMode:(BMDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock {
    BMCustomDatePickerView *customDatePickView = [[[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    customDatePickView.autoresizingMask = UIViewAutoresizingNone;
    customDatePickView.whitViewHeightCons.constant = 226;
    customDatePickView.pickerMode = pickerMode;
    customDatePickView.pickDate = date ? date : [NSDate date];
    customDatePickView.minimumPickDate = minimumDate;
    customDatePickView.maximumPickDate = maximumDate;
    customDatePickView.datePickChangeBlock = changeBlock;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [customDatePickView layoutIfNeeded];
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        springAnimation.toValue             = @(__sc_h__ - (226*0.5));
        springAnimation.springBounciness    = 6;
        [customDatePickView.whitView.layer pop_addAnimation:springAnimation forKey:nil];
    });
    return customDatePickView;
}

- (IBAction)customDatePickViewClick:(UITapGestureRecognizer *)sender {
    [self removeFromSuperview];
}

- (IBAction)whitBackgroundViewClick:(UITapGestureRecognizer *)sender {
}

- (IBAction)cancelButtonClick {
    [self removeFromSuperview];
}

- (IBAction)confirmButtonClick {
    if (self.datePickConfirmBlock) {
        if (self.datePickConfirmBlock([self changeButtonClick])) {
            [self removeFromSuperview];
        }
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    switch (self.pickerMode) {
        case BMDatePickerViewModeYear:
            return 1;
            break;
        case BMDatePickerViewModeYearMonth:
            return 2;
            break;
        case BMDatePickerViewModeYearMonthDay:
            return 3;
            break;
        case BMDatePickerViewModeYearMonthDayHour:
            return 4;
            break;
        case BMDatePickerViewModeYearMonthDayHourMinute:
            return 5;
            break;
        case BMDatePickerViewModeYearMonthDayHourMinuteSecond:
            return 6;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return 2100 - 2010;
            break;
        case 1:
            return 12;
            break;
        case 2:
        {
            NSInteger year = [pickerView selectedRowInComponent:0];
            NSInteger m = [pickerView selectedRowInComponent:1];
            if (m == 1) {
                return ((year%4==0)&&(year%100!=0))||(year%400==0) ? 29 : 28;
                break;
            }else if (   m ==  1-1
                      || m ==  3-1
                      || m ==  5-1
                      || m ==  7-1
                      || m ==  8-1
                      || m == 10-1
                      || m == 12-1) {
                return 31; // 日
            }
        }
            return 30; // 日
            break;
        case 3:
            return 24;
            break;
        case 4:
            return 60;
            break;
        case 5:
            return 60;
            break;
        default:
            break;
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UILabel *)label {
    NSInteger r = row;
    if (component  < 3) {
        r += 1;
    }

    NSMutableString *string = [NSMutableString stringWithFormat:@"%ld",r];
    if (component == 0) {
        string = [NSMutableString stringWithFormat:@"%ld",r + __start_year__];
    }
    
    if (component > 2) {
        string = [NSMutableString stringWithFormat:@"%ld",r];
    }

    switch (component) {
        case 0:
            if (yearShorthand) {
                string = [[string substringFromIndex:2] mutableCopy];
            }
            break;
        case 1:
            if (monthFillZero) {
                string = [NSMutableString stringWithFormat:@"%.2ld",r];
            }
            break;
        case 2:
            if (dayFillZero) {
                string = [NSMutableString stringWithFormat:@"%.2ld",r];
            }
            break;
        case 3:
            if (hourFillZero) {
                string = [NSMutableString stringWithFormat:@"%.2ld",r];
            }
            break;
        case 4:
            if (minutesFillZero) {
                string = [NSMutableString stringWithFormat:@"%.2ld",r];
            }
            break;
        case 5:
            if (secondsFillZero) {
                string = [NSMutableString stringWithFormat:@"%.2ld",r];
            }
            break;
        default:
            break;
    }
    
    CGFloat w = (self.pickerMode+1)*1.0;

    if (!label) {
        label    = [UILabel new];
    }
    label.frame = CGRectMake(component*(__sc_w__/w), 0,__sc_w__/w, 30);
    
    label.font       = textFont;
    label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    label.textAlignment = textAlignment;
    label.textColor = textColor;
    label.minimumScaleFactor = minimumScaleFactor;
    switch (component) {
        case 0:
            [string appendString:yearModifierString];
            break;
        case 1:
            [string appendString:monthModifierString];
            break;
        case 2:
            [string appendString:dayModifierString];
            break;
        case 3:
            [string appendString:hourModifierString];
            break;
        case 4:
            [string appendString:minutesModifierString];
            break;
        case 5:
            [string appendString:secondsModifierString];
            break;
        default:
            break;
    }
    label.text          = string;
    return label;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // if 只有年 或者 年月 就不需要对 天数做特殊处理
    if (self.pickerMode == BMDatePickerViewModeYear || self.pickerMode == BMDatePickerViewModeYearMonth) {
        if ([self getDateReturn]) {
            if (self.datePickChangeBlock) {
                self.datePickChangeBlock([self changeButtonClick]);
            }
        }
        return;
    }
    if ((component == 1)
        || (component == 0
            && [pickerView selectedRowInComponent:1] == 1)) {
            [pickerView reloadComponent:2];
        }
    if ([self getDateReturn]) {
        if (self.datePickChangeBlock) {
            self.datePickChangeBlock([self changeButtonClick]);
        }
    }
}

- (void)setPickDate:(NSDate *)pickDate {
    pickDate = pickDate ? pickDate : [NSDate date];
    _pickDate = pickDate;
    NSInteger year = pickDate.bm_year - __start_year__ < 0 ? 0 : pickDate.bm_year - __start_year__ - 1;
    
    switch (self.pickerMode) {
        case 0:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
        }
            break;
        case 1:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
            [self.pickView selectRow:pickDate.bm_month-1 inComponent:1 animated:YES];
        }
            break;
        case 2:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
            [self.pickView selectRow:pickDate.bm_month-1 inComponent:1 animated:YES];
            [self.pickView selectRow:pickDate.bm_day-1   inComponent:2 animated:YES];
        }
            break;
        case 3:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
            [self.pickView selectRow:pickDate.bm_month-1 inComponent:1 animated:YES];
            [self.pickView selectRow:pickDate.bm_day-1   inComponent:2 animated:YES];
            [self.pickView selectRow:pickDate.bm_hour    inComponent:3 animated:YES];
        }
            break;
        case 4:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
            [self.pickView selectRow:pickDate.bm_month-1 inComponent:1 animated:YES];
            [self.pickView selectRow:pickDate.bm_day-1   inComponent:2 animated:YES];
            [self.pickView selectRow:pickDate.bm_hour    inComponent:3 animated:YES];
            [self.pickView selectRow:pickDate.bm_minute  inComponent:4 animated:YES];
        }
            break;
        case 5:
        {
            [self.pickView selectRow:year             inComponent:0 animated:YES];
            [self.pickView selectRow:pickDate.bm_month-1 inComponent:1 animated:YES];
            [self.pickView selectRow:pickDate.bm_day-1   inComponent:2 animated:YES];
            [self.pickView selectRow:pickDate.bm_hour    inComponent:3 animated:YES];
            [self.pickView selectRow:pickDate.bm_minute  inComponent:4 animated:YES];
            [self.pickView selectRow:pickDate.bm_second  inComponent:5 animated:YES];
        }
            break;
        default:
            break;
    }
}

- (BOOL)getDateReturn {
    NSDate *date = [self changeButtonClick];
    if (self.minimumPickDate && [date compare:self.minimumPickDate] == NSOrderedAscending) {
        self.pickDate = self.minimumPickDate;
        if (self.datePickChangeBlock) {
            self.datePickChangeBlock(self.minimumPickDate);
        }
        return NO;
    }
    if (self.maximumPickDate && [date compare:self.maximumPickDate] == NSOrderedDescending) {
        self.pickDate = self.maximumPickDate;
        if (self.datePickChangeBlock) {
            self.datePickChangeBlock(self.minimumPickDate);
        }
        return NO;
    }
    return YES;
}

- (NSDate *)changeButtonClick {
    NSInteger year = 1;
    NSInteger mon  = 1;
    NSInteger day  = 1;
    NSInteger h    = 0;
    NSInteger m    = 0;
    NSInteger s    = 0;
    switch (self.pickerMode) {
        case BMDatePickerViewModeYearMonthDayHourMinuteSecond:
            s =  [_pickView selectedRowInComponent:5];
        case BMDatePickerViewModeYearMonthDayHourMinute:
            m =  [_pickView selectedRowInComponent:4];
        case BMDatePickerViewModeYearMonthDayHour:
            h =  [_pickView selectedRowInComponent:3];
        case BMDatePickerViewModeYearMonthDay:
            day  = [_pickView selectedRowInComponent:2] + 1;
        case BMDatePickerViewModeYearMonth:
            mon  = [_pickView selectedRowInComponent:1] + 1;
        case BMDatePickerViewModeYear:
            year = [_pickView selectedRowInComponent:0] + __start_year__ + 1;
        default:
            break;
    }
    return [NSDate bm_dateWithYear:year mon:mon day:day h:h m:m s:s];
}

@end
