//
//  RCField.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

typedef struct _RCCell {
    int oldValue;
    int newValue;
    struct _RCCell *neighbours[8];
} RCCell;

@interface RCField : NSObject
{
    uint width;
    uint height;
    float interval;
    
    RCCell *cells;
    int **data;
    
    NSTimer *timer;
}

@property (readonly) int **data;

- (id)initWithSize:(CGSize)size;

- (void)start;
- (void)stop;
- (void)updateWithTouches:(NSSet *)touches;

@end
