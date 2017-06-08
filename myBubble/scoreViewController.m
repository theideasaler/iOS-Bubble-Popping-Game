//
//  scoreViewController.m
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import "scoreViewController.h"
#import "bridgeViewController.h"
#import "ViewController2.h"
#import "ViewController.h"
#import "dataStore.h"

@interface scoreViewController ()

@end

@implementation scoreViewController

int checkID =0;//set a check ID to check how many times user tried

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _finalScore.text =self.finalPassScore;
    _scoreArray=[NSMutableArray array];
    //store data into a NSMUtableArray by using NSDictionary
    NSDictionary * passedRecord = @{
                                    @"name":self.finalPassName,
                                    @"score":self.finalPassScore
                                    };
    dataScore *dataStored = [[dataScore alloc] init];
    [dataStored getData:passedRecord checkFlag:checkID];
    checkID++;
    NSLog(@"this is the %d try",checkID);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //dataScore *dataStored = [[dataScore alloc] init];
    self.scoreArray = [dataScore passBackData];
    return [self.scoreArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.scoreArray = [dataScore passBackData];

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scoreCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"scoreCell"];
    }
    
    cell.textLabel.text = self.scoreArray[indexPath.row][@"name"];
    
    cell.detailTextLabel.text = self.scoreArray[indexPath.row][@"score"];

        
    return cell;
}   

@end
