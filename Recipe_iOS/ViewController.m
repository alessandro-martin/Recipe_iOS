//
//  ViewController.m
//  Recipe_iOS
//
//  Created by Alessandro on 18/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *ingredientsTable;

@property (nonatomic) Recipe *recipe;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.recipe = [[Recipe alloc] initWithRecipePlistName:@"tiramisu"];
	
	self.ingredientsTable.dataSource = self.recipe;
	self.ingredientsTable.delegate = self.recipe;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
