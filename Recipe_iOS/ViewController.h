//
//  ViewController.h
//  Recipe_iOS
//
//  Created by Alessandro on 18/06/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic) Recipe *recipe;
@end
