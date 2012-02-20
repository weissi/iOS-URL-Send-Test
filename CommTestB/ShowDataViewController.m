//
//  ShowDataViewController.m
//  CommTestA
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShowDataViewController.h"

#import "NSData+Conversion.h"

@implementation ShowDataViewController

@synthesize imageView;
@synthesize textView;
@synthesize text;
@synthesize imageData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)updateTextView
{
    if (self.textView != nil) {
        self.textView.text = self.text == nil ? @"n/a" : self.text;
    }
}

- (void)updateImageView
{
    if (self.imageView != nil && self.imageData != nil) {
        NSLog(@"showing image...");
        self.imageView.image = [UIImage imageWithData:self.imageData];
    }
}

- (void)showDataForURL:(NSURL *)url
{
    NSString *type = url.host;
    NSString *strData = [url.path substringFromIndex:1];
    NSLog(@"showing data type: %@", type);
    if ([type isEqualToString:@"text"]) {
        self.text = strData;
        
        [self updateTextView];
    } else if([type isEqualToString:@"image"]) {
        self.imageData = [NSData dataFromHexadecimalString:strData];
        
        [self updateImageView];
    } else {
        NSLog(@"Unknown data type: %@", url.host);
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect textViewFrame = CGRectMake(0, 0, 400, 400);
    self.textView = [[UITextView alloc] initWithFrame:textViewFrame];
    self.textView.editable = NO;
    
    CGRect imageViewFrame = CGRectMake(0, 400, 400, 400);
    self.imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    
    [self updateTextView];
    [self updateImageView];

    self.view = [[UIView alloc] init];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.imageView];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
