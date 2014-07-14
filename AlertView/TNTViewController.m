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
    
    // Button Size
    _frameRectForPopupViewCloseButtonShow = CGRectMake(0, 0, 20, 20);
    _frameRectForPopupViewCloseButtonHide = CGRectMake(0, 0, 0, 20);
    

    // Trying to do layout progmat...
    // https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/AutolayoutPG.pdf
//    _boxView = [[UIView alloc] initWithFrame:self.frameRectForPopupViewShow];
//    _boxView.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:17.0/255.0 blue:27.0/255.0 alpha:1.0];
//    
//    _closeButtonForPopupView = [UIButton buttonWithType:UIButtonTypeSystem];
//    [_closeButtonForPopupView setTitleColor:[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0] forState:UIControlStateNormal];
//    [_closeButtonForPopupView addTarget:self
//                                 action:@selector(closePopupView)
//                       forControlEvents:UIControlEventTouchUpInside];
//    [_closeButtonForPopupView setTitle:@"X" forState:UIControlStateNormal];
//    _closeButtonForPopupView.frame = self.frameRectForPopupViewCloseButtonHide;
//    
//    
//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(self.closeButtonForPopupView, self.boxView);
//    
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[closeButtonForPopupView]" options:<#(NSLayoutFormatOptions)#> metrics:<#(NSDictionary *)#> views:<#(NSDictionary *)#>];
//    
    
    
    // boxView
    _boxView = [[UIView alloc] initWithFrame:self.frameRectForPopupViewHide];
    _boxView.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:17.0/255.0 blue:27.0/255.0 alpha:1.0];
    
    // closeButton
    _closeButtonForPopupView = [UIButton buttonWithType:UIButtonTypeSystem];
    [_closeButtonForPopupView setTitleColor:[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_closeButtonForPopupView addTarget:self
                                 action:@selector(closePopupView)
                       forControlEvents:UIControlEventTouchUpInside];
    [_closeButtonForPopupView setTitle:@"X" forState:UIControlStateNormal];
    _closeButtonForPopupView.frame = self.frameRectForPopupViewCloseButtonHide;
    
    // Show PopupView
    [self.view addSubview:_boxView];
    [_boxView addSubview:_closeButtonForPopupView];
    

    UIStoryboard *storyboard = self.storyboard;
    TNTAlertViewController *alertVC = [storyboard instantiateViewControllerWithIdentifier:@"alertViewController"];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)closePopupView {
    
    [UIView animateWithDuration:0.5
                     animations:^() {
                         [self.boxView setFrame:self.frameRectForPopupViewHide];
                         [self.closeButtonForPopupView setFrame:self.frameRectForPopupViewCloseButtonHide];
                     }];
    self.animationToggle = 1;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.animationToggle) {
        // Show AlertView
        [UIView animateWithDuration:0.5
                         animations:^() {
                             [self.boxView setFrame:self.frameRectForPopupViewShow];
                             [self.closeButtonForPopupView setFrame:self.frameRectForPopupViewCloseButtonShow];
                         }
         ];
        //self.animationToggle = 0;
        
    } else {
        [self closePopupView];
    }
}


@end
