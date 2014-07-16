//
//  TNTAlertViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"

@interface TNTAlertViewController ()

@property (nonatomic, weak) UIViewController *currentAlertMessageViewController;

@property (strong, nonatomic) IBOutlet UIView *alertBoxView;
@property (weak, nonatomic) IBOutlet UILabel *alertMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *alertCloseButton;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)setAlertMessage:(NSString *)message
{
    self.alertMessageLabel.text = message;
}

-(void)connectAlertVCCloseButtonWithSelf:(TNTAlertViewController *)instance
{
    self.currentAlertMessageViewController = instance;
    
    [_alertCloseButton addTarget:self
                          action:@selector(closeAlertMessageVC)
                forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)closeAlertMessageVC
{
    [self.currentAlertMessageViewController willMoveToParentViewController:nil];
    [self.currentAlertMessageViewController.view removeFromSuperview];
    [self.currentAlertMessageViewController removeFromParentViewController];

}




@end
