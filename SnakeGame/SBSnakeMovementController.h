//
//  SnakeMovementController.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SBSnake;

@interface SBSnakeMovementController : NSObject

- (instancetype)initWithSnakeView:(SBSnake *)snake;

@end
