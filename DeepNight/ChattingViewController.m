//
//  ChattingViewController.m
//  DeepNight
//
//  Created by ai on 15/6/1.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "ChattingViewController.h"

@interface ChattingViewController ()
{
    BOOL _barVisible;
    CGAffineTransform _hideTransform;
    CGAffineTransform _hideTransform_middle;
}
@property (weak, nonatomic) IBOutlet UIImageView *inputbar;
@property (weak, nonatomic) IBOutlet UITextField *inputTxf;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTxfBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTxfLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTxfRightConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ChattingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _barVisible = NO;
    _hideTransform = CGAffineTransformMakeScale(0, 1);
    _hideTransform_middle = CGAffineTransformMakeScale(0.5, 1);
    CGAffineTransform transition = CGAffineTransformMakeTranslation(-_inputbar.bounds.size.width, 0);
    _hideTransform = CGAffineTransformConcat(_hideTransform, transition);
    _hideTransform_middle = CGAffineTransformConcat(_hideTransform_middle, CGAffineTransformMakeTranslation(-_inputbar.bounds.size.width / 2, 0));
    _inputbar.transform = _hideTransform;
    _inputbar.alpha = 0.0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyBoardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Actions

- (IBAction)showBar:(id)sender {
    if (_barVisible) {
        [UIView animateWithDuration:0.5
                              delay:0.0
             usingSpringWithDamping:0.8
              initialSpringVelocity:1.0
                            options:7
                         animations:^{
                             _inputbar.transform = _hideTransform_middle;
                             _inputbar.alpha = 0.0;
                             _inputTxf.alpha = 1.0;
                         } completion:nil];
    } else {
        [UIView animateWithDuration:0.5
                              delay:0.0
             usingSpringWithDamping:0.8
              initialSpringVelocity:1.0
                            options:7
                         animations:^{
                             _inputbar.transform = CGAffineTransformIdentity;
                             _inputbar.alpha = 1.0;
                             _inputTxf.alpha = 0.0;
                         } completion:nil];
    }
    _barVisible = !_barVisible;
}

- (void)handleKeyboardWillShow:(NSNotification *)aNotification {
    CGRect keyboardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat changes = (keyboardFrame.size.height - _inputTxfBottomConstraint.constant);
    _inputTxf.transform = CGAffineTransformMakeTranslation(0, - changes);
    [_scrollView setContentOffset:CGPointMake(0, changes) animated:YES];
    _inputTxfLeftConstraint.constant = 0;
}

- (void)handleKeyBoardWillHide:(NSNotification *)aNotification {
    _inputTxf.transform = CGAffineTransformIdentity;
    _inputTxfLeftConstraint.constant = 56;
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
@end
