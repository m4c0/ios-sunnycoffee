//
//  SCFAStar.m
//  SunnyCoffee
//
//  Created by Eduardo Costa on 26/06/13.
//  Copyright (c) 2013 Eduardo Costa. All rights reserved.
//

#import "SCFAStar.h"

#import "SCFAStarPoint.h"

@implementation SCFAStar {
    NSMutableArray * interables;
    NSMutableArray * valid;
}

- (id)initWithScene:(SKScene *)scene {
    if (self = [super init]) {
        interables = [NSMutableArray new];
        [scene enumerateChildNodesWithName:@"interactive" usingBlock:^(SKNode *node, BOOL *stop) {
            [interables addObject:[SCFAStarPoint pointWithPoint:node.position]];
        }];
        
        valid = [NSMutableArray new];
        [scene enumerateChildNodesWithName:@"floor" usingBlock:^(SKNode *node, BOOL *stop) {
            [node.children enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                CGPoint pos = [obj position];
                pos.y++;
                [valid addObject:[SCFAStarPoint pointWithPoint:pos]];
            }];
        }];
    }
    return self;
}

- (void)build {
    // https://en.wikipedia.org/wiki/A-star_algorithm#Pseudocode
    SCFAStarPoint * start = [SCFAStarPoint pointWithPoint:self.start];
    SCFAStarPoint * goal = [SCFAStarPoint pointWithPoint:self.goal];
    
    NSMutableSet * closedset = [NSMutableSet new];
    NSMutableSet * openset = [NSMutableSet setWithObject:start];
    NSMutableDictionary * camefrom = [NSMutableDictionary new];
    
    start.gScore = 0;
    start.fScore = [start distanceToPoint:self.goal];
    
    NSArray * fSortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fScore" ascending:YES]];
    while ([openset count]) {
        SCFAStarPoint * current = [[openset sortedArrayUsingDescriptors:fSortDescriptors] firstObject];
        if ([current isEqual:goal]) {
            NSMutableArray * actions = [NSMutableArray new];
            [self buildActionsForPoint:goal fromMap:camefrom intoArray:actions];
            self.builtAction = [SKAction sequence:actions];
            return;
        }
        
        [openset removeObject:current];
        [closedset addObject:current];
        for (SCFAStarPoint * neighbor in current.neighbors) {
            if ([interables containsObject:neighbor] || ![valid containsObject:neighbor]) {
                continue;
            }
            
            double tentativeGScore = current.gScore + [current distanceToPoint:neighbor.point];
            if ([closedset containsObject:neighbor] && (tentativeGScore >= neighbor.gScore)) {
                continue;
            }
            
            if (![openset containsObject:neighbor] || (tentativeGScore < neighbor.gScore)) {
                camefrom[neighbor] = current;
                neighbor.gScore = tentativeGScore;
                neighbor.fScore = neighbor.gScore + [neighbor distanceToPoint:self.goal];
                if (![openset containsObject:neighbor]) {
                    [openset addObject:neighbor];
                }
            }
        }
    }
    
    self.builtAction = nil;
    NSLog(@"Something terrible happened in A* universe");
}

- (void)buildActionsForPoint:(SCFAStarPoint *)currentNode fromMap:(NSDictionary *)camefrom intoArray:(NSMutableArray *)actions {
    SCFAStarPoint * prevNode = camefrom[currentNode];
    if (!prevNode) {
        return;
    }
    
    [self buildActionsForPoint:prevNode fromMap:camefrom intoArray:actions];
    
    int dx = prevNode.point.x - currentNode.point.x;
    int dy = prevNode.point.y - currentNode.point.y;
    if (dx != 0) {
        [actions addObject:[self buildActionToMoveToX:currentNode.point.x]];
    }
    if (dy != 0) {
        [actions addObject:[self buildActionToMoveToY:currentNode.point.y]];
    }
}

- (SKAction *)buildActionToMoveToX:(float)x {
    return [SKAction moveToX:x duration:0.15];
}
- (SKAction *)buildActionToMoveToY:(float)y {
    SKAction * move = [SKAction moveToY:y duration:0.10];
    SKAction * changeZ = [SKAction customActionWithDuration:0.10
                                                actionBlock:^(SKNode *node, CGFloat elapsedTime) {
                                                    node.zPosition = -2 + node.position.y / 2.0;
                                                }];
    
    return [SKAction group:@[move, changeZ]];
}

@end
