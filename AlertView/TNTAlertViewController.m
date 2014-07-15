//
//  TNTAlertViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAlertViewController.h"

@interface TNTAlertViewController ()

@property (assign, nonatomic) CGRect boxViewFrameSize;

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
    
    CGFloat xAlertFrame = 0;
    CGFloat yAlertFrame = self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = self.navigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = self.navigationController.navigationBar.frame.size.height;
    
    _boxViewFrameSize = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    

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


@end
