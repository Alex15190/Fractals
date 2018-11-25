//
//  ClassWork1.m
//  Fractals
//
//  Created by Alex on 26.10.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "FractalView.h"
#import "CustomPoint.h"

@implementation FractalView

- (void)viewDidMoveToWindow
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:[self window]];
}

- (void)windowDidResize:(NSNotification *)notification
{
    NSRect content = [self.window contentRectForFrameRect:[self.window frame]];
    NSRect viewRect = NSMakeRect(0, 0, content.size.width, content.size.height);
    [self setFrame:viewRect];
    [self.layer display];
    [self setNeedsDisplay:YES];
}

- (NSBezierPath *)drawLinesWithArray:(NSArray *)array
{
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(0, 0)];
    
    for (int i = 0; i < [array count]; i++)
    {
        CustomPoint *point = array[i];
        [path lineToPoint: CGPointMake(point.x, point.y)];
    }
    return path;
}

- (NSBezierPath *)drawLinesWithArrayOfPair:(NSArray *)array
{
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    for (int i = 0; i < [array count] - 1; i++)
    {
        CustomPoint *point1 = array[i];
        CustomPoint *point2 = array[i+1];
        [path moveToPoint:CGPointMake(point1.x, point1.y)];
        [path lineToPoint: CGPointMake(point2.x, point2.y)];
    }
    return path;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    switch (self.type) {
        case DrawingTypeOne:
            path = [self drawLinesWithArray:self.arrayOfPoints];
            break;
        case DrawingTypeTwo:
            path = [self drawLinesWithArrayOfPair:self.arrayOfPairPoints];
            break;
        case DrawingTypeThree:
            break;
        case DrawingTypeFour:
            break;
    }

    // увеличиваем на весь экран
    NSAffineTransform *t = [[NSAffineTransform alloc] init];
    [t translateXBy:self.bounds.size.width*0.05 yBy:self.bounds.size.height*0.05];
    [t scaleXBy:self.bounds.size.width*0.9 yBy:self.bounds.size.height*0.9];
    [path transformUsingAffineTransform:t];
     //рисую
    [path stroke];
    
}

-(void)redraw{
    [self setNeedsDisplay:YES];
}



@end
