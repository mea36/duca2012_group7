//
//  RecipeRamblerBeta2ViewController.m
//  RecipeRamblerBeta2
//
//  Created by Sidd Naidu on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RecipeRamblerBeta2ViewController.h"
#import "secondView.h"

@implementation RecipeRamblerBeta2ViewController

-(IBAction)nextView:(id)sender
{
    secondView *second = [[secondView alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:second animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
