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
#import "RCField.h"

@interface RCViewController ()

@end

@implementation RCViewController

- (void)viewDidLoad
{
    RCAppDelegate *delegate = (RCAppDelegate *)[[UIApplication sharedApplication] delegate];
    field = [delegate field];
    
    self.view = [[RCView alloc] init];
    [self.view setMultipleTouchEnabled:YES];
    [(RCView *)self.view setField:field];
    
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
    [field updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [field updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [field updateWithTouches:touches];
    [self.view setNeedsDisplay];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

@end
