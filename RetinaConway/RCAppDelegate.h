//
//  RCAppDelegate.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCViewController;
@class RCModel;

@interface RCAppDelegate : UIResponder <UIApplicationDelegate>
{
    RCModel *model;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RCViewController *viewController;

@property (strong, nonatomic) RCModel *model;

@end
