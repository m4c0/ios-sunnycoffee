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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    SKNode * player = [self.scene childNodeWithName:@"player"];
    if (!player.hasActions) {
        CGPoint pos = [self.parent convertPoint:self.position toNode:player.parent];
        [player runAction:[SKAction moveTo:pos duration:0.5]];
    }
}

@end
