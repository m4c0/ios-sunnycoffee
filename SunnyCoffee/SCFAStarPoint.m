//
//  SCFAStarPoint.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 25/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFAStarPoint.h"

static inline double SCFPointModulus(CGPoint p) {
    return sqrt(p.x * p.x + p.y * p.y);
}
static inline CGPoint SCFPointSubtract(CGPoint a, CGPoint b) {
    return CGPointMake(a.x - b.x, a.y - b.y);
}

@implementation SCFAStarPoint

+ (instancetype)pointWithPoint:(CGPoint)point {
    return [[SCFAStarPoint alloc] initWithPoint:point];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    SCFAStarPoint * res = [[SCFAStarPoint allocWithZone:zone] initWithPoint:self.point];
    res.fScore = self.fScore;
    res.gScore = self.gScore;
    return res;
}

#pragma mark -

- (id)initWithPoint:(CGPoint)point {
    if (self = [super init]) {
        self.point = point;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[SCFAStarPoint class]]) return NO;
    
    SCFAStarPoint * p = object;
    return (int)p.point.x == (int)self.point.x && (int)p.point.y == (int)self.point.y;
}

- (NSUInteger)hash {
    return ((int)self.point.x << 7) + (int)self.point.y;
}

- (double)distanceToPoint:(CGPoint)point {
    return SCFPointModulus(point);
}

- (NSArray *)neighbors {
    if (!_neighbors) {
        _neighbors = @[[SCFAStarPoint pointWithPoint:CGPointMake(self.point.x - 1, self.point.y)],
                       [SCFAStarPoint pointWithPoint:CGPointMake(self.point.x + 1, self.point.y)],
                       [SCFAStarPoint pointWithPoint:CGPointMake(self.point.x, self.point.y - 2)],
                       [SCFAStarPoint pointWithPoint:CGPointMake(self.point.x, self.point.y + 2)]];
    }
    return _neighbors;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"A* - %f,%f", self.point.x, self.point.y];
}

@end
