//
//  bridgeViewController.h
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface bridgeViewController : UIViewController{
    NSTimer *countTimer;
}
@property (weak, nonatomic) IBOutlet UILabel *countNum;
-(void)timeCount;

@end
