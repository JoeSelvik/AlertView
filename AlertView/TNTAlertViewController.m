//
//  TNTAlertViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"


@interface TNTAlertViewController ()

@property (assign, nonatomic) CGRect frameForAlertView;

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

+ (TNTAlertViewController *)sharedInstance
{
    static TNTAlertViewController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TNTAlertViewController alloc] init];
    });
    
    return _sharedInstance;
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


// Is it acceptable to pass in the current VC like this?
-(void)createAlertVCWithMessage:(NSString *)message fromCurrentVC:(UIViewController *)currentVC
{
    UINavigationController *dummyNavigationController = [UINavigationController new]; // Or whichever custom nav bar we use
    
    // AlertView Size
    CGFloat xAlertFrame = 0;
    CGFloat yAlertFrame = dummyNavigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = dummyNavigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = dummyNavigationController.navigationBar.frame.size.height;
    self.frameForAlertView = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    
    //UIStoryboard *storyboard = currentVC.storyboard;
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TNTAlertViewController *alertVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    alertVC.view.frame = self.frameForAlertView;
    
    [alertVC setAlertMessage:message];
    [alertVC connectAlertVCCloseButtonWithSelf:alertVC];
    
    // Properly add childVC to parentVC
    [currentVC addChildViewController:alertVC];
    [currentVC.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:currentVC];
    
}

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
