//
//  AppDelegate.h
//  myBubble
//
//  Created by Rock_Neo on 13/5/17.
//  Copyright © 2017 Rock_Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

