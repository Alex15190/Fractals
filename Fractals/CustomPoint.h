//
//  CustomPoint.h
//  Fractals
//
//  Created by Alex on 26.10.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomPoint : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;
+ (instancetype) makeCustomPointWithX:(double) x Y:(double)y;

@end

NS_ASSUME_NONNULL_END
