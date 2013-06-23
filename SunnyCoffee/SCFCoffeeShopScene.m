//
//  SCFCoffeeShopScene.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFCoffeeShopScene.h"

#import "SCFTiledNode.h"

@implementation SCFCoffeeShopScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode * backTile = [SKSpriteNode spriteNodeWithImageNamed:@"Brown Block.png"];
        backTile.size = CGSizeMake(1, 1);
        SCFTiledNode * back = [SCFTiledNode tileNodeWithNodeTile:backTile andDimensions:CGSizeMake(9, 5)];
        back.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        [self addChild:back];

        SKSpriteNode * girl = [SKSpriteNode spriteNodeWithImageNamed:@"Character Cat Girl.png"];
        girl.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        girl.size = CGSizeMake(1, 1);
        [self addChild:girl];
    }
    return self;
}

@end
