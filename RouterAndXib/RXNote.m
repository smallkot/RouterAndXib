//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "RXNote.h"


@interface RXNote ()

@property (copy, nonatomic, readwrite) NSString *text;

@end


@implementation RXNote

- (instancetype)initWithText:(NSString *)text {
    self = [super init];
    if (self != nil) {
        self.text = text;
    }
    return self;
}

@end
