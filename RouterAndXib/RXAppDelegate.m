//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXAppDelegate.h"
#import "RXRouter.h"


@implementation RXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[RXRouter alloc] initRouter];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
