//
//  mealTypeView.m
//  RR 2
//
//  Created by Sidd Naidu on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "mealTypeView.h"
#import "recipesView.h"
#import "RootViewController.h"
#import "EgoDb.h"

@interface mealTypeView ()

@end

@implementation mealTypeView

@synthesize mealCategories, ingredientsList;

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"initing meal type");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"view did load - mealtype");
    self.title = @"Meal Type";
    mealCategories =[[NSArray alloc] initWithObjects:@"Breakfast", @"Lunch", @"Dinner",nil];
    //[mealCategories addObject:@"Breakfast"];
    //[mealCategories addObject:@"Lunch"];
    //[mealCategories addObject:@"Dinner"];
    //[ingredientsArray addObject:@"Bread"];
    //[ingredientsArray addObject:@"Eggs"];
    //[ingredientsArray addObject:@"Chicken"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"have %d rows in mealtype", mealCategories.count);
    // Return the number of rows in the section.
    return self.mealCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    cell.textLabel.text = [mealCategories objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* mealType = [mealCategories objectAtIndex:indexPath.row];
    recipesView* nextView = [[recipesView alloc] initWithNibName:@"recipesView" bundle:nil];
    nextView.recipesList = [[EgoDb database] getRecipesForIngredients:self.ingredientsList withType:mealType];

    [self.navigationController pushViewController:nextView animated:YES];
    [nextView release];
    
}

-(void) dealloc
{
    [mealCategories release];
    [ingredientsList release];
    [super dealloc];
}

@end
