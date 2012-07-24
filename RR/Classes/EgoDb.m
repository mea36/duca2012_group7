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
