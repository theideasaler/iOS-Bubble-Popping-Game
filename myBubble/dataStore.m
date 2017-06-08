//
//  dataStore.m
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//


#import "dataStore.h"
@interface dataScore ()

@end

static NSMutableArray *backData;//set a static Array to store data
static NSString *highestScore = 0;//set a static value to store highest score
@implementation dataScore


+(NSMutableArray *) passBackData{
    return backData;
}
-(void)getData:(NSDictionary *)receivedData checkFlag:(int)flagNumber{
    if(flagNumber==0){//store the initial data if  it is the 1st try
        backData = [NSMutableArray array];
        [backData addObject:receivedData];
        highestScore = receivedData[@"score"];
        NSLog(@"1you have stored %d data",(int)[backData count]);
        NSLog(@"1your highest score is %d",highestScore.intValue);
        
    }else{//change the static value if there are more/new data
        NSString *scoreCompare = receivedData[@"score"];
        if(scoreCompare.intValue >highestScore.intValue){
            highestScore = scoreCompare;
        };
        [backData addObject:receivedData];
        NSLog(@"2you have stored %d data",(int)[backData count]);
        NSLog(@"2your highest score is %d",highestScore.intValue);
    };
    
}
+(NSString *)passBackHighest{
    return highestScore;
}
@end


