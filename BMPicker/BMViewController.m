//
//  BMViewController.m
//  BMPicker
//
//  Created by __liangdahong on 2017/6/15.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "BMViewController.h"

@implementation BMViewController

- (IBAction)test:(id)sender {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"BMExample" bundle:nil] instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
