//
//  SCFFloorTileNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFFloorTileNode.h"

#import "SCFPlayerNode.h"

@implementation SCFFloorTileNode

- (id)init {
    if (self = [super initWithImageNamed:@"Brown Block.png"]) {
        self.userInteractionEnabled = YES;
        self.size = CGSizeMake(1, 4);
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] != 1) return;
    
    SKNode * player = [self.scene childNodeWithName:@"player"];
    
    CGPoint pos = [self.parent convertPoint:self.position toNode:player.parent];
    pos.y++;
    
    [(SCFPlayerNode *)player moveToPoint:pos];
}

@end
