//
//  Created by ajjnix on 30/08/15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RXNote : NSObject

@property (copy, nonatomic, readonly) NSString *text;

- (instancetype)initWithText:(NSString *)text;

@end
