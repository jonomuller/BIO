//
//  queue.m
//  BIO2008Q3
//
//  Created by Jono Muller on 28/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import "queue.h"

@implementation queue

@synthesize stringArray, numArray;

- (void)initialise
{
    stringArray = [[NSMutableArray alloc] init];
//    stringArray = [NSMutableArray arrayWithCapacity:1000];
//    for (int i = 0; i < 1000; i++) {
//        [stringArray insertObject:[NSNull null] atIndex:i];
//    }
    numArray = [[NSMutableArray alloc] init];
}

- (void)enqueue:(id)str counter:(id)num storeLocation:(int)storeNum
{
    [stringArray addObject:[str mutableCopy]];
//    if ([stringArray objectAtIndex:storeNum] == [NSNull null]) {
//        [stringArray insertObject:[str mutableCopy] atIndex:storeNum];
//    }
    [numArray addObject:num];
}

@end
