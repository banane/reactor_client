//
//  textVC.h
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textVC : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *textf;
}

@property (nonatomic, retain) IBOutlet UITextField *textf;


-(void)viewVote;
-(IBAction)postContent;
-(void)startPost;
@end
