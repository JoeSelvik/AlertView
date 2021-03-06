//
//  TNTAppDelegate.m
//  AlertView
//
//  Created by Joe Selvik on 7/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "TNTAppDelegate.h"
#import "TNTMasterViewController.h"
#import "TNTNavigationController.h"
#import "TNTViewController.h"

@implementation TNTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Create the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Make TNTMasterVC the rootViewController
    TNTMasterViewController *masterVC = [TNTMasterViewController new];
    self.window.rootViewController = masterVC;
    [self.window makeKeyAndVisible];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // Create a TNTNavigationController and set its rootVC to the initial VC of the app
    // Make sure these both come from the storyboard
    TNTNavigationController *navigationController = [mainStoryboard instantiateViewControllerWithIdentifier:@"firstNavController"];
    TNTViewController *mainViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"mainViewController"];
    
    TNTNavigationController *rootViewController = [navigationController initWithRootViewController:mainViewController];

    // Make the navigationVC (rootNavController) a child of the masterVC (rootVC)
    [self.window.rootViewController addChildViewController:rootViewController];
    [self.window.rootViewController.view addSubview:rootViewController.view];
    [rootViewController didMoveToParentViewController:self.window.rootViewController];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
