//
//  TNTSwapSegue.h
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TNTSwapSegue : UIStoryboardSegue

@property (weak, nonatomic) UIViewController *replaceViewController;
@property (weak, nonatomic) UIView *containerView;

@end
