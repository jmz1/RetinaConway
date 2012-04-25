//
//  RCField.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCField.h"

@implementation RCField

@synthesize width;
@synthesize height;
@synthesize data = oldData;

- (id)initWithSize:(CGSize)size;
{
    width = size.width;
    height = size.height;
    
    //oldData, newData should be flat arrays
    //cells should be two-dimensional perhaps
    //...eventually
    
    cells = malloc(width * height * sizeof(*cells));
    
    oldData = malloc(width * height * sizeof(bool));
    newData = malloc(width * height * sizeof(bool));

    int index, north, east, south, west;
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            index = x + y * width;
            north = (y - 1 + height) % height * width;
            east = (x + 1) % width;
            south = (y + 1) % height * width;
            west = (x - 1 + width) % width;
            
            oldData[index] = arc4random() % 2;
            newData[index] = 0;
            
            cells[index].oldValue = &oldData[index];
            cells[index].newValue = &newData[index];
            
            cells[index].neighbours[0] = &cells[x + north];
            cells[index].neighbours[1] = &cells[east + north];
            cells[index].neighbours[2] = &cells[east + y];
            cells[index].neighbours[3] = &cells[east + south];
            cells[index].neighbours[4] = &cells[x + south];
            cells[index].neighbours[5] = &cells[west + south];
            cells[index].neighbours[6] = &cells[west + y];
            cells[index].neighbours[7] = &cells[west + north];
        }
    }
    
    NSLog(@"Field initialised");

    return self;
}

- (void)updateWithTouches:(NSSet *)touches
{
    NSLog(@"%@", [touches description]);
}

- (void)iterate
{
    for (int y = 0; y < 30; y++) {
        NSMutableString *test = [[NSMutableString alloc] init];
        for (int x = 0; x < 50; x++) {
            if (oldData[x + width * y]) {
                [test appendString:[NSString stringWithFormat:@"O"]];
            } else {
                [test appendString:[NSString stringWithFormat:@"_"]];
            }
        }
        NSLog(@"%@", test);
    }
    
    int neighbours;

    //totally untested, by and large
    for (int i = 0; i < width * height; i++) {
        RCCell cell = cells[i];
        neighbours = 0;
        for (int j = 0; j < 8; j++) {
            neighbours += *cell.neighbours[j]->oldValue;
        }
        if (*cell.oldValue == 1) {
            if (neighbours < 2 || neighbours > 3) {
                newData[i] = 0;
            }
        } else if (neighbours == 3) {
            newData[i] = 1;
        }
    }
    
    memcpy(oldData, newData, width * height * sizeof(bool));
    
    NSLog(@"Iterated");

}

@end
