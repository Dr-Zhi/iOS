//
//  SplitViewMasterViewController.h
//  SplitView
//
//  Created by Yanling Zhi on 4/20/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SplitViewDetailViewController;

@interface SplitViewMasterViewController : UITableViewController

@property (strong, nonatomic) SplitViewDetailViewController *detailViewController;

@end
