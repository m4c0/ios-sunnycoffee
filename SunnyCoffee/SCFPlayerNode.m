//
//  SCFPlayerNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFPlayerNode.h"

#import "SCFAStar.h"

static inline double SCFPointModulus(CGPoint p) {
    return sqrt(p.x * p.x + p.y * p.y);
}
static inline CGPoint SCFPointSubtract(CGPoint a, CGPoint b) {
    return CGPointMake(a.x - b.x, a.y - b.y);
}

@implementation SCFPlayerNode

- (id)init {
    if (self = [super initWithImageNamed:@"Character Cat Girl"]) {
        self.name = @"player";
        self.size = CGSizeMake(1, 4);
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}

- (void)moveToPoint:(CGPoint)pos {
    [self moveToPoint:pos completion:nil];
}
- (void)moveToPoint:(CGPoint)pos completion:(void (^)(void))completion {
    if ([self hasActions]) return;
    
    SCFAStar * a8 = [[SCFAStar alloc] initWithScene:self.scene];
    a8.start = self.position;
    a8.goal = pos;
    [a8 build];
    
    if (a8.builtAction) {
        [self runAction:a8.builtAction completion:completion];
    }
}

@end
