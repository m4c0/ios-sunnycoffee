//
//  SCFAStarPoint.h
//  SunnyCoffee
//
//  Created by Eduardo Costa on 25/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCFAStarPoint : NSObject<NSCopying>

@property (nonatomic,strong) NSArray * neighbors;
@property (nonatomic,strong) SCFAStarPoint * camefrom;
@property (nonatomic) CGPoint point;
@property (nonatomic) double gScore;
@property (nonatomic) double fScore;

+ (instancetype)pointWithPoint:(CGPoint)point;
- (id)initWithPoint:(CGPoint)point;

- (double)distanceToPoint:(CGPoint)point;

@end
