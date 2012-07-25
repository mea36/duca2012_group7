//
//  Ingredient.m
//  RecipeRamblerBeta
//
//  Created by DUCA on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Ingredient.h"


@implementation Ingredient
@synthesize name,ingredient_id,quantity,units;

- (id)initWithName:(NSString*)n ingredient_id:(NSString*)pk quantity:(int)q withUnits:(NSString*)u {
	self = [super init];
	if(self)
	{
		self.name = n;
		self.ingredient_id = pk;
		self.quantity = q;
		self.units = u;
	}
	return self;
}
- (void) dealloc
{
	[name release];
	[ingredient_id release];
	[units release];
	[super dealloc];
}

-(NSString*) toString
{
    return self.ingredient_id;
}

@end
