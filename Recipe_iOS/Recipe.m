//
//  Recipe.m
//  Recipe_iOS
//
//  Created by Alessandro on 26/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "Recipe.h"

@interface Recipe ()
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) UIImage *picture;
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

@end
