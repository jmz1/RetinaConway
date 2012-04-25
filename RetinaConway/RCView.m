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

size_t getBytes(void *info, void *buffer, size_t count) {
    memset(buffer, 0xf0, count);
    return count;
}

//http://stackoverflow.com/questions/2261177/cgimage-from-byte-array
- (void)drawLifeInContext:(CGContextRef)context
{
    /*
    CGDataProviderSequentialCallbacks callbacks;
    callbacks.getBytes = getBytes;
    
    CGDataProviderRef provider = CGDataProviderCreateSequential(NULL, &callbacks);
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef image = CGImageCreate(64,
                                   64,
                                   8,
                                   24,
                                   64*3,
                                   space,
                                   kCGBitmapByteOrderDefault,
                                   provider,
                                   NULL,
                                   NO,
                                   kCGRenderingIntentDefault);
    
    CGColorSpaceRelease(space);
    CGDataProviderRelease(provider);
    
    CGContextDrawImage(context, self.frame, image);
    
    CGImageRelease(image);
     */
}

@end
