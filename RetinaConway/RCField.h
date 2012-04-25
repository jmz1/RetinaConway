//
//  RCField.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCField : NSObject
{
    int width;
    int height;
    float interval;
    
    bool cells;
    
    NSTimer *timer;
}

- (id)initWithSize:(CGSize)size;

- (void)start;
- (void)stop;
- (void)updateWithTouches:(NSSet *)touches;

@end
