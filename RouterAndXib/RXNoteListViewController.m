//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXNoteListViewController.h"
#import "RXNote.h"


@interface RXNoteListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *noteTableView;
@property (strong, nonatomic) NSMutableArray *notes;

@end


@implementation RXNoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.notes = [NSMutableArray array];
    
    UIBarButtonItem *createNoteBBItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(createNote)];
    self.navigationItem.rightBarButtonItem = createNoteBBItem;
}

- (void)createNote {
    if (self.createNoteBlock == nil) {
        NSLog(@"no block: createNoteBlock");
        return;
    }
    
    self.createNoteBlock();
}

- (void)showDetailNote:(RXNote *)note {
    if (self.detailNoteBlock == nil) {
        NSLog(@"no block: detailNoteBlock");
        return;
    }
    
    self.detailNoteBlock(note);
}


#pragma mark - Public

- (void)addNote:(RXNote *)note {
    [self.notes addObject:note];
    [self.noteTableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    NSInteger row = [indexPath row];
    RXNote *note = self.notes[row];
    cell.textLabel.text = [note text];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    RXNote *note = self.notes[row];
    [self showDetailNote:note];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
