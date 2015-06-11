//
//  SexViewController.m
//  DeepNight
//
//  Created by ai on 15/6/1.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "SexViewController.h"

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions
- (IBAction)hideKeyboard:(UITapGestureRecognizer *)sender {
    if ([_textField isFirstResponder]) {
        [_textField resignFirstResponder];
    }
}
@end
