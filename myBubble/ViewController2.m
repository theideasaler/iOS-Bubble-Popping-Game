//
//  ViewController2.m
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import "ViewController.h"
#import "ViewController2.h"
#import "bridgeViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)displayName{
    NSString *nameText = self.userName.text;
    NSLog(@"Your Name is: %@",nameText);
};

-(void)hideKeyboard{
    [self.userName resignFirstResponder];
};
-(void)displaySliderValue{
    self.timeLabel.text = [NSString stringWithFormat:@"%ds", (int)self.timeSlider.value];
    self.numLabel.text = [NSString stringWithFormat:@"%d", (int)self.bubbleSlider.value];
}
//-(void)passData{
//    NSString *simpleTest = @"this is a test";
//    ViewController * inputInstance = [[ViewController alloc]init];
//    
//    inputInstance.dataPass = simpleTest;
//    [[self navigationController] pushViewController:inputInstance animated:YES];
//    
//
//}
@end
