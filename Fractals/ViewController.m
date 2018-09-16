//
//  ViewController.m
//  Fractals
//
//  Created by Alex on 16.09.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "ViewController.h"
#import "CantorSetView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController()

@property (weak) IBOutlet CantorSetView *viewForGraphic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.viewForGraphic.length = self.viewForGraphic.bounds.size.width - 10;
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
