//
//  UIView+SnakeParts.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBSnakePart.h"

@implementation SBSnakePart

+ (instancetype)new {
    return [[SBSnakePart alloc] init];
}

+ (SBSnakePart *)createSnakeHeadAtPoint:(CGPoint)startPoint {
    SBSnakePart *snakeHead = [SBSnakePart new];
    [snakeHead setFrame:CGRectMake(startPoint.x, startPoint.y, 20.0f, 20.0f)];
    [snakeHead setBackgroundColor:[UIColor colorWithRed:1 green:0.45 blue:0.27 alpha:1]];
    [snakeHead setSlitherDirection:SBSnakePartSlitherDirectionRight];
    
    return snakeHead;
}

+ (SBSnakePart *)createSnakeTailAtPoint:(CGPoint)startPoint{
    SBSnakePart *snakeTail = [SBSnakePart new];
    [snakeTail setFrame:CGRectMake(startPoint.x, startPoint.y, 20.0f, 20.0f)];
    [snakeTail setBackgroundColor:[UIColor colorWithRed:1 green:0.45 blue:0.27 alpha:1]];
    
    return snakeTail;
}

/**
 Based on current movement direction, determine change in position of snake part
 @return The new offset from current position
 */
- (CGVector)movementVectorForSnakePart {
    
    static const CGFloat SLITHER_SPEED = 8.0;

    CGVector movementVector;

    switch (self.slitherDirection) {
                case SBSnakePartSlitherDirectionLeft:
                    movementVector.dx = -1.0;
                    movementVector.dy = 0.0;
                    break;
                case SBSnakePartSlitherDirectionRight:
                    movementVector.dx = 1.0;
                    movementVector.dy = 0.0;
                    break;
            case SBSnakePartSlitherDirectionUp:
                    movementVector.dx = 0.0;
                    movementVector.dy = -1.0;
                    break;
                case SBSnakePartSlitherDirectionDown:
                    movementVector.dx = 0.0;
                    movementVector.dy = 1.0;
                    break;
                default:
                    break;
        }
    
    movementVector.dx *= SLITHER_SPEED;
    movementVector.dy *= SLITHER_SPEED;
    
    return movementVector;
}


@end
