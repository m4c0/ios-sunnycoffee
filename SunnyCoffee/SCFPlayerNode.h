//
//  SCFPlayerNode.h
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SCFPlayerNode : SKSpriteNode

- (void)moveToPoint:(CGPoint)pos;
- (void)moveToPoint:(CGPoint)pos completion:(void(^)(void))completion;

@end
