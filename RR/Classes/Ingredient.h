//
//  Ingredient.h
//  RecipeRamblerBeta
//
//  Created by DUCA on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ingredient : NSObject {
	NSString *name;
	int quantity;
	NSString *units;
}

@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) int quantity;
@property(nonatomic,retain) NSString *units;

-(id)initWithName:(NSString*)n quantity:(int)q withUnits:(NSString*)u;

@end
