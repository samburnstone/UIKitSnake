//
//  FoodItemView.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "SBFoodItemView.h"

@implementation SBFoodItemView

- (instancetype)initWithFoodItem:(SBFoodItem)foodItem {
    
    self = [super init];
    
    if (self) {
        UIImage *foodImage = nil;
        
        switch (foodItem) {
            case SBFoodItemDonut:
                foodImage = [UIImage imageNamed:@"Donut"];
                break;
            case SBFoodItemIceCream:
                foodImage = [UIImage imageNamed:@"Ice Cream"];
            default:
                break;
        }
        
        [self setImage:foodImage];
        [self setContentMode:UIViewContentModeScaleAspectFit];
        [self setFrame:CGRectMake(0, 0, 20, 20)];
    }
    
    return self;
}

/**
 Retrieve a random food item
 @return The randomly selected food item
 */
+ (SBFoodItem)randomItem {
    return (SBFoodItem) arc4random_uniform(((int) SBFoodItemIceCream) + 1);
}

@end
