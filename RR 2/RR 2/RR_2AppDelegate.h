//
//  RR_2AppDelegate.h
//  RR 2
//
//  Created by Sidd Naidu on 7/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RR_2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

-(IBAction)nextView:(id)sender;

@end
