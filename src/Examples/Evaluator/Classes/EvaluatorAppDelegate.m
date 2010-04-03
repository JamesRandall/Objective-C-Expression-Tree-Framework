//
//  EvaluatorAppDelegate.m
//  Evaluator
//
//  Created by James Randall on 03/04/2010.
//  Copyright James Randall 2010. All rights reserved.
//

#import "EvaluatorAppDelegate.h"
#import "EvaluatorViewController.h"

@implementation EvaluatorAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
