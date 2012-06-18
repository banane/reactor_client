//
//  reactAppDelegate.h
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reactAppDelegate : NSObject <UIApplicationDelegate>{
    NSString *artwork_id;
    NSDictionary *reactionsDict;
    NSString *deviceid;
    NSString *contentType;
    NSString *textContent;
    NSString *contentUrl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) NSDictionary *reactionsDict;
@property (nonatomic, retain) NSArray *reactionsArray;
@property (nonatomic, retain) NSString *deviceid;
@property (nonatomic, retain) NSString *artwork_id;
@property (nonatomic, retain) NSString *contentType;
@property (nonatomic, retain) NSString *textContent;
@property (nonatomic, retain) NSString *contentUrl;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

-(void)doContentUpload;

@end
