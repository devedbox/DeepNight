//
//  LoginViewController.h
//  DeepNight
//
//  Created by ai on 15/5/31.
//  Copyright (c) 2015年 ai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    @private
    NSString *_name;
}
/*
 name
 */
@property (copy, nonatomic) NSString *name;
/**
 account
 */
@property (copy, nonatomic) NSString *account;
@end
