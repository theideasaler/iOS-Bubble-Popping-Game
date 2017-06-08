//
//  ViewController.h
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "bridgeViewController.h"
#import "ViewController2.h"
#import "scoreViewController.h"


@interface ViewController : UIViewController{
    NSTimer *timer;
    NSTimer *timer2;

}

@property (weak, nonatomic) IBOutlet UILabel *scoreClick;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (nonatomic,strong) UIButton *oldButton;
@property (weak, nonatomic) IBOutlet UILabel *timeCount;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (nonatomic,strong) NSMutableArray *cacheArray;
@property (nonatomic,strong) NSString *timeSettings;
@property (nonatomic,strong) NSString *bubbleSettings;
@property (nonatomic,strong) NSString *nameSettings;
@property (nonatomic,strong) NSMutableArray *passArray;
@property (weak, nonatomic) IBOutlet UILabel *highestScore;
@property (weak, nonatomic) IBOutlet UILabel *highestLabel;


+ (UIColor *) bubbleColor: (int) colorCheck;
-(void) timeTick;
-(void) bubbleCreat:(int) maxB;

@end

