//
//  TNTViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTViewController.h"

@interface TNTViewController ()

@property (assign, nonatomic) CGRect frameForAlertView;

@property (nonatomic, weak) UIViewController *currentAlertMessageViewController;

@end


@implementation TNTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // AlertView Size
    CGFloat xAlertFrame = 0;
    CGFloat yAlertFrame = self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = self.navigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = self.navigationController.navigationBar.frame.size.height;
    
    _frameForAlertView = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);

    // Add an initial contained viewController
    TNTAlertViewController *alertVC = [self alertVC];
    [alertVC setAlertMessage:@"View Did Load"];
    [alertVC connectAlertVCCloseButtonWithSelf:alertVC];
    
    // Contain the view controller
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
    
    // Keep track of the alertVC
    self.currentAlertMessageViewController = alertVC;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (TNTAlertViewController *)alertVC
{
    UIStoryboard *storyboard = self.storyboard;
    TNTAlertViewController *alertVC = [storyboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    alertVC.view.frame = self.frameForAlertView;
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [alertVC.view addGestureRecognizer:tap];
    
    return alertVC;
}

//- (void)tap:(UIGestureRecognizer *)gr
//{
//    if (gr.state == UIGestureRecognizerStateEnded)
//        [self transitionToNextViewController];
//}

//- (void)transitionToNextViewController
//{
////    TNTAlertViewController *alertVC = [self alertVC];
////    [alertVC setAlertMessage:@"You are number 666"];
//
////    // Containment
////    [self addChildViewController:alertVC];
////    [self.currentAlertMessageViewController willMoveToParentViewController:nil];
////
////    [alertVC didMoveToParentViewController:self];
////    [self.currentAlertMessageViewController removeFromParentViewController];
////    self.currentAlertMessageViewController = alertVC;
//
//    // Remove alertVC
//    [self.currentAlertMessageViewController willMoveToParentViewController:nil];
//    [self.currentAlertMessageViewController.view removeFromSuperview];
//    [self.currentAlertMessageViewController removeFromParentViewController];
//    
//}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.currentAlertMessageViewController.view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.currentAlertMessageViewController.view.bounds cornerRadius:8].CGPath;
}



@end
