//
//  ViewController.m
//  Recipe_iOS
//
//  Created by Alessandro on 18/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.recipe = [[Recipe alloc] init];
	self.recipe.name = @"Tiramisu";
	self.recipe.ingredients = @[@"Savoiardi Biscuits", @"Egg Yolks", @"Egg Whites",
								@"Sugar", @"Mascarpone Cheese", @"Espresso Coffee",
								@"Cocoa Powder"];
	self.ingredientsTextView.text = [NSString stringWithFormat:@"Recipe for %@:\n\n%@", self.recipe.name,
									 [self.recipe.ingredients componentsJoinedByString:@"\n"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
