//
//  SplitViewDetailViewController.m
//  SplitView
//
//  Created by Yanling Zhi on 4/20/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import "SplitViewDetailViewController.h"

@interface SplitViewDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation SplitViewDetailViewController

- (void)dealloc {
    _webView.delegate = nil;
    [_webView release];
    [_masterPopoverController release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
    if (self.isWebViewLoaded == NO && self.URLForWebView) {
        [self webViewLoadURL:self.URLForWebView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (void) webViewLoadURL:(NSString *) ipURLString {
    self.URLForWebView = ipURLString;
    NSURL * lpUrl = [NSURL URLWithString:self.URLForWebView];
    NSURLRequest * lpRequest = [NSURLRequest requestWithURL:lpUrl];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:lpRequest];
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - UIWebViewDelegate protocal

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.isWebViewLoaded = YES;
}

@end
