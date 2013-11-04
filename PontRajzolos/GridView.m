//
//  GridView.m
//  PontRajzolos
//
//  Created by Robert Sallai on 28/10/13.
//  Copyright (c) 2013 Robert Sallai. All rights reserved.
//

#import "GridView.h"

@implementation GridView


- (void)drawRect:(NSRect)dirtyRect
{
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    [[NSColor whiteColor] setFill];
    CGContextFillRect(context, dirtyRect);
    
    for (int i = 1; i < [self bounds].size.height / 10; i++) {
        if (i % 10 == 0) {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.3] set];
        } else if (i % 5 == 0) {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.2] set];
        } else {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.1] set];
        }
        [NSBezierPath strokeLineFromPoint:NSMakePoint(0, i * 10 - 0.5) toPoint:NSMakePoint([self bounds].size.width, i * 10 - 0.5)];
    }
    for (int i = 1; i < [self bounds].size.width / 10; i++) {
        if (i % 10 == 0) {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.3] set];
        } else if (i % 5 == 0) {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.2] set];
        } else {
            [[NSColor colorWithSRGBRed:100/255.0 green:149/255.0 blue:237/255.0 alpha:0.1] set];
        }
        [NSBezierPath strokeLineFromPoint:NSMakePoint(i * 10 - 0.5, 0) toPoint:NSMakePoint(i * 10 - 0.5, [self bounds].size.height)];
    }
    
}
@end
