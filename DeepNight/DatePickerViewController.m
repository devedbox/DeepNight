//
//  DatePickerViewController.m
//  DeepNight
//
//  Created by ai on 15/6/1.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;
@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataPicker.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
