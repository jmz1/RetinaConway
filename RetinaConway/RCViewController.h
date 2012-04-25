//
//  RCViewController.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCField;

@interface RCViewController : UIViewController
{
    NSTimer *timer;
    RCField *field;
}

- (void)startAnimation;
- (void)stopAnimation;

@end
