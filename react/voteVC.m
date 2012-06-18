//
//  voteVC.m
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "voteVC.h"
#import "gallery.h"
#import "reactAppDelegate.h"
#import "JSONKit.h"

#define api_url @"http://freezing-samurai-9107.herokuapp.com"

@implementation voteVC
@synthesize artL1,artL2,vote,image1,image2;

-(IBAction)viewGallery:(id)sender{
    self.vote = [sender tag];
    [self doVote];
    
    gallery *gvc = [[gallery alloc] initWithNibName:@"gallery" bundle:nil];
    [[self navigationController] pushViewController:gvc animated:YES];
    [gvc release];
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

-(void)doVote{
    
    
    reactAppDelegate *app = (reactAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *reaction_id1;
    NSString *reaction_id2;
    NSString *urlStr1;
    NSString *urlStr2;
    NSURL *url1;
    NSURL *url2;

    
    
    reaction_id1 = [[app.reactionsDict objectForKey:@"reaction1"] objectForKey:@"id"];
    reaction_id2 = [[app.reactionsDict objectForKey:@"reaction2"] objectForKey:@"id"];
    
    urlStr1 = [NSString stringWithFormat:@"%@/artwork/%@/reaction/%@",api_url,app.artwork_id, reaction_id1];
    urlStr2 = [NSString stringWithFormat:@"%@/artwork/%@/reaction/%@",api_url,app.artwork_id, reaction_id2];
    
    NSString *endofurl = [NSString stringWithFormat:@"user_id/%@",app.deviceid];
    
    if(self.vote == 0){
        url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@/upvote/%@",urlStr1,endofurl]];
        url2 = [NSURL URLWithString:[NSString stringWithFormat:@"%@/downvote/%@",urlStr2,endofurl]];
    } else {
        url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@/downvote/%@",urlStr1,endofurl]];
        url2 = [NSURL URLWithString:[NSString stringWithFormat:@"%@/upvote/%@",urlStr2,endofurl]];
    }

    //        /reaction_id/upvotevote/
    /* http://192.168.1.161:8080/artwork/1/reaction/[reaction_id]/upvote||downvote */
    // do asynchronous call
    [self sendUrl:url1];
    [self sendUrl:url2];

}
-(void)sendUrl:(NSURL *)url{
    NSURLResponse *response;
    NSError *error;

    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    
    [request setHTTPMethod:@"POST"];        
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // don't do anything about the result
    
    if(request){
        request = nil;
        [request release];
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
    reactAppDelegate *app = (reactAppDelegate *)[[UIApplication sharedApplication] delegate];

    
    
    NSDictionary *vote1 = [app.reactionsDict objectForKey:@"reaction1"];    
    NSDictionary *vote2 = [app.reactionsDict objectForKey:@"reaction2"];
    
  
/*    NSDictionary *vote2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"http://s3.amazonaws.com/reactcontent/drawing2.png",@"content",
                           @"4fde16d0e4b001d091013894",@"reaction_id",
                           @"drawing",@"reaction_type",
                           @"/artwork/1/reaction/4fde16d0e4b001d091013894",@"url",
                           nil];*/
    
    if( [[vote1 objectForKey:@"reaction_type"] isEqualToString:@"string"]){
        artL1.text = [vote1 objectForKey:@"content"];
    } else {
        NSURL *url1 = [NSURL URLWithString:[vote1 objectForKey:@"content"]];
        UIImage *image1obj = [UIImage imageWithData:[NSData dataWithContentsOfURL:url1]];
        image1.image = image1obj;
    }
       
    if( [[vote2 objectForKey:@"reaction_type"] isEqualToString:@"string"]){
        artL2.text = [vote2 objectForKey:@"content"];
    } else {
        NSURL *url2 = [NSURL URLWithString:[vote2 objectForKey:@"content"]];
        UIImage *image2obj = [UIImage imageWithData:[NSData dataWithContentsOfURL:url2]];
        image2.image = image2obj;
    }
    NSLog(@"view1: %@",[vote1 objectForKey:@"reaction_type"]);
    NSLog(@"view2: %@",[vote2 objectForKey:@"reaction_type"]);
    
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
