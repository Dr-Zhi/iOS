//
//  UtilityFlipsideViewController.h
//  UtilityApp
//
//  Created by Yanling Zhi on 4/11/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UtilityFlipsideViewController;

@protocol UtilityFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(UtilityFlipsideViewController *)controller;
@end

@interface UtilityFlipsideViewController : UIViewController

@property (weak, nonatomic) id <UtilityFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
