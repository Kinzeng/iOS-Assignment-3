//
//  SecondViewController.m
//  Assignment 3
//
//  Created by Kevin on 10/25/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "CheckItViewController.h"
#import "RootViewController.h"

@interface CheckItViewController ()

@end

@implementation CheckItViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//update all the text fields and play the win sound accordingly
- (void)viewDidAppear:(BOOL)animated {
    RootViewController* root = (RootViewController *)[self parentViewController];
    
    self.checkLabel.text = [NSString stringWithFormat: @"You picked %@ %@", [root getSelectedNumber], [root getSelectedSuit]];
    
    if ([root checkGuess]) {
        self.correctLabel.text = @"And it's correct! Congratulations!";
        [root playWinSound];
    }
    else {
        self.correctLabel.text = @"But it's wrong. Try again.";
    }
    
    self.numberLabel.text = [NSString stringWithFormat: @"You've guessed %d times", [root getAttempts]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
