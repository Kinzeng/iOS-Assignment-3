//
//  RootViewController.m
//  Assignment 3
//
//  Created by Kevin on 10/26/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "RootViewController.h"
#import "UnlockItViewController.h"
#import "CheckItViewController.h"
#import "HintViewController.h"

@interface RootViewController () <UITabBarControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize the variables needed
    self.delegate = self;
    self.selectedNumber = @"One of";
    self.selectedSuit = @"Diamonds";
    self.numbers = @[@"One of", @"Two of", @"Three of", @"Four of", @"Five of", @"Six of", @"Seven of", @"Eight of", @"Nine of", @"Ten of", @"Jack of", @"Queen of", @"King of"];
    self.suits = @[@"Diamonds", @"Clubs", @"Hearts", @"Spades"];
    srand((unsigned)time(NULL));
    self.correctNumber = self.numbers[rand() % 13];
    self.correctSuit = self.suits[rand() % 4];
}

//update the selected number
- (void)setSelectedNumber: (NSString *)number
                  andSuit: (NSString *)suit {
    self.selectedNumber = number;
    self.selectedSuit = suit;
}

- (NSString *)getSelectedNumber {
    return self.selectedNumber;
}

- (NSString *)getSelectedSuit {
    return self.selectedSuit;
}

- (NSString *)getCorrectNumber {
    return self.correctNumber;
}

- (NSString *)getCorrectSuit {
    return self.correctSuit;
}

- (int)getAttempts {
    return self.attempts;
}

//check if the selected card is correct
- (BOOL)checkGuess {
    if ([self.selectedNumber isEqualToString: self.correctNumber] && [self.selectedSuit isEqualToString: self.correctSuit])
         return YES;
    else return NO;
}

//quit the application
- (void)terminateApplication {
    [[UIApplication sharedApplication] terminateWithSuccess];
}

//play the sound when the user guesses correctly
-(void)playWinSound
{
    SystemSoundID winSoundID;
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win"
                                                  withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &winSoundID);
    AudioServicesPlaySystemSound(winSoundID);
    [self performSelector: @selector(terminateApplication)
               withObject: nil
               afterDelay: 4.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//add to the number of attempts each time the user switches to the Check It tab
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController.title isEqualToString: @"Check It"]) {
        self.attempts++;
    }
}

@end
