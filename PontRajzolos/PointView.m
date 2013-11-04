//
//  PointView.m
//  PontRajzolos
//
//  Created by Robert Sallai on 28/10/13.
//  Copyright (c) 2013 Robert Sallai. All rights reserved.
//

#import "PointView.h"

@implementation PointView


- (void)drawRect:(NSRect)dirtyRect
{
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextAddEllipseInRect(context, dirtyRect);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillPath(context);
    
}

@end
