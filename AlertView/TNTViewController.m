//
//  TNTViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTViewController.h"

@interface TNTViewController ()

@property float animationToggle;

@property (strong, nonatomic) UIView *boxView;
@property (strong, nonatomic) UIButton *closeButtonForPopupView;
@property (strong, nonatomic) UILabel *alertMessage;

@property (assign, nonatomic) CGRect frameRectForPopupViewShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewHide;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonHide;



@property (nonatomic, weak) UIViewController *currentChildViewController;


@end


@implementation TNTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _animationToggle = 1;
    
    // AlertView Size
    CGFloat xAlertFrame = 0;
    CGFloat yAlertFrame = self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = self.navigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = self.navigationController.navigationBar.frame.size.height;
    
    _frameRectForPopupViewShow = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    _frameRectForPopupViewHide = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, 0);

    // Add an initial contained viewController
    TNTAlertViewController *alertVC = [self alertVC];
    
    // Contain the view controller
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
    self.currentChildViewController = alertVC;
    
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
    alertVC.view.frame = self.frameRectForPopupViewShow;
    [alertVC setAlertMessage:@"Hello World"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [alertVC.view addGestureRecognizer:tap];
    
    return alertVC;
}

- (void)tap:(UIGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateEnded)
        [self transitionToNextViewController];
}

- (void)transitionToNextViewController
{
    TNTAlertViewController *alertVC = [self alertVC];

    // Containment
    [self addChildViewController:alertVC];
    [self.currentChildViewController willMoveToParentViewController:nil];

    [alertVC didMoveToParentViewController:self];
    [self.currentChildViewController removeFromParentViewController];
    self.currentChildViewController = alertVC;

}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.currentChildViewController.view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.currentChildViewController.view.bounds cornerRadius:8].CGPath;
}




//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if (self.animationToggle) {
//       
//        TNTAlertViewController *alertVC = [TNTAlertViewController alertVC];
//        
//    } else {
//        [self closePopupView];
//    }
//}


@end
