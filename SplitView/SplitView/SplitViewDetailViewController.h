//
//  SplitViewDetailViewController.h
//  SplitView
//
//  Created by Yanling Zhi on 4/20/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplitViewDetailViewController : UIViewController <UISplitViewControllerDelegate, UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) NSString * URLForWebView;
@property (assign, nonatomic) BOOL isWebViewLoaded;

/// let the web view load a given url 
- (void) webViewLoadURL:(NSString *) ipURLString;

@end
