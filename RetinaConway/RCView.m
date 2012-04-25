//
//  RCView.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCView.h"

@implementation RCView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawLifeInContext:context];
}

- (void)drawLifeInContext:(CGContextRef)context
{
    
}

@end
