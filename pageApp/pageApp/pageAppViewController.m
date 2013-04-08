//
//  pageAppViewController.m
//  pageApp
//
//  Created by Yanling Zhi on 4/7/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import "pageAppViewController.h"
#import "ContentViewController.h"

@interface pageAppViewController ()

@end

@implementation pageAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    [self createContentPages];
    NSDictionary *options = [NSDictionary dictionaryWithObject:@(UIPageViewControllerSpineLocationMin) forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                           options: options] autorelease];
    
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.bounds;
    
    // a view controller must first be created before displaying a page.
    ContentViewController * initialViewController = [self viewControllerAtIndex:0];
    NSArray * viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers
                             direction:UIPageViewControllerNavigationDirectionForward
                              animated:NO
                            completion:nil];
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createContentPages {
    @autoreleasepool {
        NSMutableArray * lpPageStrings = [[[NSMutableArray alloc] init] autorelease];
        for (int i = 1; i <= 10; i++) { // 10 pages
            NSString * lpContentString = [[[NSString alloc] initWithFormat:@"<html><head></head><body><h1>Chapter %d</h1><p>This is the page %d of content displayed using UIPageViewController in iOS 5.</p></body></html>", i, i] autorelease];
            [lpPageStrings addObject:lpContentString];
        }
        self.pageContent = [[[NSArray alloc] initWithArray:lpPageStrings] autorelease];
    }
}

#pragma mark 

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController
      viewControllerBeforeViewController: (UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:
                        (ContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    --index;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:
                        (ContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    ++index;
    if (index == [self.pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
        (index >= [self.pageContent count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ContentViewController * lpDataViewController = [[[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil] autorelease];
    lpDataViewController.dataObject = [self.pageContent objectAtIndex:index];
    return lpDataViewController;
}

- (NSUInteger)indexOfViewController:(ContentViewController *)viewController {
    return [self.pageContent indexOfObject:viewController.dataObject];
}


@end
