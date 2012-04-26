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
    width = (unsigned int) size.width;
    height = (unsigned int) size.height;
    
    // fuckery for dynamically allocated 2d array
    cells = malloc(height * sizeof(RCCell **));
    for(int i = 0; i < height; i++)
    {
		cells[i] = malloc(width * sizeof(RCCell *));
    }
    
    oldData = malloc(width * height * sizeof(bool));
    newData = malloc(width * height * sizeof(bool));
    
    int counter = 0;
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            
            cells[y][x].index = y*width + x;
            
            cells[y][x].neighbours[0] = &(cells[(y+1+height)%height][(x+1+width)%width]);
            cells[y][x].neighbours[1] = &(cells[(y+1+height)%height][(x+0+width)%width]);
            cells[y][x].neighbours[2] = &(cells[(y+1+height)%height][(x-1+width)%width]);
            cells[y][x].neighbours[3] = &(cells[(y-1+height)%height][(x+1+width)%width]);
            cells[y][x].neighbours[4] = &(cells[(y-1+height)%height][(x+0+width)%width]);
            cells[y][x].neighbours[5] = &(cells[(y-1+height)%height][(x-1+width)%width]);
            cells[y][x].neighbours[6] = &(cells[(y+0+height)%height][(x+1+width)%width]);
            cells[y][x].neighbours[7] = &(cells[(y+0+height)%height][(x-1+width)%width]);
            
            oldData[(cells[y][x].index)] = arc4random() % 2;
            newData[(cells[y][x].index)] = 0;
            
            counter++;
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
    
    // MODULO TEST
    int z = 0;
    //NSLog(@"%d", 666);
    NSLog(@"%d", (z-1+width)%width);
    int neighboursAlive;


    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            
            RCCell *cell = &(cells[y][x]);
            neighboursAlive = 0;
            for (int i = 0; i < 8; i++) {
                neighboursAlive += oldData[(cell->neighbours[i]->index)];
            }
            // dead cell
            if (oldData[cell->index] == 0){
                if (neighboursAlive == 3){
                    newData[cell->index] = 1;
                }
                else{
                    newData[cell->index] = 0;
                }
            }
            // live cell
            else{
                if ((neighboursAlive == 2) || (neighboursAlive == 3)){
                    newData[cell->index] = 1;
                }
                else{
                    newData[cell->index] = 0;
                }
            }
            
            
        }
    }

    
    memcpy(oldData, newData, width * height * sizeof(bool));
    
    NSLog(@"Iterated");

}

@end
