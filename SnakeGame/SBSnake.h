//
//  SBSnakeView.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SBSnakePart.h"

@interface SBSnake : NSObject

@property (weak, nonatomic) UIView *superview;
@property (strong, nonatomic) NSMutableArray *snakeBodyParts;

- (instancetype)initWithGameView:(UIView *)gameStage atStartingPos:(CGPoint)startPoint;

- (void)changeSnakeDirection:(SBSnakePartSlitherDirection)slitherDirection;

- (void)updateBodyPartPositions;
- (SBSnakePart *)headBodyPart;
- (void)appendBodyPart;

@end
