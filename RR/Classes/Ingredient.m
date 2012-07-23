//
//  Ingredient.m
//  RecipeRamblerBeta
//
//  Created by DUCA on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Ingredient.h"


@implementation Ingredient
@synthesize name,quantity,units;

- (id)initWithName: (NSString*)n quantity:(int)q withUnits:(NSString*)u {
	self = [super init];
	if(self)
	{
		self.name = n;
		self.quantity = q;
		self.units = u;
	}
	return self;
}
- (void) dealloc
{
	[name release];
	[units release];
	[super dealloc];
}

@end
