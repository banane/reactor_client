//
//  voteVC.h
//  react
//
//  Created by Anna Billstrom on 6/16/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface voteVC : UIViewController{
    IBOutlet UILabel *artL1;
    IBOutlet UILabel *artL2;
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    
    int vote;
}

@property (nonatomic, retain) IBOutlet UIImageView *image1;
@property (nonatomic, retain) IBOutlet UIImageView *image2;
@property (nonatomic, retain) IBOutlet UILabel *artL1;
@property (nonatomic, retain) IBOutlet UILabel *artL2;
@property (nonatomic) int vote;

-(IBAction)viewGallery:(id)sender;
-(void)sendUrl:(NSURL *)url;
-(void)doVote;
@end
