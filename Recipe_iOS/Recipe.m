//
//  Recipe.m
//  Recipe_iOS
//
//  Created by Alessandro on 26/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "Recipe.h"

@interface Recipe ()

@property (nonatomic) NSString *name;
@property (nonatomic) UIImage *picture;
@property (nonatomic) NSArray *ingredients;

@end

@implementation Recipe

- (instancetype) init
{
	return nil;
}

- (instancetype) initWithRecipePlistName:(NSString *)plistName
{
	self = [super init];
	if (self) {
		NSString *path = [[NSBundle mainBundle] pathForResource:plistName
														 ofType:@"plist"];
		NSDictionary *recipeContents = [[NSDictionary alloc] initWithContentsOfFile:path];
		self.name = recipeContents[@"Recipe Name"];
		self.ingredients = recipeContents[@"Ingredients"];
		path = [[NSBundle mainBundle] pathForResource:recipeContents[@"Image"][@"Name"]
											   ofType:recipeContents[@"Image"][@"Extension"]];
		self.picture = [UIImage imageWithContentsOfFile:path];
		
	}
	return self;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section
{
	return [self.ingredients count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView
		  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aCell"];
	
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:@"aCell"];
    }
	
    cell.textLabel.text = [self.ingredients objectAtIndex:indexPath.row];
    return cell;
}

- (UIView *) tableView:(UITableView *) tableView
viewForHeaderInSection:(NSInteger)section
{
	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 41)];
	UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, tableView.frame.size.width - 20, 21)];
	UIFontDescriptor *theFont = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
	[headerLabel setFont: [UIFont fontWithDescriptor:theFont
												size:18]];
	[headerLabel setTextAlignment:NSTextAlignmentCenter];
	headerLabel.text = self.name;
	[header addSubview:headerLabel];
	
	return header;
}

- (UIView *) tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
	UIView *footer = [[UIView alloc] init];
	// Code to resize image
	CGFloat newWidth = tableView.frame.size.width;
	CGFloat aspectRatio = (self.picture.size.height / self.picture.size.width);
	CGFloat newHeight = newWidth * aspectRatio;
	UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
	[self.picture drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
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
