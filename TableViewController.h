//
//  TableTableViewController.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/2/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
