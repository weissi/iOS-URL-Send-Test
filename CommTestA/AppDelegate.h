//
//  AppDelegate.h
//  CommTestA
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SendDataViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    SendDataViewController *sendDataVC;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SendDataViewController *sendDataVC;

@end
