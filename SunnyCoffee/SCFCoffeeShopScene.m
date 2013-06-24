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
        
        SKSpriteNode * backTile = [SCFFloorTileNode new];

        SCFTiledNode * back = [SCFTiledNode tileNodeWithNodeTile:backTile andDimensions:CGSizeMake(9, 5)];
        back.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        [self addChild:back];

        SKSpriteNode * girl = [SCFPlayerNode new];
        girl.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        [self addChild:girl];
        
        SCFInteractiveNode * chest = [SCFInteractiveNode new];
        chest.position = CGPointMake(2, 7);
        [self addChild:chest];
    }
    return self;
}

@end
