//
//  SCFPlayerNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFPlayerNode.h"

@implementation SCFPlayerNode

- (id)init {
    if (self = [super initWithImageNamed:@"Character Cat Girl"]) {
        self.name = @"player";
        self.size = CGSizeMake(1, 4);
    }
    return self;
}

- (void)moveToPoint:(CGPoint)pos {
    if ([self hasActions]) return;
    
    float timeX = 0.15 * ABS(pos.x - self.position.x);
    float timeY = 0.10 * ABS(pos.y - self.position.y);
    
    NSArray * actions = @[[SKAction moveToX:pos.x duration:timeX],
                          [SKAction moveToY:pos.y duration:timeY]];
    [self runAction:[SKAction sequence:actions]];
}

@end
