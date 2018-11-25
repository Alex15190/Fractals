//
//  ViewController.m
//  Fractals
//
//  Created by Alex on 16.09.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "ViewController.h"
#import "FractalView.h"
#import "CustomPoint.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController()

@property (strong) IBOutlet FractalView *viewForGraphic;
@property (strong) IBOutlet NSTextField *TextFieldForButton2;

@property (nonatomic, strong) NSMutableArray *base;
@property (nonatomic, strong) NSMutableArray *pattern;

@property (nonatomic, strong) NSMutableArray *pairOfPoints;

@property (nonatomic, strong) CustomPoint *temp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialFunc];
    [self drawFractal];
    
}

- (void)recursiveDrawingBegin:(CustomPoint *) b end:(CustomPoint *)e index:(NSInteger) n
{
    
    if (n == 0){
        //drawLine(b,e)
        [self.pairOfPoints addObject:[CustomPoint makeCustomPointWithX:b.x Y:b.y]];
        [self.pairOfPoints addObject:[CustomPoint makeCustomPointWithX:e.x Y:e.y]];
    }
    else
    {
//        CustomPoint *t = [[CustomPoint alloc] init];
        for (NSInteger i = 0 ; i < [self.pattern count]; i++)
        {
            CustomPoint *b1 = self.temp; //возможна ошибка
            CustomPoint *e1 = [[CustomPoint alloc] init];
            CustomPoint *patPoint = self.pattern[i];
            e1.x = b.x + (e.x - b.x)*patPoint.x - (e.y - b.y)*patPoint.y;
            e1.y = b.y + (e.y - b.y)*patPoint.x + (e.x - b.x)*patPoint.y;
            [self recursiveDrawingBegin:b1 end:e1 index:n-1];
            self.temp = e1;
        }
    }
}

- (void)initialFunc
{
    self.base = [[NSMutableArray alloc] init];
    self.pattern = [[NSMutableArray alloc] init];
    self.pairOfPoints = [[NSMutableArray alloc] init];
    self.temp = [[CustomPoint alloc] init];
    
    CustomPoint *p1 = [CustomPoint makeCustomPointWithX:0 Y:0];
    CustomPoint *p2 = [CustomPoint makeCustomPointWithX:(double)1/3 Y:0];
    CustomPoint *p3 = [CustomPoint makeCustomPointWithX:(double)1/2 Y:sqrt(3)/(2*3)];
    CustomPoint *p4 = [CustomPoint makeCustomPointWithX:(double)2/3 Y:0];
    CustomPoint *p5 = [CustomPoint makeCustomPointWithX:1 Y:0];
    
    CustomPoint *b1 = [CustomPoint makeCustomPointWithX:0 Y:0];
    CustomPoint *b2 = [CustomPoint makeCustomPointWithX:1 Y:0];
    CustomPoint *b3 = [CustomPoint makeCustomPointWithX:0.5 Y:sqrt(3)/2];
    CustomPoint *b4 = [CustomPoint makeCustomPointWithX:0 Y:0]; // что бы замкнуть
    
    [self.base addObject:b1];
    [self.base addObject:b2];
    [self.base addObject:b3];
    [self.base addObject:b4];
    
    [self.pattern addObject:p1];
    [self.pattern addObject:p2];
    [self.pattern addObject:p3];
    [self.pattern addObject:p4];
    [self.pattern addObject:p5];
}

- (void)nextStep
{
    NSMutableArray *img = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [self.base count] - 1; i++)
    {
        CustomPoint *b = self.base[i];
        CustomPoint *e = self.base[i+1];
        for (int j = 0; j < [self.pattern count]; j++) {
            CustomPoint *patPoint = self.pattern[j];
            CustomPoint *t = [[CustomPoint alloc] init];
            t.x = b.x + (e.x - b.x)*patPoint.x - (e.y - b.y)*patPoint.y;
            t.y = b.y + (e.y - b.y)*patPoint.x + (e.x - b.x)*patPoint.y;
            [img addObject:t]; // добавление элементов в список
        }
    }
    self.base = [img mutableCopy];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)button1:(NSButton *)sender {
    
    self.viewForGraphic.type = DrawingTypeOne;
    [self nextStep];
    [self drawFractal];
}
- (IBAction)button2:(NSButton *)sender {
    self.viewForGraphic.type = DrawingTypeTwo;
    self.pairOfPoints = [[NSMutableArray alloc] init];
    self.temp = [[CustomPoint alloc] init];
    [self recursiveDrawingBegin:[CustomPoint makeCustomPointWithX:0 Y:0] end:[CustomPoint makeCustomPointWithX:1 Y:0] index:self.TextFieldForButton2.doubleValue];
    [self recursiveDrawingBegin:[CustomPoint makeCustomPointWithX:1 Y:0] end:[CustomPoint makeCustomPointWithX:0.5 Y:sqrt(3)/2] index:self.TextFieldForButton2.doubleValue];
    [self recursiveDrawingBegin:[CustomPoint makeCustomPointWithX:0.5 Y:sqrt(3)/2] end:[CustomPoint makeCustomPointWithX:0 Y:0] index:self.TextFieldForButton2.doubleValue];
    [self drawFractal];
}

-(void)drawFractal
{
    self.viewForGraphic.arrayOfPoints = self.base;
    self.viewForGraphic.arrayOfPairPoints = self.pairOfPoints;
    [self.viewForGraphic setNeedsDisplay:YES];
}

@end
