//
//  RCView.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCField;

@interface RCView : UIView
{
    RCField *field;
}

@property (nonatomic, retain) RCField *field;

@end
