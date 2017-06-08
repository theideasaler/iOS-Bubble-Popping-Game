//
//  bridgeViewController.m
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import "ViewController.h"
#import "ViewController2.h"
#import "bridgeViewController.h"

@interface bridgeViewController ()

@end

@implementation bridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    countTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)timeCount{//centre number countdown
    NSString *display = self.countNum.text;
    int countNumber = [display intValue];
    NSLog(@"%d",countNumber);
    if(countNumber>1){
        countNumber = countNumber-1;

        self.countNum.text = [NSString stringWithFormat:@"%d", countNumber];
        
    }else if(countNumber==1) {
        countNumber = countNumber-1;
        self.countNum.text = @"GO!";
       
    }else {//call the bubble ViewController programatically when the number is 0
        
        [self performSegueWithIdentifier:@"startGame" sender:self];
        [countTimer invalidate];}
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController2 *settings = (ViewController2 *)self.presentingViewController;
    ViewController *game = segue.destinationViewController;
    game.timeSettings = [NSString stringWithFormat:@"%d", (int)settings.timeSlider.value];
    game.bubbleSettings = [NSString stringWithFormat:@"%d", (int)settings.bubbleSlider.value];
    game.nameSettings = settings.userName.text;
    //NSLog(@"%f",settings.timeSlider.value);
    
}

@end
