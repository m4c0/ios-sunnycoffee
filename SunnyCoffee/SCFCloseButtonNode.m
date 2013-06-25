//
//  SCFCloseButtonNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFCloseButtonNode.h"

#define XSIZE 14
#define ORADIUS 30
#define OSIZE (2*ORADIUS)

@implementation SCFCloseButtonNode

- (id)init {
    if (self = [super init]) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddEllipseInRect(path, nil, CGRectMake(-ORADIUS, -ORADIUS, OSIZE, OSIZE));
        
        CGPoint p0[2] = { CGPointMake(-XSIZE, -XSIZE), CGPointMake(XSIZE, XSIZE) };
        CGPathAddLines(path, nil, p0, 2);
        
        CGPoint p1[2] = { CGPointMake(XSIZE, -XSIZE), CGPointMake(-XSIZE, XSIZE) };
        CGPathAddLines(path, nil, p1, 2);
        
        self.path = path;
        self.strokeColor = [UIColor whiteColor];
        self.fillColor = [UIColor blackColor];
        self.lineWidth = 0.005;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKTransition * transition = [SKTransition pushWithDirection:SKTransitionDirectionUp
                                                       duration:0.5];
    [self.scene.view presentScene:self.previousScene transition:transition];
}

@end
