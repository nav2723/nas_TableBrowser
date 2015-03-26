//
//  TableTableViewController.m
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/2/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "TableViewController.h"
#import "BrowserViewController.h"
#import "EditViewController.h"
#import "AddViewController.h"
#import "SharedStore.h"
#import "Webpage.h"


@interface TableViewController ()

@end

@implementation TableViewController {
    NSMutableArray *urls;
    NSMutableArray *urlNames;
    NSInteger selectedRow;
}

@synthesize tableView = _tableView;
@synthesize receivedData;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Initialize table data
//	SharedStore *store = [SharedStore sharedStore];
//	NSMutableArray *data = store.data;
    
    
	
	/*
    urls = [NSMutableArray arrayWithObjects:@"http://www.cnn.com",
            @"http://www.facebook.com",
            @"http://www.m.reddit.com",
            @"http://www.amazon.com",
            @"http://www.netflix.com", nil];
    
    
    
    urlNames = [NSMutableArray arrayWithObjects:@"CNN",
                @"Facebook",
                @"Reddit",
                @"Amazon",
                @"Netflix", nil];

   */
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
    SharedStore *store = [SharedStore sharedStore];
	NSMutableArray *data = store.data;
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"urlCell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    SharedStore *store = [SharedStore sharedStore];
	NSMutableArray *data = store.data;
    
    cell.textLabel.text = [[data objectAtIndex:indexPath.row] name];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}


- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    SharedStore *store = [SharedStore sharedStore];
	NSMutableArray *data = store.data;
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){
        
    }
}


- (IBAction)addItems:(id)sender {
    [urls addObject:@"http://www.pitt.edu"];
    [urlNames addObject:@"Pitt"];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showURL"]) {
        SharedStore *store = [SharedStore sharedStore];
        NSMutableArray *data = store.data;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BrowserViewController *destViewController = segue.destinationViewController;
        destViewController.urlName = [[data objectAtIndex:indexPath.row] address];
    }
    
    
    else if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        SharedStore *store = [SharedStore sharedStore];
        NSMutableArray *data = store.data;
        
        selectedRow = indexPath.row;
        
        EditViewController *destViewController = segue.destinationViewController;
        destViewController.urlLocationString = [[data objectAtIndex:indexPath.row] address];
        destViewController.urlNameString = [[data objectAtIndex:indexPath.row] name];
    }
}

-(IBAction)unwindToTable:(UIStoryboardSegue *)segue{
    if ([segue.identifier isEqualToString:@"unwindToTableFromEdit"]){
        SharedStore *store = [SharedStore sharedStore];
        NSMutableArray *data = store.data;
        
        EditViewController *evc = (EditViewController *)segue.sourceViewController;
        
        Webpage *t7 = [[Webpage alloc] init];
        t7.name = [NSMutableString stringWithString:evc.urlNameField.text];
        t7.address = [NSMutableString stringWithString:evc.urlLocationField.text];
        t7.order = selectedRow;
        [data replaceObjectAtIndex:selectedRow withObject:t7];

        [self.tableView reloadData];
        
    }
    
    else if ([segue.identifier isEqualToString:@"unwindToTableFromAdd"]){
        SharedStore *store = [SharedStore sharedStore];
        NSMutableArray *data = store.data;
        
        AddViewController *avc = (AddViewController *)segue.sourceViewController;
        
        Webpage *t6 = [[Webpage alloc] init];
        t6.name = [NSMutableString stringWithString:avc.urlLocation.text];
        t6.address = [NSMutableString stringWithString:avc.urlName.text];
        t6.order = [data count]+1;
        [data addObject:t6];
        
        [self.tableView reloadData];
    }
    
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView: (UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    SharedStore *store = [SharedStore sharedStore];
    NSMutableArray *data = store.data;
    
    NSString *item = [data objectAtIndex:sourceIndexPath.row];
    [data removeObject:item];
    [data insertObject:item atIndex:destinationIndexPath.row];
    
}



@end

