//
//  RR_2AppDelegate.m
//  RR 2
//
//  Created by Sidd Naidu on 7/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RR_2AppDelegate.h"
#import "EgoDb.h"
#import "Ingredient.h"

@implementation RR_2AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    /*
	Ingredient* ing1 = [[Ingredient alloc] initWithName:@"pepper" ingredient_id:@"1" quantity:0 withUnits:nil];
	NSArray *temp = [NSArray arrayWithObjects:ing1, nil];
	[ing1 release];
	NSArray *retval = [[EgoDb database] getRecipesForIngredients:temp];
	int i;
	for (i = 0; i < [retval count]; i++) {
		NSLog(@"%@", [[retval objectAtIndex:i] name]);
	}
    */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
