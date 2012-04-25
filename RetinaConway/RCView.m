//
//  RCView.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCView.h"
#import "RCField.h"

@implementation RCView

@synthesize field;

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
    CGDataProviderSequentialCallbacks callbacks;
    callbacks.getBytes = field.data;
    
    CGDataProviderRef provider = CGDataProviderCreateSequential(NULL, &callbacks);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGImageRef img = CGImageCreate(field.width,
                                   field.height,
                                   8,
                                   8,
                                   field.width,
                                   colorSpace,
                                   kCGBitmapByteOrderDefault,
                                   provider,
                                   NULL,
                                   NO,
                                   kCGRenderingIntentDefault);
    
    CGColorSpaceRelease(colorSpace);
    CGDataProviderRelease(provider);
    
    // use the created CGImage
    
    CGImageRelease(img);
}

@end
