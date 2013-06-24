//
//  SCFCoffeeShopScene.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFCoffeeShopScene.h"

#import "SCFFloorTileNode.h"
#import "SCFInteractiveNode.h"
#import "SCFPlayerNode.h"
#import "SCFTiledNode.h"

@implementation SCFCoffeeShopScene

- (id)init {
    if (self = [super initWithSize:CGSizeMake(10, 16)]) {
        self.scaleMode = SKSceneScaleModeFill;
        self.anchorPoint = CGPointMake(0.5, 0.5);
        
        SKSpriteNode * backTile = [SCFFloorTileNode new];

        SCFTiledNode * back = [SCFTiledNode tileNodeWithNodeTile:backTile andDimensions:CGSizeMake(9, 5)];
        [self addChild:back];

        SKSpriteNode * girl = [SCFPlayerNode new];
        [self addChild:girl];
        
        SCFInteractiveNode * chest = [SCFInteractiveNode new];
        chest.position = CGPointMake(-3, -1);
        [self addChild:chest];
    }
    return self;
}

@end
