//
//  CustomPoint.m
//  Fractals
//
//  Created by Alex on 26.10.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "CustomPoint.h"

@implementation CustomPoint

+ (instancetype) makeCustomPointWithX:(double) x Y:(double)y
{
    CustomPoint *point = [[CustomPoint alloc] init];
    point.x = x;
    point.y = y;
    return point;
}

@end
