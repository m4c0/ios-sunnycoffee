//
//  SCFCoffeeShopScene.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFCoffeeShopScene.h"

@implementation SCFCoffeeShopScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKTexture * backTexture = [SKTexture textureWithImageNamed:@"Character Cat Girl.png"];
        
        SKSpriteNode * backSprite = [SKSpriteNode spriteNodeWithTexture:backTexture size:self.size];
        backSprite.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        [self addChild:backSprite];
    }
    return self;
}

@end
