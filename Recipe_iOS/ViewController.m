//
//  ViewController.m
//  Recipe_iOS
//
//  Created by Alessandro on 18/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
	self.ingredientsTextView.text = [NSString stringWithFormat:@"Ingredients for Tiramisu:\n\n%@",
									 [appDelegate.ingredients componentsJoinedByString:@"\n"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
