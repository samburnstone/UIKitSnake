//
//  SBSnakeView.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SBSnakeSlitherDirection) {
    SBSnakeSlitherDirectionLeft,
    SBSnakeSlitherDirectionRight,
    SBSnakeSlitherDirectionUp,
    SBSnakeSlitherDirectionDown
};

@interface SBSnake : NSObject

@property (assign, nonatomic) SBSnakeSlitherDirection slitherDirection;
@property (weak, nonatomic) UIView *superview;
@property (strong, nonatomic) NSMutableArray *snakeBodyParts;

- (instancetype)initWithGameView:(UIView *)gameStage atStartingPos:(CGPoint)startPoint;

- (void)moveByVector:(CGVector)movementDirection;

- (UIView *)headBodyPart;
- (void)appendBodyPart;

@end
