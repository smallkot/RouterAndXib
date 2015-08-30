//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RXNote;

typedef void (^RXNoteListViewControllerCreateNoteBlock)();
typedef void (^RXNoteListViewControllerDetailNoteBlock)(RXNote *note);


@interface RXNoteListViewController : UIViewController

@property (copy, nonatomic) RXNoteListViewControllerCreateNoteBlock createNoteBlock;
@property (copy, nonatomic) RXNoteListViewControllerDetailNoteBlock detailNoteBlock;

- (void)addNote:(RXNote *)note;

@end
