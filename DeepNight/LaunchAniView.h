//
//  LaunchAniView.h
//  DeepNight
//
//  Created by ai on 15/5/31.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchAniView : UIView
/**
 image view
 */
@property (strong, nonatomic) UIImageView *imageView;
/**
 label
 */
@property (strong, nonatomic) UILabel *textLabel;
/**
 animate
 */
- (void)startAnimatingCompletion:(void(^)())completion;
/**
 stop animating
 */
- (void)stopAnimating;
@end
