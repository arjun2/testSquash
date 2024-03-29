//
//  STAppDelegate.m
//  SquashCocoa iOS Tester
//
//  Created by Tim Morgan on 1/23/13.
//  Copyright (c) 2013 Square. All rights reserved.
//

#import "STAppDelegate.h"

#import "STViewController.h"
#import "SquashCocoa.h"

@implementation STAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [SquashCocoa sharedClient].APIKey = SQUASH_API_KEY;
    [SquashCocoa sharedClient].environment = @"development";
    [SquashCocoa sharedClient].host = @"http://localhost:3000";

    NSString *revisionPath = [[NSBundle mainBundle] pathForResource:@"Revision" ofType:nil];
    NSString *revision = [NSString stringWithContentsOfFile:revisionPath encoding:NSASCIIStringEncoding error:nil];
    revision = [revision stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [SquashCocoa sharedClient].revision = revision;

    [[SquashCocoa sharedClient] hook];
    [[SquashCocoa sharedClient] reportErrors];


    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[STViewController alloc] initWithNibName:@"STViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[STViewController alloc] initWithNibName:@"STViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
