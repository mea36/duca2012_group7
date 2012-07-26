//
//  chosenRecipe.h
//  RR 2
//
//  Created by Sidd Naidu on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface chosenRecipe : UIViewController
{
    Recipe *recipe;
    IBOutlet UITextView* instructions;
}

@property (nonatomic, retain) Recipe *recipe;
@property (nonatomic, retain) IBOutlet UITextView *instructions;

@end
