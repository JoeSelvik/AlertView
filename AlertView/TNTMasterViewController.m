//
//  TNTMasterViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/20/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTMasterViewController.h"
#import "TNTNavigationController.h"
#import "TNTAlertViewController.h"

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
    
    TNTAlertViewController *alertVC = [TNTAlertViewController createAlertViewWithMessage:msg];
    
    // Set AlertView Frame
    TNTNavigationController *dummyNavigationController = [TNTNavigationController new];
    CGFloat xAlertFrame = 0;    // TODO - find programically?
    CGFloat yAlertFrame = dummyNavigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = dummyNavigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = dummyNavigationController.navigationBar.frame.size.height;
    CGRect frameForAlertView = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    alertVC.view.frame = frameForAlertView;
    

    // Properly add childVC to parentVC
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
}



@end
