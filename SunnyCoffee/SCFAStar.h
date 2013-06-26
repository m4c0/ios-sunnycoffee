//
//  SCFAStar.h
//  SunnyCoffee
//
//  Created by Eduardo Costa on 26/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SCFAStar : NSObject

@property (nonatomic,strong) SKAction * builtAction;
@property (nonatomic) CGPoint start;
@property (nonatomic) CGPoint goal;

- (id)initWithScene:(SKScene *)scene;
- (void)build;

@end
