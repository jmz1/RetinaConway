//
//  RCViewController.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCViewController.h"
#import "RCView.h"
#import "RCAppDelegate.h"
#import "RCModel.h"

@interface RCViewController ()

@end

@implementation RCViewController

- (void)viewDidLoad
{
    self.view = [[RCView alloc] init];
    [self.view setMultipleTouchEnabled:YES];
    
    RCAppDelegate *delegate = (RCAppDelegate *)[[UIApplication sharedApplication] delegate];
    model = [delegate model];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [model updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [model updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [model updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

@end
