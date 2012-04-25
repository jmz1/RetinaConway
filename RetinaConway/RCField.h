//
//  RCField.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

typedef struct _RCCell {
    char *oldValue;
    char *newValue;
    struct _RCCell *neighbours[8];
} RCCell;

@interface RCField : NSObject
{
    int width;
    int height;
    float interval;
    
    RCCell *cells;
    char *oldData;
    char *newData;
    
    NSTimer *timer;
}

@property (nonatomic) int width;
@property (nonatomic) int height;
@property (readonly) char *data;

- (id)initWithSize:(CGSize)size;

- (void)start;
- (void)stop;
- (void)updateWithTouches:(NSSet *)touches;

@end
