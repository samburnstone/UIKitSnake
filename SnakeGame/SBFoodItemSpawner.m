//
//  FoodSpawner.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBFoodItemSpawner.h"
#import "SBFoodItemView.h"

@interface SBFoodItemSpawner ()

@property (weak, nonatomic) UIView *gameStageView;

@end

@implementation SBFoodItemSpawner

/**
 Instantiate SBFoodItemSpawner instance. Requires the game view that each food item should be drawn on.
 @param gameStageView The game view the food items are to be drawn upon
 */
- (instancetype)initWithGameStageView:(UIView *)gameStageView {
    self = [super init];
    
    if (self) {
        _gameStageView = gameStageView;
        _foodItemsOnScreen = [NSMutableArray array];
    }
    
    return self;
}

/**
 Spawns a randomised food item in a random position. Adds this to the view passed in on initialisation
 */
- (void)spawnFoodItem {
    
    // Create a random food item
    SBFoodItemView *foodItem = [[SBFoodItemView alloc] initWithFoodItem:[SBFoodItemView randomItem]];
    
    // Spawn in random position
    UInt32 width = CGRectGetWidth(_gameStageView.frame) - foodItem.frame.size.width; // Make sure item doesn't overlap edge
    CGFloat randX = arc4random_uniform(width);
    
    UInt32 height = CGRectGetHeight(_gameStageView.frame) - foodItem.frame.size.height; // Likewise for the height
    CGFloat randY = arc4random_uniform(height);
    
    // Set frame to random position
    [foodItem setFrame:CGRectMake(randX, randY, foodItem.frame.size.width, foodItem.frame.size.height)];
    
    [self.foodItemsOnScreen addObject:foodItem];
    
    [self.gameStageView addSubview:foodItem];
}

/**
 Remove food item from the game stage
 @param item SBFoodItem to remove from the view
 */
- (void)removeFoodItem:(SBFoodItemView *)item {
    [self.foodItemsOnScreen removeObject:item];
    [item removeFromSuperview];
}

@end
