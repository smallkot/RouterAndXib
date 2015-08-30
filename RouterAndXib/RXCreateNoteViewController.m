//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXCreateNoteViewController.h"
#import "RXNote.h"


@interface RXCreateNoteViewController ()

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end


@implementation RXCreateNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *saveNoteBBItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                      target:self
                                                                                      action:@selector(saveNote)];
    self.navigationItem.rightBarButtonItem = saveNoteBBItem;
}

- (void)saveNote {
    if (self.createNoteBlock == nil) {
        NSLog(@"no block: createNoteBlock");
        return;
    }
    
    NSString *text = self.noteTextView.text;
    RXNote *note = [[RXNote alloc] initWithText:text];
    self.createNoteBlock(note);
}

@end
