//
//  EgoDb.m
//  RR
//
//  Created by DUCA on 7/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EgoDb.h"
#import "Recipe.h"
#import "Ingredient.h"


@implementation EgoDb
static EgoDb *db;	

+ (EgoDb*) database
{
	if (db == nil) {
		db = [[EgoDb alloc] init];
	}	
	return db;
}
- (id)init {
	NSLog(@"%@", NSHomeDirectory());
	if((self = [super initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/rr.sqlite3"]])) {
		[self createEditableCopyOfDatabaseIfNeeded];
		if (![self open]) {
			NSLog(@"Could not open db.");
		}
	}
	return self;
}

- (void)createEditableCopyOfDatabaseIfNeeded {
	NSString* writeablePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/rr.sqlite3"];
	
	if(![[NSFileManager defaultManager] fileExistsAtPath:writeablePath]) {
		[[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"rr" ofType:@"sqlite3"] toPath:writeablePath error:NULL];
	}
	
}
- (NSArray*) getIngredientsList
{	
	NSMutableArray* ingredientsList = [[[NSMutableArray alloc] init] autorelease];
	
	EGODatabaseResult *rs = [db executeQuery:@"SELECT * FROM INGREDIENTS"];
	
	
	for(EGODatabaseRow* row in rs) {
		NSString* name = [row stringForColumn:@"ING_NAME"];
		NSString* units = @"";
		NSString* ingredient_id = [row stringForColumn:@"ING_ID"]; 
		//quantity

		int quantity = [row intForColumn:@"QUANTITY"];

		
	
		//create an ingredient object
		Ingredient *ing = [[Ingredient alloc] initWithName:name ingredient_id:ingredient_id quantity:quantity withUnits:units];
		
		//goes through each row
		[ingredientsList addObject: ing];
		[ing release];
	}

	return ingredientsList;
		
}

 //add some attributes to the recipe object
 //create an array to retun from this function
 //add the recipes to the array
 //create INST in recipe table and populate so that new lines are represented as <br>
 /*
- (NSArray*) getRecipesForIngredients: (NSArray*) ingredientsList
{	
	//ingredientsList = list of ingredients
	NSMutableArray* ingIdList = [[NSMutableArray alloc] init];
	int i = 0;
	//for each ingredient in the list
	for (i = 0; i < [ingredientsList count]; i++) {
		//get the ingredienet
		Ingredient *ing = [ingredientsList objectAtIndex:i];
		//get the id
		NSString *pk = [ing ingredient_id];
		//add to list of ingredient ids
		[ingIdList addObject: pk ];
	}
	//convert array to string
	NSString* stringOfIds = [ingIdList componentsJoinedByString:@","];
	//create the query
	NSString* query= [NSString stringWithFormat:@"select RECIPE_NAME, DIFFICULTY, BLD, CULTURE, PREP_TIME from RECIPE where R_ID not in (select R_ID from ing_rec where ING_ID in (%@))", stringOfIds ];
	NSLog(@"my query = %@", query);
	EGODatabaseResult *rs = [db executeQuery:query];
	
	
	for(EGODatabaseRow* row in rs) {
		NSString* RECIPE_NAME = [row stringForColumn:@"RECIPE_NAME"];
		//NSString* R_ID = [row stringForColumn:@"R_ID"]; 
		NSString* BLD = [row stringForColumn:@"BLD"]; 
		//quantity
		
		int difficulty = [row intForColumn:@"DIFFICULTY"];
		NSString* blob = [row stringForColumn:@"INST"];
		NSArray* instructions = [blob componentsSeparatedByString:@"<br>"];
		
		
		
		//create an recipe object
		Recipe *ing = [[Recipe alloc]initWithName:RECIPE_NAME ingredients_list:nil prep_time:0 instructions:instructions cooking_time:0 ];
		

		//goes through each row
		//[ingredientsList addObject: ing];
		[ing release];
	}
	
	return ingredientsList;
	
}
 */
- (void)dealloc {
	[db close];
    [db release];
    [super dealloc];
}	
/*
- (NSString*) getQuantity
{	
	NSString* Quantity = [[[NSString alloc] init] autorelease];
	
	EGODatabaseResult *rs = [db executeQuery:@"SELECT * FROM INGREDIENTS"];
	
	for(EGODatabaseRow* row in rs) {
		NSString* Recipe = [row stringForColumn:@"ingredient"];
		//NSLog(@"%d %d %@ ",[row intForColumn:@"id"], [row stringForColumn:@"date"], [row stringForColumn:@"name"]);
		//goes through each row
		//[ingredientsList addObject: Ingredient];
	}
	
	
	
	return Recipe;
	
}
*/













	@end
