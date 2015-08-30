//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXRouter.h"
#import "RXNoteListViewController.h"
#import "RXCreateNoteViewController.h"
#import "RXDetailNoteViewController.h"


@implementation RXRouter

- (instancetype)initRouter {
    UIViewController *rootViewController = [self createRootViewController];
    self = [super initWithRootViewController:rootViewController];
    if (self != nil) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return self;
}

- (UIViewController *)createRootViewController {
    RXNoteListViewController *noteListController = [[RXNoteListViewController alloc] init];
    __weak RXRouter *weakSelf = self;
    __weak RXNoteListViewController *weakNoteListController = noteListController;
    noteListController.createNoteBlock = ^{
        RXCreateNoteViewController *createNoteViewController = [weakSelf createNoteViewController];
        createNoteViewController.createNoteBlock = ^(RXNote *note){
            [weakNoteListController addNote:note];
            [weakSelf popViewControllerAnimated:YES];
        };
        [weakSelf pushViewController:createNoteViewController animated:YES];
    };
    noteListController.detailNoteBlock = ^(RXNote *note){
        RXDetailNoteViewController *detailNoteViewController = [weakSelf createDetailNoteViewControllerWithNote:note];
        [weakSelf pushViewController:detailNoteViewController animated:YES];
    };
    return noteListController;
}

- (RXCreateNoteViewController *)createNoteViewController {
    return [[RXCreateNoteViewController alloc] init];
}

- (RXDetailNoteViewController *)createDetailNoteViewControllerWithNote:(RXNote *)note {
    RXDetailNoteViewController *controller = [[RXDetailNoteViewController alloc] init];
    [controller showNote:note];
    return controller;
}

@end
