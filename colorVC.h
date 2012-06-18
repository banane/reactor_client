//
//  colorVC.h
//  react
//
//  Created by Anna Billstrom on 6/17/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface colorVC : UIViewController{
    IBOutlet UIImageView *drawImage;
    int mouseMoved;
	BOOL mouseSwiped;
	CGPoint lastPoint;

}

@property (nonatomic, retain) IBOutlet UIImageView *drawImage;

-(IBAction)viewVote;

@end
