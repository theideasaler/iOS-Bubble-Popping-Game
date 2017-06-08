//
//  ViewController.m
//  myBubble
//
//  Created by Wei Liu on 17/5/17.
//  Copyright © 2017 Wei Liu. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "bridgeViewController.h"
#import "scoreViewController.h"
#import "dataStore.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timeSettings;
@synthesize bubbleSettings;



- (void)viewDidLoad {
    [super viewDidLoad];
    //get the initial setting values from the ViewController2
        self.highestScore.text = [dataScore passBackHighest];
    int timeSetting = timeSettings.intValue;
    int bubbleSetting = bubbleSettings.intValue;
    self.time.text = [NSString stringWithFormat:@"%d",timeSetting];
    NSLog(@"Time is: %ds",timeSetting);
    NSLog(@"Maximum bubble number is: %d",bubbleSetting);
    NSLog(@"Your name is: %@",_nameSettings);



    [self bubbleCreat:bubbleSetting];//creat initial bubbles
    //set timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeTick) userInfo:nil repeats:YES];
    
}

- (void) addScoreClicked:(id) sender{//method used to check the color and score
    NSString *scoreText= self.scoreClick.text;
    UIButton *checkBubble = sender;
    
    if(checkBubble.backgroundColor == [UIColor redColor]){
        //add one mark when it is red
        if(_oldButton.backgroundColor==checkBubble.backgroundColor){//if the previous bubble has the same color
            int s = [scoreText intValue];
            s=s+2;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;

        }else {
            int s = [scoreText intValue];
            s=s+1;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
        }
        [checkBubble removeFromSuperview];
       
    }else if(checkBubble.backgroundColor == [UIColor greenColor]){
        //add 5 marks when it is green
        if(_oldButton.backgroundColor==checkBubble.backgroundColor){//if the previous bubble has the same color
            int s = [scoreText intValue];
            s=s+8;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
            
        }else {
            int s = [scoreText intValue];
            s=s+5;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
        }
        [checkBubble removeFromSuperview];

    }else if(checkBubble.backgroundColor == [UIColor blueColor]){
        //add 8 marks when it is blue
        if(_oldButton.backgroundColor==checkBubble.backgroundColor){//if the previous bubble has the same color
            int s = [scoreText intValue];
            s=s+12;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
            
        }else {
            int s = [scoreText intValue];
            s=s+8;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
        }
        [checkBubble removeFromSuperview];

    }else if(checkBubble.backgroundColor == [UIColor blackColor]){
        //add 10 marks when it is black
        if(_oldButton.backgroundColor==checkBubble.backgroundColor){//if the previous bubble has the same color
            int s = [scoreText intValue];
            s=s+15;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
            
        }else {
            int s = [scoreText intValue];
            s=s+10;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
        }
        [checkBubble removeFromSuperview];

    }else {
        //add 2 marks when it is pink
        if([_oldButton.backgroundColor isEqual:checkBubble.backgroundColor]){//if the previous bubble has the same color
            int s = [scoreText intValue];
            s=s+3;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
            
        }else {
            int s = [scoreText intValue];
            s=s+2;
            self.scoreClick.text = [NSString stringWithFormat:@"%d", s];
            _oldButton = checkBubble;
        }
        [checkBubble removeFromSuperview];


    }
}

+ (UIColor *) bubbleColor: (int) colorCheck{//method used to distribute the probability of different colors
    if (colorCheck < 8) {
        // 8/20 = 40% probability of red color
        return [UIColor redColor];
    }// 6/20 = 30% probability
    else if (7 < colorCheck && colorCheck < 14) {
        //Customized a pink color
        UIColor * pinkColor = [[UIColor alloc] initWithRed:1 green:0.42 blue:0.52 alpha:1];
        return pinkColor;
    }
    // 3/20 = 15% probability
    else if (13 < colorCheck && colorCheck < 17) {
        return [UIColor greenColor];
    }
    // 2/20 = 20% probability
    else if (16 < colorCheck && colorCheck < 19) {
        return [UIColor blueColor];
    }
    // 1/20 = 5% probability
    else return [UIColor blackColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timeTick{
    NSString *time = self.time.text;
    int t = [time intValue];
    //clear previous bubbles before creat new bubbles
    for(UIButton *b in self.cacheArray){
        [b removeFromSuperview];
    };
    
    if(t>0){
        t=t-1;
        self.time.text = [NSString stringWithFormat:@"%d",t];
        NSLog(@"%d seconds left",t);
        [self bubbleCreat:bubbleSettings.intValue];
    }else {
        
        [self performSegueWithIdentifier:@"showScore" sender:self];
        [timer invalidate];
    };
    
    
}
-(void)bubbleCreat:(int) maxB{//method used to creat bubbles
    int i=0;
    NSInteger temporyX[maxB];//set up Array to store coordinates of bubbles
    NSInteger temporyY[15];
    NSInteger widthTotal[maxB];//set up Array to store the width of bubbles
    int colorCheck=0;
    NSMutableArray *bubbleArray = [NSMutableArray array];
    
    while(i<maxB){
        UIButton * bubbleImage =[[UIButton alloc] init];
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        //Creat bubbles
        int bubbleWidth = (arc4random() % 70) + 50;
        int bubbleX = arc4random() % ((int)screenSize.width - bubbleWidth);
        int bubbleY = arc4random() % ((int)screenSize.height - bubbleWidth);
        CGRect newBubble = CGRectMake(bubbleX, bubbleY, bubbleWidth, bubbleWidth);
        bubbleImage.frame = newBubble;
        bubbleImage.layer.cornerRadius = bubbleWidth*0.5;
        
        if (i==0){//store the coordinates of the first bubble
            temporyX[i] = bubbleX;
            temporyY[i] = bubbleY;
            widthTotal[i] = bubbleWidth;
            colorCheck = arc4random_uniform(20);
            UIColor *randomColor = [[self class] bubbleColor:colorCheck];//color check
            [bubbleImage setBackgroundColor:randomColor];
            
            [self.view addSubview:bubbleImage];
            [bubbleImage addTarget:self action:@selector(addScoreClicked:) forControlEvents:UIControlEventTouchUpInside];
            [bubbleArray addObject:bubbleImage];
            i++;
            NSLog(@"the length of total is: %d the width is : %d", (int)[bubbleArray count], (int)widthTotal[i-1]);
            self.scoreClick.layer.zPosition = MAXFLOAT;
            self.score.layer.zPosition = MAXFLOAT;
            self.time.layer.zPosition = MAXFLOAT;
            self.timeCount.layer.zPosition = MAXFLOAT;
            self.highestScore.layer.zPosition = MAXFLOAT;
            self.highestLabel.layer.zPosition = MAXFLOAT;
            
            
        }else{
            //set the flag to mark the overlap status
            int checkOverlap = 1;
            for (int flag=0;flag<i;flag++){
                int c = (int)widthTotal[flag]*0.5;
                int a = (int)temporyX[flag]+c;
                int b = (int)temporyY[flag]+c;
                int check1 = (bubbleX+bubbleWidth*0.5-a) * (bubbleX+bubbleWidth*0.5-a);
                int check2 = (bubbleY+bubbleWidth*0.5-b) * (bubbleY+bubbleWidth*0.5-b);
                int check3 = (bubbleWidth*0.5+c) * (bubbleWidth*0.5+c);
                if(check3>(check1+check2)){
                    checkOverlap=0;
                }
                
            }
            if (checkOverlap){
                temporyX[i] = bubbleX;
                temporyY[i] = bubbleY;
                widthTotal[i] = bubbleWidth;
                colorCheck = arc4random_uniform(20);
                UIColor *randomColor = [[self class] bubbleColor:colorCheck];//color check
                [bubbleImage setBackgroundColor:randomColor];
                
                [self.view addSubview:bubbleImage];
                [bubbleImage addTarget:self action:@selector(addScoreClicked:) forControlEvents:UIControlEventTouchUpInside];
                [bubbleArray addObject:bubbleImage];
                widthTotal[i] = bubbleWidth;
                i++;
                NSLog(@"the length of total is: %d the width is : %d", (int)[bubbleArray count], (int)widthTotal[i-1]);
                self.scoreClick.layer.zPosition = MAXFLOAT;
                self.score.layer.zPosition = MAXFLOAT;
                self.time.layer.zPosition = MAXFLOAT;
                self.timeCount.layer.zPosition = MAXFLOAT;
                self.highestScore.layer.zPosition = MAXFLOAT;
                self.highestLabel.layer.zPosition = MAXFLOAT;
                
            }
            
        };
    }

    self.cacheArray = bubbleArray;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    scoreViewController * passScore = segue.destinationViewController;
    [_passArray addObject:self.scoreClick.text];
    [_passArray addObject:self.nameSettings];

    passScore.finalPassScore = self.scoreClick.text;
    passScore.finalPassName = self.nameSettings;

    
}

@end
