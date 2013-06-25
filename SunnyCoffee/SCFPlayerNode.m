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
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}

- (void)moveToPoint:(CGPoint)pos {
    [self moveToPoint:pos completion:nil];
}
- (void)moveToPoint:(CGPoint)pos completion:(void (^)(void))completion {
    if ([self hasActions]) return;
    
    float timeX = 0.15 * ABS(pos.x - self.position.x);
    float timeY = 0.10 * ABS(pos.y - self.position.y);
    
    NSArray * yActions = @[[SKAction moveToY:pos.y duration:timeY],
                           [SKAction customActionWithDuration:timeY
                                                  actionBlock:^(SKNode *node, CGFloat elapsedTime) {
                                                      node.zPosition = node.position.y - 14;
                                                  }]];
    
    NSArray * actions = @[[SKAction moveToX:pos.x duration:timeX],
                          [SKAction group:yActions]];
    [self runAction:[SKAction sequence:actions] completion:completion];
}

@end
