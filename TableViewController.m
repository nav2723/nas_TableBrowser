//
//  TableTableViewController.m
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/2/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "TableViewController.h"
#import "BrowserViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController {
    NSArray *urls;
    NSArray *urlNames;
}

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Initialize table data
    urls = [NSArray arrayWithObjects:@"http://www.cnn.com",
            @"http://www.facebook.com",
            @"http://www.m.reddit.com",
            @"http://www.amazon.com",
            @"www.www.netflix.com", nil];
    
    urlNames = [NSArray arrayWithObjects:@"CNN", @"Facebook", @"Reddit", @"Amazon", @"Netflix", nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [urls count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"urlCell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [urlNames objectAtIndex:indexPath.row];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showURL"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BrowserViewController *destViewController = segue.destinationViewController;
        destViewController.urlName = [urls objectAtIndex:indexPath.row];
    }
}


@end

