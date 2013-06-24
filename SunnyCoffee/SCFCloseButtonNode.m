//
//  SCFCloseButtonNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFCloseButtonNode.h"

@implementation SCFCloseButtonNode

- (id)init {
    if (self = [super initWithColor:[SKColor whiteColor] size:CGSizeMake(1, 2)]) {
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
