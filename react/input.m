//
//  input.m
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "input.h"
#import "textVC.h"
#import "colorVC.h"

@implementation input

-(IBAction)viewTextVC{
    textVC *tvc = [[textVC alloc] initWithNibName:@"textVC" bundle:nil];
    [[self navigationController] pushViewController:tvc animated:YES];
    [tvc release];
    
}

-(IBAction)viewColors{
    colorVC *cvc = [[colorVC alloc] initWithNibName:@"colorVC" bundle:nil];
    [[self navigationController] pushViewController:cvc animated:YES];
    [cvc release];
}
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
