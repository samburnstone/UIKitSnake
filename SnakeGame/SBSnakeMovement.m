//
//  SnakeMovement.m
//  SnakeGame
//
//  Created by Sam Burnstone on 12/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBSnakeMovement.h"

@implementation SBSnakeMovement

/**
 Simple initializer that ensures we start moving the snake from the front (part at index 0)
 */
- (instancetype)initWithDirection:(SBSnakePartSlitherDirection)direction {
    self = [super init];
    if (self) {
        _currentPartToMove = 0;
        _movementSlitherDirection = direction;
    }
    return self;
}

@end
