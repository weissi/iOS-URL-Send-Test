//
//  ShowDataViewController.h
//  CommTestA
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDataViewController : UIViewController {
    UIImageView *imageView;
    UITextView *textView;
    NSString *text;
    NSData *imageData;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSData *imageData;

- (void)showDataForURL:(NSURL *)url;

@end
