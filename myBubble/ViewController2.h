//
//  ViewController2.h
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "bridgeViewController.h"
#import "ViewController.h"

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UISlider *bubbleSlider;

-(IBAction)displayName;
-(IBAction)displaySliderValue;
@end
