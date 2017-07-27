//
//  AppDelegate.m
//  iosobjective-c0727
//
//  Created by bys on 27/07/2017.
//  Copyright © 2017 bys. All rights reserved.
//

#import "AppDelegate.h"
@import MobileCenter;
@import MobileCenterAnalytics;
@import MobileCenterCrashes;
@import MobileCenterPush;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MSMobileCenter start:@"bcf29384-9817-48a4-8ed0-608afefaa188" withServices:@[
                                                                                 [MSAnalytics class],
                                                                                 [MSCrashes class],
                                                                                 [MSPush class]
                                                                                 ]];
    [MSAnalytics trackEvent: @"applicationWillResignActive"];
    [MSAnalytics trackEvent: @"applicationDidEnterBackground"];
    [MSAnalytics trackEvent: @"applicationWillEnterForeground"];
  
    return YES;
}

- (void)push:(MSPush *)push didReceivePushNotification:(MSPushNotification *)pushNotification {
    NSString *message = pushNotification.message;
    for (NSString *key in pushNotification.customData) {
        message = [NSString stringWithFormat:@"%@\n%@: %@", message, key, [pushNotification.customData objectForKey:key]];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:pushNotification.title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
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
