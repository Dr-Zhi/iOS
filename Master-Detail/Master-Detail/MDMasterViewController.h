//
//  MDMasterViewController.h
//  Master-Detail
//
//  Created by Yanling Zhi on 4/11/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDDetailViewController;

@interface MDMasterViewController : UITableViewController

@property (strong, nonatomic) MDDetailViewController *detailViewController;

@end
