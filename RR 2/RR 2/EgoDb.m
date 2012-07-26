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
#import "mealTypeView.h"

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
	if((self = [super initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/rr1.sqlite3"]])) {
		[self createEditableCopyOfDatabaseIfNeeded];
		if (![self open]) {
			NSLog(@"Could not open db.");
		}
	}
	return self;
}

- (void)createEditableCopyOfDatabaseIfNeeded {
	NSString* writeablePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/rr1.sqlite3"];
	NSLog(@"my path = %@", writeablePath);
	if(![[NSFileManager defaultManager] fileExistsAtPath:writeablePath]) {
		[[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"rr1" ofType:@"sqlite3"] toPath:writeablePath error:NULL];
        NSLog(@"copying db");
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
 //create INST in recipe table and populate so that new line s are represented as <br>


- (NSArray*) getRecipesForIngredients: (NSArray*) ingredientsList withType:(NSString*) mealType
{	
	//ingredientsList = list of ingredients
	NSMutableArray* ingIdList = [NSMutableArray array];
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
	NSString* query= [NSString stringWithFormat:@"select RECIPE_NAME, DIFFICULTY, BLD, CULTURE, PREP_TIME, INSTR from RECIPE where BLD = '%@' and R_ID not in (select R_ID from ing_rec where ING_ID in (%@))", mealType, stringOfIds ];
	NSLog(@"my query = %@", query);
	EGODatabaseResult *rs = [db executeQuery:query];
	NSMutableArray* recipeList = [NSMutableArray array];
	
	for(EGODatabaseRow* row in rs) {
		NSString* name = [row stringForColumn:@"RECIPE_NAME"];
		int R_ID = [row intForColumn:@"R_ID"]; 
		NSString* BLD = [row stringForColumn:@"BLD"]; 
		
		int difficulty = [row intForColumn:@"DIFFICULTY"];
		NSString* blob = [row stringForColumn:@"INSTR"];
        NSLog(@"blob = %@", blob);
		NSArray* instructions = [blob componentsSeparatedByString:@"<br>"];
		
		//create an recipe object
		Recipe *rec = [[Recipe alloc] initWithName:name ingredients_list:instructions prep_time:0 instructions:instructions cooking_time:0 recipeid:R_ID difficulty:difficulty BLD:BLD];
		[recipeList addObject:rec];
		[rec release];
	}
	
	
	return recipeList;
	
}
 
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
