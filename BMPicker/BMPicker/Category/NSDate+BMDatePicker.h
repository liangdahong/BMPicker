//
//  NSDate+BMDatePicker.h
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BMDatePicker)

@property (assign, nonatomic, readonly) NSInteger bm_year;
@property (assign, nonatomic, readonly) NSInteger bm_month;
@property (assign, nonatomic, readonly) NSInteger bm_day;
@property (assign, nonatomic, readonly) NSInteger bm_hour;
@property (assign, nonatomic, readonly) NSInteger bm_minute;
@property (assign, nonatomic, readonly) NSInteger bm_second;
@property (strong, nonatomic, readonly) NSDateComponents *bm_dateComponents;
+ (NSDate *)bm_dateWithYear:(NSInteger)year mon:(NSInteger)mon day:(NSInteger)day h:(NSInteger)h m:(NSInteger)m s:(NSInteger)s;

@end
