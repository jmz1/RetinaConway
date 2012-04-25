//
//  RCViewController.m
//  RetinaConway
//
//  Created by Daniel Clelland on 25/04/12.
//  Copyright (c) 2012 Daniel Clelland. All rights reserved.
//

#import "RCViewController.h"
#import "RCView.h"
#import "RCField.h"

#define UPDATE_INTERVAL 0.025

@interface RCViewController ()

@end

@implementation RCViewController

- (void)viewDidLoad
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    field = [[RCField alloc] initWithSize:screenSize];
    
    
    self.view = [[RCView alloc] init];
    [self.view setMultipleTouchEnabled:YES];
    
    [(RCView *)self.view setField:field];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)startAnimation
{
    timer = [NSTimer scheduledTimerWithTimeInterval:UPDATE_INTERVAL target:self selector:@selector(onTick) userInfo:nil repeats:YES];
}

- (void)stopAnimation
{
    [timer invalidate];
    timer = nil;
}

- (void)onTick
{
    [self.view setNeedsDisplay];
    [field iterate];
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
