//
//  TNTNavigationController.m
//  USafe
//
//  Created by Taylor Trimble on 1/21/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTAlertViewController.h"
#import "TNTNavigationController.h"

@interface TNTNavigationController ()

- (void)configure;

@end


@implementation TNTNavigationController

- (void)configure
{
    self.navigationBar.tintColor = [UIColor redColor];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
