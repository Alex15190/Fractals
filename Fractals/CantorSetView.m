//
//  FractalView.m
//  Fractals
//
//  Created by Alex on 16.09.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "CantorSetView.h"

@implementation CantorSetView

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

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSInteger a = self.window.frame.size.width - 20;
    if(self.length > 0)
        a = self.length;
    
    NSInteger x = self.window.frame.size.width /2 - a/2;
    
    NSBezierPath *path = [self drawB:x y:self.window.frame.size.height - 10 width:a];
    [[NSColor blackColor] setStroke];
    [[NSColor blackColor] setFill];
    [path fill];
    [path stroke];
}

- (NSBezierPath *)drawB:(NSInteger)x y:(NSInteger)y width:(NSInteger)width
{
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    NSLog(@"Draw something");
    if (width >= 2)
    {
        [path appendBezierPathWithRect:CGRectMake(x, y, width, 12)];
        y -= 40;
        
        [path appendBezierPath: [self drawB:(x + width * 2 / 3) y:y width:width/3]];
        [path appendBezierPath: [self drawB:x y:y width:width / 3]];
    }
    return path;
}
@end
