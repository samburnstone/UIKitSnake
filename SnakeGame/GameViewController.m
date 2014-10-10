//
//  GameViewController.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "GameViewController.h"

#import "SBSnake.h"
#import "SBFoodItemSpawner.h"
#import "SBFoodItemView.h"
#import "SBSnakeMovementController.h"

@interface GameViewController () {
    NSTimer *gameUpdateTimer;
    NSTimer *foodSpawnTimer;
    
    NSUInteger score;
}

// The area the snake can move freely within
@property (weak, nonatomic) IBOutlet UIView *gameStageView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) SBSnake *snake;
@property (strong, nonatomic) SBFoodItemSpawner *foodItemSpawner;
@property (strong, nonatomic) SBSnakeMovementController *snakeMovementController;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    score = 0;
    [self updateScoreDisplay];

    // Create and add the snake to the view
    self.snake = [[SBSnake alloc] initWithGameView:_gameStageView atStartingPos:CGPointMake(0, 0)];
    self.snake.slitherDirection = SBSnakeSlitherDirectionRight;
    
    self.snakeMovementController = [[SBSnakeMovementController alloc] initWithSnakeView:_snake];
    
    // Create array to hold spawned food items
    self.foodItemSpawner = [[SBFoodItemSpawner alloc] initWithGameStageView:_gameStageView];
    
    // Start timer that will update game screen
    gameUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateFrame) userInfo:nil repeats:YES];
    foodSpawnTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.foodItemSpawner selector:@selector(spawnFoodItem) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 Updates the score label
 */
- (void)updateScoreDisplay {
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %li", (long)score]];
}

#pragma mark - Game Logic
/**
 Moves position of game elements. Called every set interval by gameUpdateTimer
 */
- (void)updateFrame {
    CGVector movementDirection = [_snakeMovementController movementVectorForSnake];
    [self.snake moveByVector:movementDirection];
    
    [self checkForSnakeCollisionWithEdges];
    [self checkForCollisionWithFoodItems];
    
    // Update game score label
    [self updateScoreDisplay];
}

#pragma mark - Collision Methods
/**
 Checks snake hasn't gone off edge of view.
 */
- (void)checkForSnakeCollisionWithEdges {
    
    UIView *headPart = [self.snake headBodyPart];
    
    CGFloat maxX = CGRectGetMaxX(headPart.frame);
    CGFloat minX = CGRectGetMinX(headPart.frame);
    CGFloat maxY = CGRectGetMaxY(headPart.frame);
    CGFloat minY = CGRectGetMinY(headPart.frame);
    
    CGFloat gameStageViewWidth = CGRectGetMaxX(_gameStageView.bounds);
    CGFloat gameStageViewHeight = CGRectGetMaxY(_gameStageView.bounds);
    
    if (minX < 0 || maxX > gameStageViewWidth || minY < 0 || maxY > gameStageViewHeight) {
        /** GAME OVER **/
        NSLog(@"Game over!!");
        
        [self disableTimers];
    }
}

/**
 Enumerates through all food items currently on screen.
 Determines whether player has collided with an item.
 */
- (void)checkForCollisionWithFoodItems {
    
    NSArray *foodItemsOnScreen = [self.foodItemSpawner.foodItemsOnScreen copy];
    
    static const NSUInteger FOOD_PICKUP_SCORE = 10;
    
    [foodItemsOnScreen enumerateObjectsUsingBlock:^(SBFoodItemView *foodItem, NSUInteger idx, BOOL *stop) {
        if (CGRectIntersectsRect(foodItem.frame, [_snake headBodyPart].frame)) {
            // Picked up food item
            [self.foodItemSpawner removeFoodItem:foodItem];
            
            // Increase score
            score += FOOD_PICKUP_SCORE;
            
            // Append new tail part to snake
            [self.snake appendBodyPart];
        }
    }];
    
}

#pragma mark - Game Over methods
/**
 Stop timers from running. Prevents snake from moving and new food items being spawned
 */
- (void)disableTimers {
    [gameUpdateTimer invalidate];
    [foodSpawnTimer invalidate];
}

@end
