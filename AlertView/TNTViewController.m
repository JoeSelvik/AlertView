//
//  TNTViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTMasterViewController.h"
#import "TNTViewController.h"


@interface TNTViewController ()

// Button is for testing only
- (IBAction)newAlertVCButton:(id)sender;

@end


@implementation TNTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// For testing
-(void)newAlertVCButton:(id)sender
{
    TNTMasterViewController *masterVC = (TNTMasterViewController *)[[self view] window].rootViewController;
    [masterVC displayAlertViewWithMessage:@"I did it"];
}


@end
