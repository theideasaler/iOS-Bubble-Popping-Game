//
//  scoreViewController.h
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "bridgeViewController.h"
#import "ViewController2.h"
#import "ViewController.h"


@interface scoreViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *finalScore;
@property (strong,nonatomic) NSString *finalPassScore;
@property (weak, nonatomic) IBOutlet UITableView *scoreTableView;
@property (strong,nonatomic) NSString *finalPassName;
@property (strong, nonatomic) NSMutableArray *scoreArray;
@end
