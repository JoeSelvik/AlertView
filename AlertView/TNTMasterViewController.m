//
//  TNTMasterViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/20/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTMasterViewController.h"
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
    
    // Get the root MasterVC instance to be the parent to the new AlertVC
    TNTMasterViewController *masterVC = (TNTMasterViewController *)[[self view] window].rootViewController;

    // Properly add childVC to parentVC
    [masterVC addChildViewController:alertVC];
    [masterVC.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:masterVC];
}



@end
