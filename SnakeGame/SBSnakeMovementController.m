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

#pragma mark - Swipe Listeners
- (void)handleSwipeLeft {
    [self.snake changeSnakeDirection:SBSnakePartSlitherDirectionLeft];
}

- (void)handleSwipeRight {
    [self.snake changeSnakeDirection:SBSnakePartSlitherDirectionRight];
}

- (void)handleSwipeUp {
    [self.snake changeSnakeDirection:SBSnakePartSlitherDirectionUp];
}

- (void)handleSwipeDown {
    [self.snake changeSnakeDirection:SBSnakePartSlitherDirectionDown];
}

@end
