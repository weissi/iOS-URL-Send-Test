//
//  AppDelegate.h
//  CommTestB
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShowDataViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    ShowDataViewController *showDataVC;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ShowDataViewController *showDataVC;

@end
