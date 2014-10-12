//
//  SBSnakeView.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBSnake.h"

@interface SBSnake () {
    NSUInteger currentPartToMove;
}

@end

@implementation SBSnake

- (instancetype)initWithGameView:(UIView *)gameStage atStartingPos:(CGPoint)startPoint {
    self = [super init];
    
    if (self) {

        currentPartToMove = 0;
        
        _snakeBodyParts = [NSMutableArray array];
        _superview = gameStage;
        
        SBSnakePart *snakeHead = [SBSnakePart createSnakeHeadAtPoint:startPoint];
        
        [_superview addSubview:snakeHead];
        
        [_snakeBodyParts addObject:snakeHead];
    }
    
    return self;
}

- (void)updateBodyPartPositions {
    // Go through all body parts and update their position based on movement to apply to that part
    
    [self.snakeBodyParts enumerateObjectsUsingBlock:^(SBSnakePart *part, NSUInteger idx, BOOL *stop) {
        CGVector movementVector = [part movementVectorForSnakePart];
        [part setFrame:CGRectOffset(part.frame, movementVector.dx, movementVector.dy)];
    }];
    
}

/**
 Respond to request to alter direction of the snake. Apply to one part per frame.
 
 May have to queue up changes - i.e. long snake left swipe then up swipe
 */
- (void)changeSnakeDirection:(SBSnakePartSlitherDirection)slitherDirection {
    currentPartToMove = 0;
    
    // get head part of snake
    SBSnakePart *head = (SBSnakePart *)[self headBodyPart];
    
    [head setSlitherDirection:slitherDirection];
    
    // Next time need to move body part at next index
    currentPartToMove++;
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
    
    UIView *rearBodyPart = [self.snakeBodyParts lastObject];
    
    CGPoint endPoint = CGPointMake(CGRectGetMinX(rearBodyPart.frame) - rearBodyPart.frame.size.width, CGRectGetMinY(rearBodyPart.frame));
    
    SBSnakePart *newTail = [SBSnakePart createSnakeTailAtPoint:endPoint];
    [_superview addSubview:newTail];
    [self.snakeBodyParts addObject:newTail];
}

@end
