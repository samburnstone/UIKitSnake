//
//  SnakeMovement.h
//  SnakeGame
//
//  Created by Sam Burnstone on 12/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SBSnakePart.h"

/**
 Created every time a swipe is registered to alter the direction of the snake.
 
 Enables individual parts of the snake to be moved separately and for multiple moves to be made
 at the same time.
 
 e.g. Snake after 2 items of food = 3 parts
 user requests up movement of snake: head moves up,
 then immediately after swipes right: head moves right  BUT second part of snake should be moved up 
 before moving right.
 */

@interface SBSnakeMovement : NSObject {
}

@property (nonatomic, assign) SBSnakePartSlitherDirection movementSlitherDirection;
@property (nonatomic, assign) NSUInteger currentPartToMove;

// Designated initializer
- (instancetype)initWithDirection:(SBSnakePartSlitherDirection)direction;

@end
