//
//  TNTViewController.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTViewController.h"

@interface TNTViewController ()

@property float animationToggle;

@property (strong, nonatomic) UIView *boxView;
@property (strong, nonatomic) UIButton *closeButtonForPopupView;
@property (strong, nonatomic) UILabel *alertMessage;

@property (assign, nonatomic) CGRect frameRectForPopupViewShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewHide;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonHide;



@property (nonatomic, weak) UIViewController *currentChildViewController;


@end


@implementation TNTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _animationToggle = 1;
    
    // AlertView Size
    CGFloat xAlertFrame = 0;
    CGFloat yAlertFrame = self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat widthAlertFrame = self.navigationController.navigationBar.frame.size.width;
    CGFloat heightAlertFrame = self.navigationController.navigationBar.frame.size.height;
    
    _frameRectForPopupViewShow = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, heightAlertFrame);
    _frameRectForPopupViewHide = CGRectMake(xAlertFrame, yAlertFrame, widthAlertFrame, 0);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.animationToggle) {
       
        TNTAlertViewController *alertVC = [TNTAlertViewController alertVC];
        
    } else {
        [self closePopupView];
    }
}


@end
