//
//  RootViewController.h
//  Assignment 3
//
//  Created by Kevin on 10/26/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface RootViewController : UITabBarController

@property (strong, nonatomic) NSString *selectedNumber;
@property (strong, nonatomic) NSString *selectedSuit;
@property (strong, nonatomic) NSString *correctNumber;
@property (strong, nonatomic) NSString *correctSuit;
@property (nonatomic) int attempts;
@property (strong, nonatomic) NSArray *numbers;
@property (strong, nonatomic) NSArray *suits;

- (void)setSelectedNumber: (NSString *)number
                   andSuit: (NSString *)suit;
- (BOOL)checkGuess;
- (NSString *)getSelectedNumber;
- (NSString *)getSelectedSuit;
- (NSString *)getCorrectNumber;
- (NSString *)getCorrectSuit;
- (int)getAttempts;
- (void)playWinSound;
@end

@interface UIApplication (extended)
- (void) terminateWithSuccess;
@end