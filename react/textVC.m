//
//  textVC.m
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "textVC.h"
#import "voteVC.h"
#import "reactAppDelegate.h"
//#import "SBJson.h"
#import "JSONKit.h"

#define api_url @"http://freezing-samurai-9107.herokuapp.com"

@implementation textVC

// DEVICEID - user_id
// type - user_id
// actual content - reaction

@synthesize textf;


- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"view did appear");
    [self performSelector:@selector(hideNavBar) withObject:nil afterDelay:0.0];
    
}

-(void) hideNavBar {
    if (self.navigationController.navigationBar.hidden == NO)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)startPost{
    reactAppDelegate *app = (reactAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.textContent = self.textf.text;
    app.contentType = @"string";
    [app doContentUpload];
    
    [self viewVote];
}

-(IBAction)postContent{
    [self startPost];
}

-(void)viewVote{
    voteVC *vvc = [[voteVC alloc] initWithNibName:@"voteVC" bundle:nil];
    [[self navigationController] pushViewController:vvc animated:YES];
    [vvc release];
}

# pragma mark - text input form methods
- (void)textFieldDidEndEditing:(UITextField *)textField{
    // notify server of new words
    //    [self setNewWord:textField];
    [textField resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
