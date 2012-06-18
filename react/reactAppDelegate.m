//
//  reactAppDelegate.m
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "reactAppDelegate.h"
#import "JSONKit.h"

#define api_url @"http://freezing-samurai-9107.herokuapp.com"

@implementation reactAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize artwork_id,reactionsDict,deviceid,reactionsArray,contentType,textContent,contentUrl;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)doContentUpload{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/artwork/%@/reaction/",api_url,self.artwork_id]];
    
    self.deviceid = [[UIDevice currentDevice] uniqueIdentifier];
    
    if([self.contentType isEqualToString:@"drawing"]){
        // set content now until drawing is updated
        self.textContent = @"http://s3.amazonaws.com/reactcontent/drawing2.png";
    }
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.deviceid, @"user_id",
                                    self.contentType, @"reaction_type",
                                    self.textContent,@"content",
                                    self.contentUrl, @"aws_url",
                                    nil];
    
    NSString *jsonStringRequest = [jsonDictionary JSONString];
    
    NSLog(@"requestJson %@", jsonStringRequest);
    
    
    NSURLResponse *response;
    NSError *error;
    
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    [request setHTTPMethod:@"POST"];    
    [request setHTTPBody:[jsonStringRequest dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *responseDataString = (NSString *)[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"datastring: %@",responseDataString);
    
    self.reactionsDict = (NSDictionary *)[responseData objectFromJSONData];
    NSLog(@"reactions dict: %@", self.reactionsDict);

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [reactionsArray release];
    [deviceid release];
    [reactionsDict release];
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
