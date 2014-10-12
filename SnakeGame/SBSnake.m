//
//  SBSnakeView.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBSnake.h"

#import "SBSnakeMovement.h"

@interface SBSnake ()

// Queue of moves to make, act on a per part basis
@property (strong, nonatomic) NSMutableArray *movements;

@end

@implementation SBSnake

- (instancetype)initWithGameView:(UIView *)gameStage atStartingPos:(CGPoint)startPoint {
    self = [super init];
    
    if (self) {
        
        _movements = [NSMutableArray array];
        
        _snakeBodyParts = [NSMutableArray array];
        
        _superview = gameStage;
        
        // Create the head of the snake
        SBSnakePart *snakeHead = [SBSnakePart createSnakeHeadAtPoint:startPoint];
        [_superview addSubview:snakeHead];
        [_snakeBodyParts addObject:snakeHead];
    }
    
    return self;
}

- (void)updateBodyPartPositions {

    // Go through each stored movement
    [self.movements enumerateObjectsUsingBlock:^(SBSnakeMovement *movement, NSUInteger idx, BOOL *stop) {
        // Grab the item that is next to change direction
        SBSnakePart *partToChangeDirection = [self.snakeBodyParts objectAtIndex:movement.currentPartToMove];
        [partToChangeDirection setSlitherDirection:movement.movementSlitherDirection];
        
        // Alter direction of next body time on next game loop update
        movement.currentPartToMove++;
    }];
    
    // Go through all body parts and update their position based on movement to apply to that part
    [self.snakeBodyParts enumerateObjectsUsingBlock:^(SBSnakePart *part, NSUInteger idx, BOOL *stop) {
        CGVector movementVector = [part movementVectorForSnakePart];
        
        // Small gaps form in snake when turning, but I quite like this effect :)
        [UIView animateWithDuration:0.1 animations:^{
            [part setFrame:CGRectOffset(part.frame, movementVector.dx, movementVector.dy)];
        }];
    }];
    
    // Clean up movements that are no longer required
    [self discardCompletedMovements];
}

- (void)discardCompletedMovements {
    NSArray *tempMovements = [self.movements copy];
    
    [tempMovements enumerateObjectsUsingBlock:^(SBSnakeMovement *movement, NSUInteger idx, BOOL *stop) {
        // Remove movement if next item to animate is greater than the length of the snake
        if (movement.currentPartToMove >= [self.snakeBodyParts count]) {
            [self.movements removeObject:movement];
        }
    }];
}

/**
 Respond to request to alter direction of the snake. Apply to one part per frame.
 
 May have to queue up changes - i.e. long snake left swipe then up swipe
 */
- (void)changeSnakeDirection:(SBSnakePartSlitherDirection)slitherDirection {
    // Create a new movement to record this change of direction request
    SBSnakeMovement *newMovement = [[SBSnakeMovement alloc] initWithDirection:slitherDirection];
    
    // Add new movement to array - comes into play on next game update
    [self.movements addObject:newMovement];
}

/**
 Retrive head component of the snake
 @return Top part of snake
 */
- (SBSnakePart *)headBodyPart {
    return [_snakeBodyParts firstObject];
}

/**
 Appends a new UIView item to the tail of the existing snake
 */
- (void)appendBodyPart {
    // TODO: Take into account direction of snake
    
    // Get the last body part
    SBSnakePart *previousRearBodyPart = [self.snakeBodyParts lastObject];
    
    // Position new tail, by taking into account the direction of the 'tail'
    CGPoint endPoint;
    
    CGFloat maxX = CGRectGetMaxX(previousRearBodyPart.frame);
    CGFloat maxY = CGRectGetMaxY(previousRearBodyPart.frame);
    CGFloat minX = CGRectGetMinX(previousRearBodyPart.frame);
    CGFloat minY = CGRectGetMinY(previousRearBodyPart.frame);
    
    CGFloat partHeight = previousRearBodyPart.frame.size.height;
    CGFloat partWidth = previousRearBodyPart.frame.size.width;
    
    switch (previousRearBodyPart.slitherDirection) {
        case SBSnakePartSlitherDirectionRight:
            endPoint = CGPointMake(minX - partWidth, minY);
            break;
        case SBSnakePartSlitherDirectionLeft:
            endPoint = CGPointMake(maxX, minY);
            break;
        case SBSnakePartSlitherDirectionUp:
            endPoint = CGPointMake(minX, maxY);
            break;
        case SBSnakePartSlitherDirectionDown:
            endPoint = CGPointMake(minX, minY - partHeight);
            break;
        default:
            break;
    }
    
    SBSnakePart *newTail = [SBSnakePart createSnakeTailAtPoint:endPoint];
    
    // Set the direction to be the same as previous last part
    [newTail setSlitherDirection:previousRearBodyPart.slitherDirection];
    
    [_superview addSubview:newTail];
    [self.snakeBodyParts addObject:newTail];
}

@end
