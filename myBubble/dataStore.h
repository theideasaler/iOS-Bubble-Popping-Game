//
//  dataStore.h
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface dataScore: NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *highestScore;
@property (nonatomic, strong) NSNumber *userScore;
@property (nonatomic, strong) NSDictionary *tempData;

+(NSMutableArray *) passBackData;
+(NSString *) passBackHighest;
-(void) getData:(NSDictionary *)receivedData checkFlag:(int)flagNumber;
@end
