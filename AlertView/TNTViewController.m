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

- (IBAction)newAlertVCButton:(id)sender;

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

//    [self createAlertVCWithMessage:@"From viewDidLoad"];
    
    TNTAlertViewController *alertVCController = [TNTAlertViewController sharedInstance];
    [alertVCController createAlertVCWithMessage:@"Hello World" fromCurrentVC:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (TNTAlertViewController *)createAlertVCWithMessage:(NSString *)message
{
    UIStoryboard *storyboard = self.storyboard;
    TNTAlertViewController *alertVC = [storyboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    alertVC.view.frame = self.frameForAlertView;
    
    [alertVC setAlertMessage:message];
    [alertVC connectAlertVCCloseButtonWithSelf:alertVC];
    
    // Properly add childVC to parentVC
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
    
    return alertVC;
}



// For testing!!
-(void)newAlertVCButton:(id)sender
{
    [self createAlertVCWithMessage:@"From button"];
}


@end
