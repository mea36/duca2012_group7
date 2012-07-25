//
//  EgoDb.h
//  RR
//
//  Created by DUCA on 7/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "EGODatabase.h"

@interface EgoDb : EGODatabase {
	
}
+ (EgoDb*) database;
- (id)init;
- (void)createEditableCopyOfDatabaseIfNeeded;
//other methods for the db will go here
- (NSArray*) getIngredientsList;


@end