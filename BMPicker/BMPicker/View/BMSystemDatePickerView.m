//
//  BMSystemDatePickerView.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/5.
//  Copyright © 2017年  https://github.com/asiosldh/BMPicker All rights reserved.
//

#import "BMSystemDatePickerView.h"
#import <pop/POP.h>
#import "BMCustomDatePickerView.h"

@interface BMSystemDatePickerView ()

@property (copy, nonatomic) BMDatePickerConfirmBlock datePickerConfirmBlock;
@property (copy, nonatomic) BMDatePickerChangeBlock datePickerChangeBlock;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *whitViewHeightCons;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickView;
@property (weak, nonatomic) IBOutlet UIView *whitView;

@end

@implementation BMSystemDatePickerView

+ (instancetype)systemDatePickWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                                  date:(NSDate *)date
                                           minimumDate:(NSDate *)minimumDate
                                           maximumDate:(NSDate *)maximumDate
                                          confirmBlock:(BMDatePickerConfirmBlock)confirmBlock {
    BMSystemDatePickerView *systemDatePickView = [[[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    systemDatePickView.autoresizingMask = UIViewAutoresizingNone;
    systemDatePickView.datePickView.datePickerMode = pickerMode;
    systemDatePickView.datePickView.date = date ? date : [NSDate date];
    systemDatePickView.datePickView.minimumDate = minimumDate;
    systemDatePickView.datePickView.maximumDate = maximumDate;
    systemDatePickView.datePickerConfirmBlock = confirmBlock;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [systemDatePickView layoutIfNeeded];
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        springAnimation.toValue             = @(__sc_h__ - (266*0.5));
        springAnimation.springBounciness    = 6;
        [systemDatePickView.whitView.layer pop_addAnimation:springAnimation forKey:nil];
    });
    return systemDatePickView;
}

+ (instancetype)systemDatePickWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                                 date:(NSDate *)date
                                          minimumDate:(NSDate *)minimumDate
                                          maximumDate:(NSDate *)maximumDate
                                          changeBlock:(BMDatePickerChangeBlock)changeBlock {
    BMSystemDatePickerView *systemDatePickView = [[[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    systemDatePickView.autoresizingMask = UIViewAutoresizingNone;
    systemDatePickView.whitViewHeightCons.constant = 226;
    systemDatePickView.datePickView.datePickerMode = pickerMode;
    systemDatePickView.datePickView.date = date ? date : [NSDate date];
    systemDatePickView.datePickView.minimumDate = minimumDate;
    systemDatePickView.datePickView.maximumDate = maximumDate;
    systemDatePickView.datePickerChangeBlock = changeBlock;
    [systemDatePickView.datePickView addTarget:systemDatePickView action:@selector(changedClick:) forControlEvents:UIControlEventValueChanged];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [systemDatePickView layoutIfNeeded];
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        springAnimation.toValue             = @(__sc_h__ - (226*0.5));
        springAnimation.springBounciness    = 6;
        [systemDatePickView.whitView.layer pop_addAnimation:springAnimation forKey:nil];
    });
    return systemDatePickView;
}

- (IBAction)systemDatePickViewClick:(UITapGestureRecognizer *)sender {
    [self removeFromSuperview];
}

- (IBAction)whitBackgroundViewClick:(UITapGestureRecognizer *)sender {
}

- (IBAction)cancelButtonClick {
    [self removeFromSuperview];
}

- (IBAction)confirmButtonClick {
    if (self.datePickerConfirmBlock) {
        if (self.datePickerConfirmBlock(self.datePickView.date)) {
            [self removeFromSuperview];
        }
    }
}

- (void)changedClick:(UIDatePicker *)sender {
    if (self.datePickerChangeBlock) {
        self.datePickerChangeBlock(sender.date);
    }
}

@end
