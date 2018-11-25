//
//  ClassWork1.h
//  Fractals
//
//  Created by Alex on 26.10.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EnumForDrawingType.h"
NS_ASSUME_NONNULL_BEGIN

@interface FractalView : NSView

@property (nonatomic, strong) NSMutableArray* arrayOfPoints;
@property (nonatomic, strong) NSMutableArray* arrayOfPairPoints;
@property (nonatomic) DrawingType type;
-(void)redraw;

@end

NS_ASSUME_NONNULL_END
