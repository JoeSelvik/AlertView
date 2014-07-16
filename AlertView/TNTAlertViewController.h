//
//  TNTAlertViewController.h
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TNTAlertViewController : UIViewController

+ (TNTAlertViewController *)sharedInstance;
-(void)createAlertVCWithMessage:(NSString *)message fromCurrentVC:(UIViewController *)currentVC;

-(void)connectAlertVCCloseButtonWithSelf:(TNTAlertViewController *)instance;
-(void)setAlertMessage:(NSString *)message;

@end
