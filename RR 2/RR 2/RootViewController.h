//
//  RootViewController.h
//  RR 2
//
//  Created by Sidd Naidu on 7/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController
{
    NSArray *ingredientsArray;
    NSMutableArray* selectedIngredients;
}
@property (nonatomic, retain) NSArray* ingredientsArray;
@property (nonatomic, retain) NSMutableArray* selectedIngredients;
-(IBAction)nextView:(id)sender;

@end
