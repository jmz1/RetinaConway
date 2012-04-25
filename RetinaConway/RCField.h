//
//  RCField.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

typedef struct _RCCell {
    bool *oldValue;
    bool *newValue;
    struct _RCCell *neighbours[8];
} RCCell;

@interface RCField : NSObject
{
    int width;
    int height;
    
    RCCell *cells;
    bool *oldData;
    bool *newData;
    
}

@property (nonatomic) int width;
@property (nonatomic) int height;

@property (readonly) bool *data;

- (id)initWithSize:(CGSize)size;

- (void)iterate;
- (void)updateWithTouches:(NSSet *)touches;

@end
