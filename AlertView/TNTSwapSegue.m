//
//  TNTSwapSegue.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTSwapSegue.h"

@implementation TNTSwapSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *newViewController = self.destinationViewController;
    
    if (self.replaceViewController) {
        [self.replaceViewController willMoveToParentViewController:nil];
        [sourceViewController addChildViewController:newViewController];
        
        [sourceViewController transitionFromViewController:self.replaceViewController toViewController:newViewController
                                                  duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve
                                                animations:nil completion:^(BOOL finished) {
                                                    [self.replaceViewController removeFromParentViewController];
                                                    [newViewController didMoveToParentViewController:sourceViewController];
                                                }];
    } else {
        [sourceViewController addChildViewController:newViewController];
        newViewController.view.frame = self.containerView.bounds;
        [self.containerView addSubview:newViewController.view];
        [newViewController didMoveToParentViewController:sourceViewController];
    }
}

@end
