//
//  queue.h
//  BIO2008Q3
//
//  Created by Jono Muller on 28/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface queue : NSObject

@property NSMutableArray *stringArray;
@property NSMutableArray *numArray;

- (void)initialise;
- (void)enqueue:(id)object counter:(id)num storeLocation:(int)storeNum;

@end
