//
//  MDDetailViewController.h
//  Master-Detail
//
//  Created by Yanling Zhi on 4/11/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
