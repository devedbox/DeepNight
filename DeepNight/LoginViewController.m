//
//  LoginViewController.m
//  DeepNight
//
//  Created by ai on 15/5/31.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "LoginViewController.h"

@interface NavigationImageView : UIView

@end

@implementation NavigationImageView
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    self.backgroundColor = [UIColor clearColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    //Gradient colours
    size_t gradLocationsNum = 2;
    CGFloat gradLocations[2] = {0.0f, 1.0f};
    CGFloat gradColors[8] = {0.027,0.024,0.035,1.000,0.196,0.200,0.227,0.950};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradColors, gradLocations, gradLocationsNum);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(self.bounds.size.width / 2, 0), CGPointMake(self.bounds.size.width / 2, self.bounds.size.height), kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
}

@end

@implementation LoginViewController

- (void)loadView {
    [super loadView];
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            if ([[view subviews] count]) {
                for (UIView *image in view.subviews) {
                    if ([image isKindOfClass:[UIImageView class]]) {
                        image.hidden = YES;
                    }
                }
            }
        }
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    UIImageView *overlayView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, self.navigationController.navigationBar.bounds.size.width, 64)];
    overlayView.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar insertSubview:overlayView atIndex:0];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, self.navigationController.navigationBar.bounds.size.width, 30)];
    back.image = [UIImage imageNamed:@"login_bgn"];
    back.contentMode = UIViewContentModeScaleAspectFill;
    back.clipsToBounds = YES;
    [self.navigationController.navigationBar addSubview:back];
    [self.navigationController setNavigationBarHidden:YES
                                             animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
