//
//  pageAppViewController.h
//  pageApp
//
//  Created by Yanling Zhi on 4/7/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pageAppViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController * pageController;
@property (strong, nonatomic) NSArray * pageContent;

@end
