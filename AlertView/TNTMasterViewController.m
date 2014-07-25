//
//  TNTMasterViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/20/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTMasterViewController.h"
#import "TNTNavigationController.h"

@interface TNTMasterViewController ()

@end

@implementation TNTMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)displayAlertViewWithMessage:(NSString *)msg
{
    // Get alertVC from the storyboard
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TNTAlertViewController *alertVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    
    // Set AlertView Frame
    TNTNavigationController *dummyNavigationController = [TNTNavigationController new];
    CGFloat xAlertFrame = 0;    // TODO - find programically?
    CGFloat yAlertFrame = dummyNavigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = dummyNavigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = dummyNavigationController.navigationBar.frame.size.height;
    CGRect frameForAlertView = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    alertVC.view.frame = frameForAlertView;
    alertVC.delegate = self;
    
    [alertVC setAlertMessage:msg];
    
    // Properly add childVC to parentVC
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
}

- (void)closeAlertView:(TNTAlertViewController *)alertVC
{
    [alertVC willMoveToParentViewController:nil];
    [alertVC.view removeFromSuperview];
    [alertVC removeFromParentViewController];
}

@end
