//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXDetailNoteViewController.h"
#import "RXNote.h"


@interface RXDetailNoteViewController ()

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (strong, nonatomic) RXNote *note;

@end


@implementation RXDetailNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self showNote:self.note];
}

- (void)done {
    if (self.doneBlock == nil) {
        NSLog(@"no block: doneBlock");
        return;
    }
    
    self.doneBlock();
}


#pragma mark - Public

- (void)showNote:(RXNote *)note {
    self.note = note;
    self.noteTextView.text = note.text;
}

@end
