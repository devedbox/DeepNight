//
//  CustomSegue.m
//  DeepNight
//
//  Created by ai on 15/6/1.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue
- (void)perform {
    if ([self.sourceViewController navigationController]) {
        [[self.sourceViewController navigationController] popViewControllerAnimated:YES];
    }
}
@end
