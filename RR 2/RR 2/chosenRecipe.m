//
//  chosenRecipe.m
//  RR 2
//
//  Created by Sidd Naidu on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "chosenRecipe.h"

@implementation chosenRecipe

@synthesize recipe;
@synthesize instructions;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.instructions setText:@"hello bad news bears go to japan"];
    NSArray* instructionList = [self.recipe instructions];
    NSLog(@"%@", instructionList);
    NSString *instr = @"";
    int i;
    for (i = 0; i < [instructionList count]; i ++) {
        NSString *temp = [instructionList objectAtIndex:i];
        NSLog(temp);
        instr = [NSString stringWithFormat:@"%@\n%@",instr,temp]; 
    }
    [self.instructions setText: instr];
    // Do any additional setup after loading the view from its nib.
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
-(void) dealloc{
    [recipe release];
    [instructions release];
    [super dealloc];
}
@end
