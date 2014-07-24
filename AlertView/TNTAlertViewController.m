//
//  TNTAlertViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"
#import "TNTMasterViewController.h"
#import "TNTNavigationController.h"

@interface TNTAlertViewController ()

@property (nonatomic, weak) UIViewController *currentAlertMessageViewController;

@property (strong, nonatomic) IBOutlet UIView *alertBoxView;        // Crashes if this is deleted
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


+ (TNTAlertViewController *)createAlertViewWithMessage:(NSString *)msg
{
    TNTNavigationController *dummyNavigationController = [TNTNavigationController new];
    
    // Set AlertView Frame
    CGFloat xAlertFrame = 0;    // TODO - find programically?
    CGFloat yAlertFrame = dummyNavigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = dummyNavigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = dummyNavigationController.navigationBar.frame.size.height;
    CGRect frameForAlertView = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    
    // Create the AlertVC from the storyboard
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TNTAlertViewController *alertVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    
    // Configure the AlertVC
    alertVC.view.frame = frameForAlertView;
    [alertVC setAlertMessage:msg];
    [alertVC connectAlertVCCloseButtonWithSelf:alertVC];
    
    return alertVC;
}

#pragma mark - Helper methods

-(void)setAlertMessage:(NSString *)message
{
    self.alertMessageLabel.text = message;
}


// TODO: This feels hacky. Improve by adding these two methods together?
-(void)connectAlertVCCloseButtonWithSelf:(TNTAlertViewController *)instance
{
    self.currentAlertMessageViewController = instance;
    
    [self.alertCloseButton addTarget:self
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
