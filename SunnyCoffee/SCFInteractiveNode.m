//
//  SCFInteractiveNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFInteractiveNode.h"

#import "SCFPlayerNode.h"

@implementation SCFInteractiveNode

- (id)init {
    if (self = [super initWithImageNamed:@"Chest Closed.png"]) {
        self.userInteractionEnabled = YES;
        self.size = CGSizeMake(1, 4);
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] != 1) return;
    
    SKNode * player = [self.scene childNodeWithName:@"player"];
    
    CGPoint pos = [self.parent convertPoint:self.position toNode:player.parent];
    pos.y -= 2;
    
    [(SCFPlayerNode *)player moveToPoint:pos completion:^{
        SKScene * scene = [SKScene sceneWithSize:self.scene.size];

        SKTransition * transition = [SKTransition pushWithDirection:SKTransitionDirectionLeft
                                                           duration:0.3];
        [self.scene.view presentScene:scene transition:transition];
    }];
}

@end
