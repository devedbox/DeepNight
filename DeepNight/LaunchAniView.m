//
//  LaunchAniView.m
//  DeepNight
//
//  Created by ai on 15/5/31.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "LaunchAniView.h"

@interface LaunchAniView ()
@property (strong, nonatomic) UIImageView *backgroundImageView;
@end

@implementation LaunchAniView
#pragma mark - Initializer
- (instancetype)init {
    if (self = [super init]) {
        [self initializer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializer];
    }
    return self;
}

- (void)initializer {
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.imageView];
    CGRect rect = _imageView.frame;
    rect.origin.x = (self.bounds.size.width - rect.size.width) / 2;
    rect.origin.y = (self.bounds.size.height - rect.size.height) / 2;
    _imageView.frame = rect;
}

#pragma mark - Properties Getters
- (UIImageView *)backgroundImageView {
    if (_backgroundImageView) return _backgroundImageView;
    _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _backgroundImageView.image = [UIImage imageNamed:@"Launch"];
    return _backgroundImageView;
}

- (UIImageView *)imageView {
    if (_imageView) return _imageView;
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    _imageView.alpha = 0.0;
    return _imageView;
}

- (UILabel *)textLabel {
    if (_textLabel) return _textLabel;
    _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    _textLabel.text = @"总有一个人，陪你到深夜";
    [_textLabel sizeToFit];
    return _textLabel;
}
#pragma mark - Interface Methods
- (void)startAnimatingCompletion:(void(^)())completion {
    _imageView.transform = CGAffineTransformMakeTranslation(0, _imageView.bounds.size.height);
    [UIView animateWithDuration:1.5
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.0
                        options:7
                     animations:^{
                         _imageView.transform = CGAffineTransformIdentity;
                         _imageView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                               delay:0.0
                              usingSpringWithDamping:0.9
                               initialSpringVelocity:1.0
                                             options:7
                                          animations:^{
                                              _imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                                          } completion:^(BOOL finished) {
                                              if (finished && completion) {
                                                  completion ();
                                              }
                                          }];
                     }];
}

- (void)stopAnimating {
    [UIView animateWithDuration:0.5
                          delay:0.25
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.0
                        options:7
                     animations:^{
                         _imageView.transform = CGAffineTransformIdentity;
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         self.alpha = 1.0;
                     }];
}
@end
