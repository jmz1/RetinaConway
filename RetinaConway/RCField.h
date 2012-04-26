//
//  RCField.h
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

typedef struct _RCCell {
    int index;
    struct _RCCell *neighbours[8];
} RCCell;

@interface RCField : NSObject
{
    unsigned int width;
    unsigned int height;
    
    RCCell **cells;
    bool *oldData;
    bool *newData;
    
}

// oh what the heck

@property unsigned int width;
@property unsigned int height;

//@property (nonatomic) unsigned int width;
//@property (nonatomic) unsigned int height;

@property (readonly) bool *data;

- (id)initWithSize:(CGSize)size;

- (void)iterate;
- (void)updateWithTouches:(NSSet *)touches;

@end
