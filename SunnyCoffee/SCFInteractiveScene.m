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

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKNode * close = [SCFCloseButtonNode new];
        close.position = CGPointMake(0.5, 15);
        [self addChild:close];
    }
    return self;
}

@end
