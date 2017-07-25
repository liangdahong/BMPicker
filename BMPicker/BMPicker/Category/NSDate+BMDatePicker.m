//
//  NSDate+BMDatePicker.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "NSDate+BMDatePicker.h"

@implementation NSDate (BMDatePicker)

- (NSInteger)bm_year   {
    return self.bm_dateComponents.year;
}

- (NSInteger)bm_month  {
    return self.bm_dateComponents.month;
}

- (NSInteger)bm_day    {
    return self.bm_dateComponents.day;
}

- (NSInteger)bm_hour   {
    return self.bm_dateComponents.hour;
}

- (NSInteger)bm_minute {
    return self.bm_dateComponents.minute;
}

- (NSInteger)bm_second {
    return self.bm_dateComponents.second;
}

- (NSDateComponents *)bm_dateComponents {
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar0 components:unitFlags fromDate:self];
    return comps;
}

+ (NSDate *)bm_dateWithYear:(NSInteger)year mon:(NSInteger)mon day:(NSInteger)day h:(NSInteger)h m:(NSInteger)m s:(NSInteger)s {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *str = [NSString stringWithFormat:@"%.4ld-%.2ld-%.2ld--%.2ld:%.2ld:%.2ld",year,mon,day,h,m,s];
    [dateFormatter setDateFormat:@"yyyy-MM-dd--HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    if (date) {
        return date;
    }
    return [NSDate date];
}

@end
