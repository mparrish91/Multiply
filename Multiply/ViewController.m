//
//  ViewController.m
//  Multiply
//
//  Created by malcolm on 10/2/14.
//  Copyright (c) 2014 parry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property (weak, nonatomic) IBOutlet UISlider *numberSlider;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //pass slider value to multiplierLabel each time view loads
    int value = self.numberSlider.value;
    NSString *stringValue = [NSNumber numberWithInt:value].description;
    self.multiplierLabel.text = stringValue;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    int result;
    
    int localNumber = [self.numberTextField.text intValue];
    int localNumberTwo = self.numberSlider.value;
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        int result = localNumber * localNumberTwo;
        self.answerLabel.text = [NSString stringWithFormat:@"%d",result];

    }else{
        int result = localNumber / localNumberTwo;
        self.answerLabel.text = [NSString stringWithFormat:@"%d",result];
    }
    
    if (result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if(result % 3 == 0 && result % 5 == 0) {
        self.answerLabel.text = @"fizzbuzz";
    }else if (result % 3 == 0) {
        self.answerLabel.text = @"fizz";
    }else if (result % 5 == 0) {
        self.answerLabel.text = @"buzz";
    }
    
//    [self.view endEditing:YES];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.numberTextField endEditing:YES];
}

- (IBAction)sliderValueChanged:(id *)sender {
    int value = self.numberSlider.value;
    NSString *stringValue = [NSNumber numberWithInt:value].description;
    self.multiplierLabel.text = stringValue;
}
    



@end
