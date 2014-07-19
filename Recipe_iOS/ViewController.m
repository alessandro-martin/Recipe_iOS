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
	self.ingredientsTable.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate Methods

- (UIView *) tableView:(UITableView *) tableView
viewForHeaderInSection:(NSInteger)section
{
	UIView *header = [[UIView alloc] init];
	UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, tableView.frame.size.width - 20, 21)];
	UIFontDescriptor *theFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
	[headerLabel setFont: [UIFont fontWithDescriptor:theFontDescriptor
												size:18]];
	[headerLabel setTextAlignment:NSTextAlignmentCenter];
	headerLabel.text = self.recipe.name;
	[header addSubview:headerLabel];
	
	return header;
}

- (UIView *) tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
	UIView *footer = [[UIView alloc] init];
	// Code to resize image
	CGFloat newWidth = tableView.frame.size.width;
	CGFloat aspectRatio = (self.recipe.picture.size.height / self.recipe.picture.size.width);
	CGFloat newHeight = newWidth * aspectRatio;
	UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
	[self.recipe.picture drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
	UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	// End of code to resize image
	UIImageView *pic = [[UIImageView alloc] initWithImage:scaledImage];
	[footer addSubview:pic];
	
	return footer;
}

- (CGFloat) tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
	return 41.0f;
}

@end
