//
//  EditViewController.m
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/22/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "EditViewController.h"
#import "TableVewController.h"

@interface EditViewController ()
@property (nonatomic, strong) NSString *finalURL;
@property (nonatomic, strong) NSString *finalName;

@end

@implementation EditViewController
@synthesize urlLocationField;
@synthesize urlNameField;
@synthesize urlLocationString;
@synthesize urlNameString;
@synthesize saveButton;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    urlNameField.text = urlNameString;
    urlLocationField.text = urlLocationString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
