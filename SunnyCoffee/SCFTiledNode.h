//
//  SCFTiledNode.h
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SCFTiledNode : SKNode

+ (instancetype)tileNodeWithNodeTile:(SKNode *)node andDimensions:(CGSize)dim;
- (id)initWithNodeTile:(SKNode *)node andDimensions:(CGSize)dim;

@end
