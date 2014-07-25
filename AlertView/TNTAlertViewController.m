//
//  TNTAlertViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"
#import "TNTNavigationController.h"

@interface TNTAlertViewController ()

@property (strong, nonatomic) IBOutlet UIView *alertBoxView;        // TODO - Crashes if this is deleted
@property (weak, nonatomic) IBOutlet UILabel *alertMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *alertCloseButton;

- (IBAction)closeAlertView:(id)sender;

@end


@implementation TNTAlertViewController

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


#pragma mark - Helper methods

-(void)setAlertMessage:(NSString *)message
{
    self.alertMessageLabel.text = message;
}


- (IBAction)closeAlertView:(id)sender
{
    [self.delegate closeAlertView:self];
}

@end
