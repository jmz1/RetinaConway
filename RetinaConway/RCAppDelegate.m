//
//  RCAppDelegate.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCAppDelegate.h"

#import "RCViewController.h"
#import "RCField.h"

@implementation RCAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

@synthesize field;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    field = [[RCField alloc] initWithSize:screenSize];
    [field start];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[RCViewController alloc] initWithNibName:@"RCViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[RCViewController alloc] initWithNibName:@"RCViewController_iPad" bundle:nil];
    }
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [field stop];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [field stop];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [field start];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [field start];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [field stop];
}

@end
