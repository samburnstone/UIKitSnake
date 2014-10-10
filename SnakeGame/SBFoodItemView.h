//
//  FoodItemView.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, SBFoodItem) {
    SBFoodItemDonut = 0,
    SBFoodItemIceCream
};

@interface SBFoodItemView : UIImageView

- (instancetype)initWithFoodItem:(SBFoodItem)foodItem;

+ (SBFoodItem)randomItem;

@end
