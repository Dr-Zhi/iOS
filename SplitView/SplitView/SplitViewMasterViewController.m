//
//  SplitViewMasterViewController.m
//  SplitView
//
//  Created by Yanling Zhi on 4/20/13.
//  Copyright (c) 2013 Dr. Zhi Inc. All rights reserved.
//

#import "SplitViewMasterViewController.h"

#import "SplitViewDetailViewController.h"

@interface SplitViewMasterViewController ()

@property (strong, nonatomic) NSMutableArray * siteNames;
@property (strong, nonatomic) NSMutableArray * siteAddresses;

@end

@implementation SplitViewMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Favorite", @"Favorite Web Sites");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc {
    [_detailViewController release];
    [_siteNames release];
    [_siteAddresses release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.siteNames = [NSMutableArray arrayWithArray:@[@"Yahoo", @"Google", @"Apple", @"Dr. Zhi"]];
    self.siteAddresses = [NSMutableArray arrayWithArray:@[@"http://www.yahoo.com", @"http://www.google.com", @"http://www.apple.com", @"http://www.dr-zhi.com"]];
    
    // initial selection
    NSIndexPath * lpIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:lpIndexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    [self tableView:self.tableView didSelectRowAtIndexPath:lpIndexPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.siteNames.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }


    cell.textLabel.text = (self.siteNames)[indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.siteNames removeObjectAtIndex:indexPath.row];
        [self.siteAddresses removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (self.detailViewController == nil) {
	        self.detailViewController = [[[SplitViewDetailViewController alloc] initWithNibName:@"SplitViewDetailViewController_iPhone" bundle:nil] autorelease];
	    }
        [self.navigationController pushViewController:self.detailViewController animated:YES];
        //[self.masterPopoverController dismissPopoverAnimated:YES];
    }
    NSString * lpUrlString = self.siteAddresses[indexPath.row];
    [self.detailViewController webViewLoadURL:lpUrlString];
}

@end
