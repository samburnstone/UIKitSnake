//
//  FoodSpawner.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SBFoodItemView;

@interface SBFoodItemSpawner : NSObject

// Properties
@property (strong, nonatomic) NSMutableArray *foodItemsOnScreen;

/** Methods **/
// Designated initializer
- (instancetype)initWithGameStageView:(UIView *)gameStageView;

// Spawn food items in randomised positions
- (void)spawnFoodItem;
// Remove food item from view
- (void)removeFoodItem:(SBFoodItemView *)item;

@end
