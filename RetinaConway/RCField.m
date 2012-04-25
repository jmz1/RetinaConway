//
//  RCField.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCField.h"

@implementation RCField

- (id)initWithSize:(CGSize)size;
{
    width = size.width;
    height = size.height;
    interval = 0.025f;
    
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            //data[y][x] = 0;
        }
    }
    
    return self;
}

- (void)start
{
    timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
}

- (void)stop
{
    [timer invalidate];
    timer = nil;
}

- (void)updateWithTouches:(NSSet *)touches
{
    
}

- (void)onTick:(NSTimer *)timer
{
    //NSLog(@"iterate");
}

@end
