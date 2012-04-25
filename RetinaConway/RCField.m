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
@synthesize data;

- (id)initWithSize:(CGSize)size;
{
    width = size.width;
    height = size.height;
    interval = 0.025f;
    
    cells = malloc(width * height * sizeof(*cells));
    data = malloc(width * height * sizeof(int));

    int index, north, east, south, west;
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            index = x + y * width;
            north = (y - 1 + height) % height * width;
            east = (x + 1) % width;
            south = (y + 1) % height * width;
            west = (x - 1 + width) % width;
        
            cells[index].oldValue = index % 2;
            cells[index].newValue = index % 2;
            
            data[index] = &cells[index].oldValue;
            
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
    
    /*
    for (int i = 0; i < 400; i++) {
        NSLog(@"%i", *data[i]);
    }
     */
    
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
    int neighbours;
    
    for (int i = 0; i < width * height; i++) {
        RCCell cell = cells[i];
        neighbours = 0;
        for (int j = 0; j < 8; j++) {
            neighbours += cell.neighbours[j]->oldValue;
        }
        if (cell.oldValue == 1) {
            if (neighbours < 2 || neighbours > 3) {
                cell.newValue = 0;
            }
        } else if (neighbours == 3) {
            cell.newValue = 1;
        }
    }
    for (int i = 0; i < width * height; i++) {
        RCCell cell = cells[i];
        cell.oldValue = cell.newValue;
    }
    
    //NSLog(@"Iterate");
}

@end
