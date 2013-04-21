//
//  UtilityMainViewController.h
//  UtilityApp
//
//  Created by Yanling Zhi on 4/11/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import "UtilityFlipsideViewController.h"

@interface UtilityMainViewController : UIViewController <UtilityFlipsideViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction)showInfo:(id)sender;

@end
