//
//  TNTNavigationController.m
//  AlertView
//
//  Created by Joe Selvik on 7/20/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"
#import "TNTNavigationController.h"


@interface TNTNavigationController ()

@end


@implementation TNTNavigationController

- (void)configure
{
    // Make it look how we want
    self.navigationBar.tintColor = [UIColor colorWithRed:122.0/255.0 green:17.0/255.0 blue:27.0/255.0 alpha:1.0];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self configure];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configure];
    
//    TNTAlertViewController *alertVCController = [TNTAlertViewController sharedInstance];
//    [alertVCController createAlertVCWithMessage:@"Alert from TNTNavController" fromCurrentVC:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createAlertVCWithMessage:(NSString *)msg
{
    TNTAlertViewController *alertVCController = [TNTAlertViewController sharedInstance];
    [alertVCController createAlertVCWithMessage:msg fromCurrentVC:self];

}


//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    
//}

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    UIViewController *nextVC = [self popViewControllerAnimated:YES];
//    
//    return nextVC;
//}

@end

