//
//  UnlockItViewController.m
//  Assignment 3
//
//  Created by Kevin on 10/26/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "UnlockItViewController.h"
#import "RootViewController.h"

@interface UnlockItViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *numbers;
@property (strong, nonatomic) NSArray *suits;
@property (strong, nonatomic) NSArray *suitStrings;
@property (strong, nonatomic) NSString *currentNumber;
@property (strong, nonatomic) NSString *currentSuit;

@end

@implementation UnlockItViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numbers = @[@"One of", @"Two of", @"Three of", @"Four of", @"Five of", @"Six of", @"Seven of", @"Eight of", @"Nine of", @"Ten of", @"Jack of", @"Queen of", @"King of"];
    self.suits = @[[UIImage imageNamed: @"diamonds"],
                   [UIImage imageNamed: @"clubs"],
                   [UIImage imageNamed: @"hearts"],
                   [UIImage imageNamed: @"spades"]];
    self.suitStrings = @[@"Diamonds", @"Clubs", @"Hearts", @"Spades"];
    self.currentNumber = @"One of";
    self.currentSuit = @"Diamonds";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//update the selected card when the view is going to change
- (void)viewWillDisappear:(BOOL)animated {
    RootViewController *root = (RootViewController *)[self parentViewController];
    [root setSelectedNumber: self.currentNumber andSuit: self.currentSuit];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) return [self.numbers count];
    else                return [self.suits count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    if (component == 0) {
        UILabel *labelView = [[UILabel alloc] init];
        labelView.text = self.numbers[row];
        return labelView;
    }
    else {
        UIImage *image = self.suits[row];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
        return imageView;
    }
}

//update the current card each time the picker changes
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    if (component == 0) self.currentNumber = self.numbers[row];
    else                self.currentSuit   = self.suitStrings[row];
}

@end
