//
//  Recipe.h
//  RecipeRamblerBeta
//
//  Created by DUCA on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Recipe : NSObject {
	NSString *name;
	NSArray *ingredients_list;
	int prep_time;
	NSArray *instructions;
	int cooking_time;
	NSString *BLD; 
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSArray *ingredients_list;
@property(nonatomic,assign) int prep_time;
@property(nonatomic,copy) NSArray *instructions;
@property(nonatomic,assign) int cooking_time;

-(id)initWithName:(NSString*)n ingredients_list:(NSArray*)ing prep_time:(int)prep instructions:(NSArray*)inst cooking_time:(int)cook;

@end
