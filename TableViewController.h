//
//  TableTableViewController.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/2/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NSCoding>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *urlCombination;
@property (nonatomic, strong) NSMutableArray *urlsSelf;
@property (nonatomic, strong) NSMutableArray *urlNamesSelf;

@property (nonatomic, strong) NSString *receivedData;




@end
