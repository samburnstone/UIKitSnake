//
//  GameOverViewController.m
//  SnakeGame
//
//  Created by Samuel Burnstone on 13/10/2014.
//  Copyright (c) 2014 Samuel Burnstone. All rights reserved.
//

#import "GameOverViewController.h"

@interface GameOverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *finalScoreLabel;

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.finalScoreLabel setText:[NSString stringWithFormat:@"Score: %li", (long)self.playerScore]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnToMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
