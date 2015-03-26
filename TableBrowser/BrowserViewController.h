//
//  BrowserViewController.h
//  TableBrowser
//
//  Created by Naveen Srivastava on 3/2/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *urlLabel;
@property (nonatomic, strong) NSString *urlName;
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end