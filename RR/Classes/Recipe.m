//
//  Recipe.m
//  RecipeRamblerBeta
//
//  Created by DUCA on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Recipe.h"


@implementation Recipe
@synthesize name,ingredients_list,prep_time,instructions,cooking_time;


-(id)initWithName:(NSString*)n ingredients_list:(NSArray*)ing prep_time:(int)prep instructions:(NSArray*)inst cooking_time:(int)cook {
	self.name = n;
	self.ingredients_list = ing;
	self.prep_time = prep;
	self.instructions = inst;
	self.cooking_time = cook;
	return self;
}
@end
