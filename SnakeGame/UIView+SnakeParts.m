//
//  UIView+SnakeParts.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "UIView+SnakeParts.h"

@implementation SBSnakePart

+ (UIView *)createSnakeHeadAtPoint:(CGPoint)startPoint {
    UIView *snakeHead = [UIView new];
    [snakeHead setFrame:CGRectMake(startPoint.x, startPoint.y, 20.0f, 20.0f)];
    [snakeHead setBackgroundColor:[UIColor colorWithRed:1 green:0.45 blue:0.27 alpha:1]];
    
    return snakeHead;
}

+ (UIView *)createSnakeTailAtPoint:(CGPoint)startPoint{
    UIView *snakeTail = [UIView new];
    [snakeTail setFrame:CGRectMake(startPoint.x, startPoint.y, 20.0f, 20.0f)];
    [snakeTail setBackgroundColor:[UIColor colorWithRed:1 green:0.45 blue:0.27 alpha:1]];
    
    return snakeTail;
}



@end
