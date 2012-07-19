//
//  secondView.h
//  RecipeRamblerBeta2
//
//  Created by Sidd Naidu on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondView : UITableViewController

{
    NSMutableArray *ingredientsArray;
}

@property(nonatomic, assign) id<UINavigationControllerDelegate> delegate;

@property(nonatomic,readonly) UIToolbar *toolbar;

-(IBAction)nextView2:(id)sender;

@end
