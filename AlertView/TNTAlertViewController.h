//
//  TNTAlertViewController.h
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TNTAlertViewController;

@protocol TNTAlertVCDelegate <NSObject>

- (void)closeAlertView:(TNTAlertViewController *)alertVC;

@end


@interface TNTAlertViewController : UIViewController

@property (weak, nonatomic) id<TNTAlertVCDelegate> delegate;

-(void)setAlertMessage:(NSString *)message;

@end
