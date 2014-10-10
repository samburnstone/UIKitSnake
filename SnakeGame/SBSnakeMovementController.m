//
//  SnakeMovementController.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBSnakeMovementController.h"
#import "SBSnake.h"

@interface SBSnakeMovementController ()

@property (weak, nonatomic) SBSnake *snake;

@end

@implementation SBSnakeMovementController

- (instancetype)initWithSnakeView:(SBSnake *)snake {

    self = [super init];
    
    if (self) {
        _snake = snake;
        
        // Set up gesture recognizers
        [self initGestureRecognizers];
    }
    
    return self;
}

- (void)initGestureRecognizers {
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight)];
    [rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp)];
    [upSwipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDown)];
    [downSwipe setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [_snake.superview addGestureRecognizer:rightSwipe];
    [_snake.superview addGestureRecognizer:leftSwipe];
    [_snake.superview addGestureRecognizer:upSwipe];
    [_snake.superview addGestureRecognizer:downSwipe];
}

- (CGVector)movementVectorForSnake {
    
    static const CGFloat SLITHER_SPEED = 8.0;
    
    CGVector movementVector;
    
    switch (self.snake.slitherDirection) {
        case SBSnakeSlitherDirectionLeft:
            movementVector.dx = -1.0;
            movementVector.dy = 0.0;
            break;
        case SBSnakeSlitherDirectionRight:
            movementVector.dx = 1.0;
            movementVector.dy = 0.0;
            break;
        case SBSnakeSlitherDirectionUp:
            movementVector.dx = 0.0;
            movementVector.dy = -1.0;
            break;
        case SBSnakeSlitherDirectionDown:
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

#pragma mark - Swipe Listeners
- (void)handleSwipeLeft {
    self.snake.slitherDirection = SBSnakeSlitherDirectionLeft;
}

- (void)handleSwipeRight {
    self.snake.slitherDirection = SBSnakeSlitherDirectionRight;
}

- (void)handleSwipeUp {
    self.snake.slitherDirection = SBSnakeSlitherDirectionUp;
}

- (void)handleSwipeDown {
    self.snake.slitherDirection = SBSnakeSlitherDirectionDown;
}

@end
