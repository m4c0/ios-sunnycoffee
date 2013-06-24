//
//  SCFTiledNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFTiledNode.h"

@implementation SCFTiledNode

+ (instancetype)tileNodeWithNodeTile:(SKNode *)node andDimensions:(CGSize)dim {
    return [[SCFTiledNode alloc] initWithNodeTile:node andDimensions:dim];
}

- (id)initWithNodeTile:(SKNode *)node andDimensions:(CGSize)dim {
    if (self = [super init]) {
        for (float x = 0; x < dim.width; x++) {
            for (float y = 0; y < dim.height; y++) {
                SKNode * clone = [node copy];
                clone.position = CGPointMake(x - dim.width / 2.0, 2 * (y - dim.height / 2.0));
                clone.zPosition = y - dim.height / 2.0;
                [self addChild:clone];
            }
        }
    }
    return self;
}

@end
