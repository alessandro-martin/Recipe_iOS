//
//  Recipe.h
//  Recipe_iOS
//
//  Created by Alessandro on 26/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject <UITableViewDataSource>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) UIImage *picture;

- (instancetype) initWithRecipePlistName:(NSString *)plistName; // Designated Initializer

@end
