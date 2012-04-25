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
    int width;
    int height;
    float interval;
    
    RCCell *cells;
    int **data;
    
    NSTimer *timer;
}

@property (nonatomic) int width;
@property (nonatomic) int height;
@property (readonly) int **data;

- (id)initWithSize:(CGSize)size;

- (void)start;
- (void)stop;
- (void)updateWithTouches:(NSSet *)touches;

@end
