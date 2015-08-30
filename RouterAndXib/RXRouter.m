//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXRouter.h"


@interface RXRouter ()
@end


@implementation RXRouter

- (instancetype)initRouter {
    UIViewController *rootViewController = [self createRootViewController];
    self = [super initWithRootViewController:rootViewController];
    if (self != nil) {
        [self navigationBar].hidden = YES;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return self;
}

- (UIViewController *)createRootViewController {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor blueColor];
    return controller;
}

@end
