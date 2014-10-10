//
//  UIView+SnakeParts.h
//  SnakeGame
//
//  Created by Samuel Burnstone on 10/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBSnakePart;

+ (SBSnakePart *)createSnakeHeadAtPoint:(CGPoint)startPoint;
+ (SBSnakePart *)createSnakeTailAtPoint:(CGPoint)startPoint;

@end
