//
//  SCFFloorTileNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFFloorTileNode.h"

@implementation SCFFloorTileNode

- (id)init {
    if (self = [super initWithImageNamed:@"Brown Block.png"]) {
        self.userInteractionEnabled = YES;
        self.size = CGSizeMake(1, 4);
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] != 1) return;
    
    SKNode * player = [self.scene childNodeWithName:@"player"];
    if (player.hasActions) return;
    
    CGPoint pos = [self.parent convertPoint:self.position toNode:player.parent];
    pos.y++;
    
    float timeX = 0.15 * ABS(pos.x - player.position.x);
    float timeY = 0.10 * ABS(pos.y - player.position.y);
    
    NSArray * actions = @[[SKAction moveToX:pos.x duration:timeX],
                          [SKAction moveToY:pos.y duration:timeY]];
    [player runAction:[SKAction sequence:actions]];
}

@end
