//
//  ViewController.m
//  Multiply
//
//  Created by malcolm on 10/2/14.
//  Copyright (c) 2014 parry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    int finalNumber;
    
    int localNumber = [self.numberTextField.text intValue];
    int localNumberTwo = [self.multiplierLabel.text intValue];
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        int finalNumber = localNumber * localNumberTwo;
        self.answerLabel.text = [NSString stringWithFormat:@"%d",finalNumber];

    }else{
        int finalNumber = localNumber / localNumberTwo;
        self.answerLabel.text = [NSString stringWithFormat:@"%d",finalNumber];
    }
    
    if (finalNumber >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if(finalNumber % 3 == 0 && finalNumber % 5 == 0) {
        self.answerLabel.text = @"fizzbuzz";
    }else if (finalNumber % 3 == 0) {
        self.answerLabel.text = @"fizz";
    }else if (finalNumber % 5 == 0) {
        self.answerLabel.text = @"buzz";
    }else{
        self.answerLabel.text = [NSString stringWithFormat:@"%d",finalNumber];
    }
    
    [self.numberTextField resignFirstResponder];
    
}

- (IBAction)onMultiplierSlider:(UISlider *)sender {
    int round = roundf(sender.value);
    if (round >=0 || round <=10) {
        self.multiplierLabel.text = [NSString stringWithFormat:@"%d", round];
    }
    
}


@end
