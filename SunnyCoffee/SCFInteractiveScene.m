//
//  SCFInteractiveScene.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFInteractiveScene.h"

#import "SCFCloseButtonNode.h"

@implementation SCFInteractiveScene

- (id)init {
    if (self = [super initWithSize:CGSizeMake(640, 480)]) {
        self.scaleMode = SKSceneScaleModeFill;
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    if ([[self children] count]) return;
    
    SCFCloseButtonNode * close = [SCFCloseButtonNode new];
    close.previousScene = self.previousScene;
    close.position = CGPointMake(590, 430);
    [self addChild:close];
}

@end
