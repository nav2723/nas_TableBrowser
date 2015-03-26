//
//  EditViewController.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/22/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *urlNameField;
@property (nonatomic, weak) IBOutlet UITextField *urlLocationField;
@property (nonatomic, weak) IBOutlet UIButton *saveButton;


@property (nonatomic, strong) NSString *urlNameString;
@property (nonatomic, strong) NSString *urlLocationString;

@end
