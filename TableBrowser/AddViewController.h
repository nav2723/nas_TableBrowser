//
//  AddViewController.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/22/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *urlName;
@property (nonatomic, weak) IBOutlet UITextField *urlLocation;
@property (nonatomic, weak) IBOutlet UIButton *saveButton;

@end
