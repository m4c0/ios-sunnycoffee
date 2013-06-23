//
//  SCFInteractiveNode.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 23/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFInteractiveNode.h"

@implementation SCFInteractiveNode

- (id)init {
    if (self = [super initWithImageNamed:@"Chest Closed.png"]) {
        self.userInteractionEnabled = YES;
        self.size = CGSizeMake(1, 4);
    }
    return self;
}

@end
