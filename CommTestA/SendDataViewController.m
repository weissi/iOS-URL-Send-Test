//
//  SendDataViewController.m
//  CommTestA
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SendDataViewController.h"
#import "NSData+Conversion.h"

@implementation SendDataViewController

@synthesize textBox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Send data

- (void)sendData:(NSString *)data type:(NSString *)type
{
    NSURL *url = [[NSURL alloc] initWithScheme:@"CommTest"
                                          host:type
                                          path:[NSString stringWithFormat:@"/%@",
                                                data]];
    BOOL success = [[UIApplication sharedApplication] openURL:url];
    
    NSLog(@"data sent, success=%@", success ? @"YES" : @"NO");
}

- (void)sendText
{
    [self sendData:self.textBox.text type:@"text"];
}

- (void)sendImage
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"tux" ofType:@"jpg"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *strData = [data hexadecimalString];
    
    [self sendData:strData type:@"image"];
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect textButtonFrame = CGRectMake(0, 300, 400, 50);
    UIButton *sendTextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendTextButton setTitle:@"Send Text" forState:UIControlStateNormal];
    [sendTextButton addTarget:self
                   action:@selector(sendText)
         forControlEvents:UIControlEventTouchUpInside];
    sendTextButton.frame = textButtonFrame;
    
    CGRect imageButtonFrame = CGRectMake(0, 350, 400, 50);
    UIButton *sendImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendImageButton setTitle:@"Send Image" forState:UIControlStateNormal];
    [sendImageButton addTarget:self
                        action:@selector(sendImage)
              forControlEvents:UIControlEventTouchUpInside];
    sendImageButton.frame = imageButtonFrame;
    
    CGRect textBoxFrame = CGRectMake(0, 0, 400, 300);
    self.textBox = [[UITextView alloc] initWithFrame:textBoxFrame];
    self.textBox.backgroundColor = [UIColor lightGrayColor];
    self.textBox.text = @"sample text...\nchange me!";
    
    self.view = [[UIView alloc] init];
    [self.view addSubview:self.textBox];
    [self.view addSubview:sendTextButton];
    [self.view addSubview:sendImageButton];
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
