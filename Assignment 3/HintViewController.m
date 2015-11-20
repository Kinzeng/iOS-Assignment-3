//
//  HintViewController.m
//  Assignment 3
//
//  Created by Kevin on 10/26/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "RootViewController.h"
#import "HintViewController.h"

@interface HintViewController ()

@property (weak, nonatomic) IBOutlet UILabel *hintLabel;
@property (weak, nonatomic) IBOutlet UIButton *showButton;

@end

@implementation HintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//update the label to the correct card
- (void)viewDidAppear:(BOOL)animated {
    self.hintLabel.text = @"";
}

- (IBAction)showPressed:(id)sender {
    RootViewController *root = (RootViewController *)[self parentViewController];
    self.hintLabel.text = [NSString stringWithFormat: @"The correct card is %@ %@", [root getCorrectNumber], [root getCorrectSuit]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
