//
//  TNTMasterViewController.h
//  AlertView
//
//  Created by Joe Selvik on 7/20/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNTAlertViewController.h"


@interface TNTMasterViewController : UIViewController <TNTAlertVCDelegate>

-(void)displayAlertViewWithMessage:(NSString *)msg;

@end
