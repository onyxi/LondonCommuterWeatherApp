//
//  AppDelegate.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 20/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


// When the app launches this method calls the 'setDefaultValuesForJourneys' method to check NSUserDefaults and set up default data values for the user's journeys if necessary
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // check for and set default values
    [self setDefaultValuesForJourneys];
    
    return YES;
}

// This method checks NSUserDefaults to see if values have been set for the user's journey locations and start/end times. They will be nil when the app launches for the first time, so this method sets default values, which can be updated by the user in the SettingsViewController
-(void)setDefaultValuesForJourneys {
    
    // check for home location value
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"homeLocation"] == nil) {
        [[NSUserDefaults standardUserDefaults] setValue: @"Camden" forKey:@"homeLocation"];
    }
    
    // check for work location value
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"workLocation"] == nil) {
        [[NSUserDefaults standardUserDefaults] setValue: @"Westminster" forKey:@"workLocation"];
    }
    
    // create default date values
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDate *amStart = [calendar dateBySettingHour:7 minute:30 second:0 ofDate:[NSDate date] options:0];
    NSDate *amEnd = [calendar dateBySettingHour:8 minute:30 second:0 ofDate:[NSDate date] options:0];
    NSDate *pmStart = [calendar dateBySettingHour:18 minute:0 second:0 ofDate:[NSDate date] options:0];
    NSDate *pmEnd = [calendar dateBySettingHour:19 minute:0 second:0 ofDate:[NSDate date] options:0];
    
    // check for am journey start-time value
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"amStart"] == nil) {
        [[NSUserDefaults standardUserDefaults] setObject: amStart forKey: @"amStart"];
    }
    
    // check for am journey end-time value
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"amEnd"] == nil) {
        [[NSUserDefaults standardUserDefaults] setObject: amEnd forKey:@"amEnd"];
    }
    
    // check for pm journey start-time value
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"pmStart"] == nil) {
        [[NSUserDefaults standardUserDefaults] setObject: pmStart forKey:@"pmStart"];
    }
    
    // check for pm journey end-time value
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"pmEnd"] == nil) {
        [[NSUserDefaults standardUserDefaults] setObject: pmEnd forKey:@"pmEnd"];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
