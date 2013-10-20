//
//  ThirdViewController.m
//  TabBarDemo
//
//  Created by Yanling Zhi on 9/28/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:3];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)badgeTabIcon:(id)sender {
    self.tabBarItem.badgeValue = @"1";
}

- (IBAction)clearTabBadge:(id)sender {
    self.tabBarItem.badgeValue = nil;
}

@end
