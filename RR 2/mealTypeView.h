//
//  mealTypeView.h
//  RR 2
//
//  Created by Sidd Naidu on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mealTypeView : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *mealCategories;
    NSArray *ingredientsList;
}

@property (nonatomic, retain) NSArray *ingredientsList;
@property (nonatomic, retain) NSArray *mealCategories;
@end
