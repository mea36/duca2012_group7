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
    NSMutableArray *ingredientsArray;
}

-(IBAction)nextView:(id)sender;

@end